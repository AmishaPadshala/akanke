import 'package:akanke/components/app_default_button.dart';
import 'package:akanke/components/app_default_input_textfield.dart';
import 'package:akanke/components/app_func.dart';
import 'package:akanke/components/app_image_picker.dart';
import 'package:akanke/components/size_config.dart';
import 'package:akanke/model/app_model.dart';
import 'package:akanke/repo/user_repo.dart';
import 'package:akanke/screens/chooseService/service_type_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class SignupForm {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  AppImagePicker imagePicker = AppImagePicker();

  Widget form() {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildFirstNameTextfield(),
            SizedBox(
              height: 15,
            ),
            buildLastNameTextfield(),
            SizedBox(
              height: 15,
            ),
            buildEmailTextfield(),
            SizedBox(
              height: 15,
            ),
            buildPasswordTextfield(),
            SizedBox(
              height: 15,
            ),
            buildConfirmPasswordTextfield(),
            SizedBox(
              height: 30,
            ),
            DefaultAppButton(
                text: "Signup",
                onPress: () async {
                  if (_formKey.currentState.validate()) {
                    if (imagePicker.imagePickerController.image == null) {
                      showMessage("Please select profile picture.");
                    } else {
                      dispose();
                      _formKey.currentState.save();
                      await onSignup();
                    }
                  }
                }),
            SizedBox(
              height: 20,
            ),
            buildFooter()
          ],
        ));
  }

  void dispose() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  Future onSignup() async {
    ServiceTypeController serviceTypeController =
        Get.find<ServiceTypeController>();

    AppModel model = await UserRepo.signup(
        email: emailController.text,
        password: passwordController.text,
        name: firstNameController.text + lastNameController.text,
        userType: serviceTypeController.type,
        filepath: imagePicker.imagePickerController.image.path);
    if (model != null && model.message != null) {
      showMessage(model.message);
      await Future.delayed(kSnackbarDuration);
      Get.back();
    }
  }

  Row buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account ! ",
          style: TextStyle(
              fontSize: getProportionateScreenWidth(14),
              fontWeight: FontWeight.w500),
        ),
        GestureDetector(
          onTap: () {
            dispose();
            Get.back();
          },
          child: Text(
            "Login",
            style: TextStyle(
                color: kAppColor,
                fontSize: getProportionateScreenWidth(14),
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  DefaultAppInputTextfield buildPasswordTextfield() {
    return DefaultAppInputTextfield(
      type: FormFieldType.PWD,
      textInputAction: TextInputAction.next,
      controller: passwordController,
    );
  }

  DefaultAppInputTextfield buildEmailTextfield() {
    return DefaultAppInputTextfield(
      type: FormFieldType.EMAIL,
      textInputAction: TextInputAction.next,
      controller: emailController,
    );
  }

  DefaultAppInputTextfield buildFirstNameTextfield() {
    return DefaultAppInputTextfield(
      type: FormFieldType.FNAME,
      textInputAction: TextInputAction.next,
      controller: firstNameController,
    );
  }

  DefaultAppInputTextfield buildLastNameTextfield() {
    return DefaultAppInputTextfield(
      type: FormFieldType.LNAME,
      textInputAction: TextInputAction.next,
      controller: lastNameController,
    );
  }

  DefaultAppInputTextfield buildConfirmPasswordTextfield() {
    return DefaultAppInputTextfield(
        type: FormFieldType.CONF_PWD,
        textInputAction: TextInputAction.done,
        controller: confirmPasswordController,
        password: passwordController.text);
  }
}
