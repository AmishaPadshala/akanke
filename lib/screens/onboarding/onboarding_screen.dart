import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/app_default_button.dart';
import '../../components/size_config.dart';
import '../../constants.dart';
import '../login/login_screen.dart';
import 'onboarding_controller.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key key}) : super(key: key);
  static const String routeName = "/onboarding";

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  PageSelectionController pageSelectionController =
      Get.put(PageSelectionController());
  PageController pageController = PageController();

  AnimationController animationController;
  Animation<double> _fadeInFadeOut;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: kAnimationDuration,
    );
    _fadeInFadeOut =
        Tween<double>(begin: 0.0, end: 1).animate(animationController);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward(from: 0);
    return Scaffold(
      body: SafeArea(child: GetBuilder<PageSelectionController>(
        builder: (controller) {
          return PageView.builder(
              onPageChanged: (value) {
                animationController.forward(from: 0);
                controller.index = value;
              },
              controller: pageController,
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: buildImage(controller),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: Get.width,
                        height: getProportionateScreenHeight(325),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40))),
                        child: Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // 2 item , 1 button
                            children: [
                              Expanded(
                                flex: 2,
                                child: buildText(controller),
                              ),
                              Expanded(
                                flex: 1,
                                child: buildPagination(controller),
                              ),
                              Expanded(
                                flex: 3,
                                child: buildButtons(controller),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              });
        },
      )),
    );
  }

  Widget buildImage(PageSelectionController controller) {
    return FadeTransition(
      opacity: _fadeInFadeOut,
      child: Container(
          height: getProportionateScreenHeight(485),
          child: Image.asset(
            controller.data[controller.index]["image"],
            fit: BoxFit.fitWidth,
          )),
    );
  }

  Column buildButtons(PageSelectionController controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DefaultAppButton(
          text:
              controller.index == controller.data.length - 1 ? "Done" : "Next",
          onPress: () {
            if (pageSelectionController.index ==
                pageSelectionController.data.length - 1) {
              Get.toNamed(LoginScreen.routeName);
            } else {
              pageController.nextPage(
                duration: kAnimationDuration,
                curve: Curves.ease,
              );
            }
          },
        ),
        SizedBox(height: 10),
        Visibility(
          visible:
              controller.index == controller.data.length - 1 ? false : true,
          child: DefaultAppButton(
            text: "Skip",
            version: 1,
            onPress: () {
              Get.toNamed(LoginScreen.routeName);
            },
          ),
        ),
      ],
    );
  }

  Row buildPagination(PageSelectionController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          controller.data.length,
          (index) => AnimatedContainer(
                duration: kAnimationDuration,
                margin: EdgeInsets.only(
                    right: index == controller.data.length - 1 ? 0 : 10),
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                    color: index == controller.index ? kAppColor : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: kAppColor, width: 1, style: BorderStyle.solid)),
              )),
    );
  }

  Container buildText(PageSelectionController controller) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        controller.data[controller.index]["text"],
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
