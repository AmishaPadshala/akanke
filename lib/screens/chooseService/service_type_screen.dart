import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/app_default_button.dart';
import '../../components/size_config.dart';
import '../../constants.dart';
import '../onboarding/onboarding_screen.dart';
import 'app_video_player.dart';
import 'service_type_controller.dart';

class ServiceTypeScreen extends StatelessWidget {
  static const String routeName = "/serviceType";

  ServiceTypeScreen({Key key}) : super(key: key);

  ServiceTypeController serviceTypeController =
      Get.put(ServiceTypeController());

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
            child: Container(
              height: getProportionateScreenHeight(362),
              child: FractionallySizedBox(
                child: MyVideoPlayer(),
                heightFactor: 1,
                widthFactor:
                    ((getProportionateScreenHeight(362) * 1920) / 1080) /
                        Get.width,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: Get.width,
              height: getProportionateScreenHeight(454),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Padding(
                padding: EdgeInsets.only(top: 40),
                child: Column(
                  // 2 item , 1 button
                  children: [
                    buildOptions(
                        1, "assets/icons/ic_to-get-services.png", "Customer"),
                    buildOptions(
                        2, "assets/icons/ic_to-give-services.png", "Business"),
                    SizedBox(height: 20),
                    DefaultAppButton(
                      text: "Next",
                      onPress: () {
                        Get.toNamed(OnboardingScreen.routeName);
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }

  Widget buildOptions(int type, String icon, String text) {
    return GetBuilder<ServiceTypeController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            controller.type = type;
          },
          child: Stack(
            children: [
              Container(
                width: Get.width,
                height: getProportionateScreenHeight(126),
                decoration: BoxDecoration(
                    color: type == controller.type
                        ? kGreyLightColor
                        : Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      icon,
                      width: getProportionateScreenWidth(47),
                      height: getProportionateScreenWidth(45),
                    ),
                    Text(
                      text,
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 30,
                child: Container(
                  width: getProportionateScreenWidth(40),
                  height: getProportionateScreenHeight(126),
                  child: type == controller.type
                      ? Image.asset(
                          "assets/icons/ic_selected-Choice.png",
                          height: getProportionateScreenWidth(40),
                        )
                      : Container(
                          height: getProportionateScreenWidth(40),
                          decoration: BoxDecoration(
                              color: kGreyLightColor, shape: BoxShape.circle),
                        ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
