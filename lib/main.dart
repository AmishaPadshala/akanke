import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';
import 'globals.dart';
import 'langue.dart';
import 'routes.dart';

void main() async {
  getInitialRoute();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String routeName = "/";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Akanke',
      translations: Langue(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      initialRoute: initialRoot,
      // defaultTransition: Transition.fadeIn,
      getPages: routes,
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: "Poppins",
          appBarTheme: AppBarTheme(
              elevation: 0,
              color: Colors.white,
              brightness: Brightness.light,
              iconTheme: IconThemeData(color: Colors.black),
              centerTitle: true,
              textTheme: TextTheme(
                  headline6: TextStyle(
                      color: kTitleColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold))),
          textTheme: TextTheme(
              bodyText1:
                  TextStyle(color: kTextColor, fontWeight: FontWeight.w100),
              bodyText2:
                  TextStyle(color: kTextColor, fontWeight: FontWeight.w100)),
          textSelectionTheme: TextSelectionThemeData(cursorColor: kTextColor),
          errorColor: Colors.red),
    );
  }
}
