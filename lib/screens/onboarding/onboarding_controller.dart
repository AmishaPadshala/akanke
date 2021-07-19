import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PageSelectionController extends GetxController {
  int _index = 0; // 0 for Customer & 1 for Business

  List<Map<String, String>> _data = [
    {
      "text": "Find black owned products and services locally and online",
      "image": "assets/images/onboarding-screen_1.png"
    },
    {
      "text": "Make a black owned business recommendation or leave a review",
      "image": "assets/images/onboarding-screen_2.png"
    },
    {
      "text": "Directory of Black Owned Businesses",
      "image": "assets/images/onboarding-screen_3.png"
    },
  ];

  List<Map<String, String>> get data => _data;

  set index(int value) {
    _index = value;
    update();
  }

  int get index => _index; // 0 for Customer & 1 for Business

}
