import 'package:flutter/material.dart';

import '../constants.dart';
import 'size_config.dart';

class DefaultAppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final int version;
  const DefaultAppButton({Key key, this.text, this.onPress, this.version = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: getProportionateScreenHeight(58),
        decoration: BoxDecoration(
            color: version == 0 ? kAppColor : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: version == 0 ? kAppColor : kTextLightColor,
                width: version == 0 ? 0 : 1,
                style: BorderStyle.solid)),
        child: Center(
          child: Text(text,
              style: TextStyle(
                  color: version == 0 ? Colors.white : kTextColor,
                  fontSize: getProportionateScreenWidth(14),
                  fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}
