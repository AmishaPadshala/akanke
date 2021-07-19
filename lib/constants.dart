import 'package:flutter/material.dart';

const kTitleColor = Color(0xFF000000);
const kTextColor = Color(0xFF292626);
const kTextLightColor = Color(0xFF808080);
const kAppColor = Color(0xFF0E75C4);
const kGreyLightColor = Color(0xFFEAEAEA);
const kAnimationDuration = Duration(milliseconds: 300);
const kSnackbarDuration = Duration(seconds: 3);

//Form field
enum FormFieldType {
  EMAIL,
  PWD,
  CONF_PWD,
  FNAME,
  LNAME,
  PHONE_NUM,
  ADDRESS,
  PIN
}

enum SignInType {
  GOOGLE,
  FACEBOOK,
  TWITTER,
  PHONE,
}

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kConfPassNullError = "Please confirm your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kFirstNameNullError = "Please Enter first name";
const String kLastNameNullError = "Please Enter last name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
