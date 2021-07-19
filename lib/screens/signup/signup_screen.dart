import 'package:akanke/screens/signup/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/app_image_picker.dart';
import '../../components/size_config.dart';

class SignupScreen extends StatelessWidget {
  static const String routeName = "/signup";

  SignupScreen({Key key}) : super(key: key);

  SignupForm signupForm = SignupForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  signupForm.dispose();
                  signupForm.imagePicker.showBottomSheet();
                },
                child: GetBuilder<ImagePickerController>(
                  builder: (controller) {
                    return Container(
                      width: getProportionateScreenHeight(94),
                      height: getProportionateScreenHeight(94),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: controller.image != null
                                ? FileImage(controller.image)
                                : AssetImage(
                                    "assets/icons/ic_image_upload.png"),
                          )),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              top: getProportionateScreenHeight(100),
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: Get.width,
                height: Get.height - getProportionateScreenHeight(100),
                child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(top: 20),
                    child: signupForm.form()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
