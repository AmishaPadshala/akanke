import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ServiceTypeController extends GetxController {
  int _type = 1; // 1 for Customer (service) & 2 for Business(customer)
  set type(int value) {
    _type = value;
    update();
  }

  int get type => _type; // 0 for Customer & 1 for Business

}
