import 'package:awesome_drawer_bar/awesome_drawer_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nike_sneaker_store_app/routes/app_routes.dart';

class HomeController extends GetxController {
  final pageController = PageController().obs;
  final drawerController = AwesomeDrawerBarController().obs;
  final currentPageIndex = 0.obs;

  void handleToProductDetailScreen() {
    Get.toNamed(AppRoutes.detailScreen);
  }

  void handleChangePage(int index) {
    pageController.value.animateToPage(
      index,
      duration: Duration(microseconds: 600),
      curve: Curves.bounceInOut,
    );

    Future.delayed(
      Duration(milliseconds: 50),
    ).then((_) => currentPageIndex(index));
  }

  void toggleDrawer() {
    drawerController.value.toggle!();
  }

  int getCurrentPage() {
    return currentPageIndex.value;
  }
}
