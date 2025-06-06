import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nike_sneaker_store_app/routes/app_routes.dart';

class HomeController extends GetxController {
  final pageController = PageController().obs;

  void handleToProductDetailScreen() {
    Get.toNamed(AppRoutes.detailScreen);
  }

  void handleChangePage(int index) {
    pageController.value.animateToPage(
      index,
      duration: Duration(microseconds: 600),
      curve: Curves.bounceInOut,
    );
  }

  int getCurrentPage() {
    final page =
        pageController.value.hasClients ? pageController.value.page : null;
    return page?.round() ?? 0;
  }
}
