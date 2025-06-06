import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nike_sneaker_store_app/routes/app_routes.dart';

class BoardingScreenController extends GetxController {
  final currentPageIndex = 0.obs;
  final pageController = PageController();

  void changePageIndex(int index) {
    currentPageIndex.value = index;
  }

  void nextPage() {
    if (currentPageIndex.value < 2) {
      currentPageIndex.value++;
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.toNamed(AppRoutes.auth);
    }
  }
}
