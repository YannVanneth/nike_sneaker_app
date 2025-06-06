import 'package:get/get.dart';
import 'package:nike_sneaker_store_app/routes/app_routes.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 5), () {
      Get.offNamed(AppRoutes.boardingScreen);
    });
  }
}
