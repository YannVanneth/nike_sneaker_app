import 'package:get/get.dart';

import '../controller/boarding_screen_controller.dart'
    show BoardingScreenController;

class BoardingScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BoardingScreenController());
  }
}
