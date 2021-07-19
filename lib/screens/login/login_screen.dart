import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/size_config.dart';
import '../../constants.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "/login";

  LoginScreen({Key key}) : super(key: key);

  List<String> socialLoginIcons = [
    "assets/icons/ic_facebook-login.png",
    "assets/icons/ic_apple-login.png",
    "assets/icons/ic_google-login.png"
  ];
  LoginForm loginForm = LoginForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                "assets/images/login-screen.png",
                width: Get.width,
                height: getProportionateScreenHeight(250),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  loginForm.dispose();
                  Get.back();
                },
                color: Colors.white,
              ),
            ),
            Positioned(
                top: getProportionateScreenHeight(250) - 25,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  width: Get.width,
                  height: Get.height - (getProportionateScreenHeight(250) - 25),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Login to continue",
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(22),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: getProportionateScreenHeight(58),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(socialLoginIcons.length,
                                  (index) {
                                return GestureDetector(
                                  onTap: () {
                                    loginForm.dispose();
                                  },
                                  child: Image.asset(
                                    socialLoginIcons[index],
                                    width: getProportionateScreenHeight(110),
                                  ),
                                );
                              })),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "or connect with your email",
                          style: TextStyle(
                              color: kTextLightColor,
                              fontSize: getProportionateScreenWidth(12),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        loginForm.form(),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
