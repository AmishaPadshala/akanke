import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import 'size_config.dart';

class DefaultAppInputTextfield extends StatelessWidget {
  final FormFieldType type;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final String password;
  final bool autoFocus;
  final FocusNode focusNode;
  final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(color: kTextLightColor),
    gapPadding: 10,
  );
  final OutlineInputBorder outlineErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(color: Colors.red),
    gapPadding: 10,
  );

  DefaultAppInputTextfield(
      {this.type,
      this.textInputAction,
      this.controller,
      this.autoFocus = false,
      this.focusNode,
      this.password = ""});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        //autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value.isEmpty) {
            return getNullError();
          } else if (password.isEmpty &&
              type == FormFieldType.PWD &&
              value.length < 8) {
            return kShortPassError;
          } else if (type == FormFieldType.EMAIL &&
              !emailValidatorRegExp.hasMatch(value)) {
            return kInvalidEmailError;
          } else if (password.isNotEmpty &&
              type == FormFieldType.CONF_PWD &&
              password != value) {
            return kMatchPassError;
          } else {
            return null;
          }
        },
        textCapitalization:
            type == FormFieldType.FNAME || type == FormFieldType.LNAME
                ? TextCapitalization.sentences
                : TextCapitalization.none,
        keyboardType: getTextInputType(),
        textInputAction: textInputAction,
        controller: controller,
        obscureText: isObscureText(),
        autofocus: autoFocus,
        focusNode: focusNode,
        textAlign:
            type == FormFieldType.PIN ? TextAlign.center : TextAlign.start,
        decoration: InputDecoration(
            labelText: getLabel(),
            hintText: getHintText(),
            labelStyle: TextStyle(
                color: kTextColor,
                fontWeight: FontWeight.w600,
                fontSize: getProportionateScreenWidth(14)),
            hintStyle: TextStyle(
                color: kTextLightColor,
                fontSize: getProportionateScreenWidth(14)),
            errorStyle: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w600,
                fontSize: getProportionateScreenWidth(14)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            alignLabelWithHint: true,
            contentPadding: type == FormFieldType.PIN
                ? null
                : EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            border: outlineInputBorder,
            errorBorder: outlineErrorBorder,
            focusedErrorBorder: outlineErrorBorder,
            suffixIcon: getSuffixIcon() != null
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                    child: SvgPicture.asset(
                      getSuffixIcon(),
                      width: getProportionateScreenWidth(16),
                    ),
                  )
                : null),
      ),
    );
  }

  bool isObscureText() {
    if (type == FormFieldType.PWD ||
        type == FormFieldType.CONF_PWD ||
        type == FormFieldType.PIN) {
      return true;
    } else {
      return false;
    }
  }

  String getLabel() {
    switch (type) {
      case FormFieldType.EMAIL:
        return "E-MAIL";
        break;
      case FormFieldType.PWD:
        return "PASSWORD";
        break;
      case FormFieldType.CONF_PWD:
        return "CONFIRM PASSWORD";
        break;
      case FormFieldType.FNAME:
        return "FIRST NAME";
        break;
      case FormFieldType.LNAME:
        return "LAST NAME";
        break;
      case FormFieldType.PHONE_NUM:
        return "Phone Number";
        break;
      case FormFieldType.ADDRESS:
        return "Address";
        break;
      default:
        break;
    }
    return "";
  }

  String getHintText() {
    switch (type) {
      case FormFieldType.EMAIL:
        return "Enter your email";
        break;
      case FormFieldType.PWD:
        return "Enter your password";
        break;
      case FormFieldType.CONF_PWD:
        return "Re-enter your password";
        break;
      case FormFieldType.FNAME:
        return "Enter your first name";
        break;
      case FormFieldType.LNAME:
        return "Enter your last name";
        break;
      case FormFieldType.PHONE_NUM:
        return "Enter your phone number";
        break;
      case FormFieldType.ADDRESS:
        return "Enter your address";
        break;
      default:
        break;
    }
    return "";
  }

  String getSuffixIcon() {
    // switch (type) {
    //   case FormFieldType.EMAIL:
    //     return "assets/icons/Mail.svg";
    //     break;
    //   case FormFieldType.PWD:
    //     return "assets/icons/Lock.svg";
    //     break;
    //   case FormFieldType.CONF_PWD:
    //     return "assets/icons/Lock.svg";
    //     break;
    //   case FormFieldType.FNAME:
    //   case FormFieldType.LNAME:
    //     return "assets/icons/User.svg";
    //     break;
    //   case FormFieldType.PHONE_NUM:
    //     return "assets/icons/Phone.svg";
    //     break;
    //   case FormFieldType.ADDRESS:
    //     return "assets/icons/Location point.svg";
    //     break;
    //   default:
    //     break;
    // }
    return null;
  }

  TextInputType getTextInputType() {
    switch (type) {
      case FormFieldType.EMAIL:
        return TextInputType.emailAddress;
        break;
      case FormFieldType.PWD:
        return TextInputType.visiblePassword;
        break;
      case FormFieldType.CONF_PWD:
        return TextInputType.visiblePassword;
        break;
      case FormFieldType.FNAME:
      case FormFieldType.LNAME:
        return TextInputType.name;
        break;
      case FormFieldType.PHONE_NUM:
        return TextInputType.phone;
        break;
      case FormFieldType.ADDRESS:
        return TextInputType.streetAddress;
        break;
      case FormFieldType.PIN:
        return TextInputType.number;
        break;
    }
    return TextInputType.text;
  }

  String getNullError() {
    switch (type) {
      case FormFieldType.EMAIL:
        return kEmailNullError;
        break;
      case FormFieldType.PWD:
        return kPassNullError;
        break;
      case FormFieldType.CONF_PWD:
        return kConfPassNullError;
        break;
      case FormFieldType.FNAME:
        return kFirstNameNullError;
        break;
      case FormFieldType.LNAME:
        return kLastNameNullError;
        break;
      case FormFieldType.PHONE_NUM:
        return kPhoneNumberNullError;
        break;
      case FormFieldType.ADDRESS:
        return kAddressNullError;
        break;
      default:
        break;
    }
    return "";
  }
}
