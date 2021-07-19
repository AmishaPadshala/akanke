import 'package:flutter/material.dart';

import '../../components/app_default_button.dart';
import '../../components/app_default_input_textfield.dart';
import '../../components/size_config.dart';
import '../../constants.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String routeName = "/forgotPassword";

  ForgotPasswordScreen({Key key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: SafeArea(
        child: forgotPasswordForm(context),
      ),
    );
  }

  Widget forgotPasswordForm(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Please enter email to\nreset password",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: getProportionateScreenWidth(18)),
            ),
            SizedBox(
              height: 30,
            ),
            buildEmailTextfield(),
            SizedBox(
              height: 50,
            ),
            DefaultAppButton(
                text: "Submit",
                onPress: () {
                  if (_formKey.currentState.validate()) {
                    dispose();
                    _formKey.currentState.save();
                  }
                }),
          ],
        ));
  }

  void dispose() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  DefaultAppInputTextfield buildEmailTextfield() {
    return DefaultAppInputTextfield(
      type: FormFieldType.EMAIL,
      textInputAction: TextInputAction.next,
      controller: emailController,
    );
  }
}
