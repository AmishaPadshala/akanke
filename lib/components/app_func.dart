import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

void saveUserDetails() {}

Future getUserDetails() async {}

void removeUserDetails() {}

redirectAfterAuth(BuildContext context) {}

void showMessage(String msg) {
  Get.snackbar(msg, "",
      snackPosition: SnackPosition.BOTTOM, duration: kSnackbarDuration);
}

void showAlertDialog(BuildContext context, String title, String desc,
    String btnName, VoidCallback func) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            title: Text(title),
            content: Text(desc),
            actions: <Widget>[
              TextButton(
                child: Text(btnName),
                onPressed: func,
              ),
            ],
          ));
}
