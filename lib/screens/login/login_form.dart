import 'package:akanke/components/app_default_button.dart';
import 'package:akanke/components/app_default_input_textfield.dart';
import 'package:akanke/components/size_config.dart';
import 'package:akanke/model/login_model.dart';
import 'package:akanke/repo/user_repo.dart';
import 'package:akanke/screens/chooseService/service_type_controller.dart';
import 'package:akanke/screens/forgotPassword/forgot_password_screen.dart';
import 'package:akanke/screens/map/map_screen.dart';
import 'package:akanke/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../globals.dart';

class LoginForm {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void dispose() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  Widget form() {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildEmailTextfield(),
            SizedBox(
              height: 15,
            ),
            buildPasswordTextfield(),
            SizedBox(
              height: 15,
            ),
            DefaultAppButton(
                text: "Login",
                onPress: () async {
                  if (_formKey.currentState.validate()) {
                    dispose();
                    _formKey.currentState.save();
                    await onLogin();
                  }
                }),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                dispose();
                Get.toNamed(ForgotPasswordScreen.routeName);
              },
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                    color: kTextLightColor,
                    fontSize: getProportionateScreenWidth(14),
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            DefaultAppButton(
                version: 1,
                text: "Create an account",
                onPress: () {
                  dispose();
                  Get.toNamed(SignupScreen.routeName);
                }),
          ],
        ));
  }

  Future onLogin() async {
    ServiceTypeController serviceTypeController =
        Get.find<ServiceTypeController>();

    LoginModel model = await UserRepo.login(
        email: emailController.text,
        password: passwordController.text,
        userType: serviceTypeController.type);

    if (model != null && model.data != null) {
      currentUser = model.data;
      Get.toNamed(MapScreen.routeName);
    }
  }

  DefaultAppInputTextfield buildPasswordTextfield() {
    return DefaultAppInputTextfield(
      type: FormFieldType.PWD,
      textInputAction: TextInputAction.done,
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
}
