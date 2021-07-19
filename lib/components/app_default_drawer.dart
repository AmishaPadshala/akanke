import 'package:akanke/api/api_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../globals.dart';
import 'size_config.dart';

class DefaultAppDrawer extends StatelessWidget {
  DefaultAppDrawer({Key key}) : super(key: key);

  List<Map<String, String>> options = [
    {"title": "About Us", "icon": "assets/icons/ic_about-us.png"},
    {"title": "Terms & Conditions", "icon": "assets/icons/ic_t&c.png"},
    {"title": "Privacy Policy", "icon": "assets/icons/ic_privacy-policy.png"},
    {"title": "Logout", "icon": "assets/icons/ic_logout.png"},
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: getProportionateScreenWidth(318),
        child: Drawer(
          child: Column(
            children: [
              buildDrawerHeader(),
              Expanded(
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: options.length - 1,
                    itemBuilder: (context, index) {
                      return buildOption(
                          options[index]["title"], options[index]["icon"]);
                    }),
              ),
              Spacer(),
              buildOption(options[options.length - 1]["title"],
                  options[options.length - 1]["icon"]),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOption(String title, String icon) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
            color: kTitleColor, fontSize: getProportionateScreenWidth(16)),
      ),
      leading: Image.asset(
        icon,
        width: getProportionateScreenWidth(25),
      ),
      horizontalTitleGap: 0,
      contentPadding: EdgeInsets.symmetric(horizontal: 25),
    );
  }

  Widget buildDrawerHeader() {
    return DrawerHeader(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(color: kAppColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  width: getProportionateScreenHeight(94),
                  height: getProportionateScreenHeight(94),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: currentUser != null &&
                                  currentUser.user.profilePicture != null
                              ? NetworkImage(APIRoute.smallImageUrl +
                                  currentUser.user.profilePicture)
                              : AssetImage("assets/icons/ic_image_upload.png"),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          softWrap: false,
                          text: TextSpan(
                              text: currentUser != null
                                  ? currentUser.user.name
                                  : "",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: getProportionateScreenWidth(18),
                                  fontWeight: FontWeight.w500),
                              children: [
                                TextSpan(
                                    text: currentUser != null
                                        ? "\n" + currentUser.user.email
                                        : "",
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize:
                                            getProportionateScreenWidth(14),
                                        fontWeight: FontWeight.w100))
                              ])),
                      SizedBox(
                        height: 5,
                      ),
                      Text("View Profile",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: getProportionateScreenWidth(14)))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
