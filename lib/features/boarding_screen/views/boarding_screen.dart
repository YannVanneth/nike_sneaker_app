import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nike_sneaker_store_app/core/assets.dart';
import 'package:nike_sneaker_store_app/core/core_export.dart';
import 'package:nike_sneaker_store_app/core/widgets.dart';

import '../controller/boarding_screen_controller.dart';

///
/// This is Boarding Screen Design
/// Design date on : 25th May 2025
///

class BoardingScreen extends GetView<BoardingScreenController> {
  const BoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: Center(
          child: PageView(
            controller: controller.pageController,
            onPageChanged: controller.changePageIndex,

            children: [Boarding01(), Boarding02(), Boarding03()],
          ),
        ),
      ),
    );
  }
}

///
/// First boarding page
/// Widget Boarding01()
///

class Boarding01 extends GetView<BoardingScreenController> {
  const Boarding01({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 100),
              Expanded(child: heroWidget()),
              button(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  ///
  /// The Widgets are used in first boarding page
  /// widgets used : titleText(), heroWidget(), button()
  ///

  Widget titleText() {
    return SizedBox(
      width: Get.width * 0.70,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Text(
            "Welcome To Nike".toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.varientWhite,
              fontFamily: AppFonts.ralway,
              fontWeight: FontWeight.w900,
              fontSize: 35,
            ),
          ),
          Positioned(
            top: -10,
            left: 10,
            child: SvgPicture.asset(AssetsResource.highlight_05),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: -25,
            child: SvgPicture.asset(AssetsResource.vector),
          ),
        ],
      ),
    );
  }

  Widget heroWidget() => Column(
    children: [
      titleText(),
      Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            width: Get.width,
            height: Get.height * 0.65,
            child: SvgPicture.asset(AssetsResource.heroVector),
          ),
          Positioned.fill(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  right: -90,
                  child: Transform.rotate(
                    angle: 6,
                    child: Image.asset(
                      AssetsResource.sneakersImage,
                      fit: BoxFit.cover,
                      height: Get.height * 0.50,
                    ),
                  ),
                ),

                Positioned(
                  bottom: 125,
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        AssetsResource.nikeVector,
                        fit: BoxFit.fill,
                        width: Get.width,
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 40,
                        child: Obx(
                          () => AppWidgets.boardingPageIndicator(
                            currentIndex: controller.currentPageIndex.value,
                            totalPages: 3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );

  Widget button() => AppWidgets.mainButton(
    height: 50,
    onPressed: controller.nextPage,
    child: Text("Get Started"),
  );
}

///
/// Second boarding page
/// Widget Boarding02()
///

class Boarding02 extends GetView<BoardingScreenController> {
  const Boarding02({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 50),
              Expanded(flex: 2, child: heroWidget()),
              button(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  ///
  /// The Widgets are used in second boarding page
  /// widgets used : titleText(), heroWidget(), button()
  ///

  Widget titleWidget() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SvgPicture.asset(AssetsResource.nikeVector, width: Get.width),
        SizedBox(
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: Get.width * 0.90,
                child: Text(
                  "Let’s Start Journey With Nike",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.varientWhite,
                    fontFamily: AppFonts.ralway,
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: Get.width * 0.70,
                child: Text(
                  "Smart, Gorgeous & Fashionable Collection Explor Now",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.varientWhite,
                    fontFamily: AppFonts.poppins,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => AppWidgets.boardingPageIndicator(
                  currentIndex: controller.currentPageIndex.value,
                  totalPages: 3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget heroWidget() => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Stack(
        clipBehavior: Clip.none,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                AssetsResource.springPreUI,
                height: Get.height * 0.35,
                width: Get.width,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: -10,
                left: 30,
                child: Image.asset(AssetsResource.ellipse03),
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 20,
            child: SizedBox(
              height: 130,
              width: 130,
              child: SvgPicture.asset(AssetsResource.highlight_10),
            ),
          ),
          Positioned(
            top: 0,
            right: 30,
            child: SizedBox(
              height: 55,
              width: 55,
              child: SvgPicture.asset(AssetsResource.smileVector),
            ),
          ),
        ],
      ),
      const SizedBox(height: 20),
      titleWidget(),
    ],
  );

  Widget button() => AppWidgets.mainButton(
    height: 50,
    onPressed: controller.nextPage,
    child: Text("Next"),
  );
}

///
/// Third boarding page
/// Widget Boarding03()
///

class Boarding03 extends GetView<BoardingScreenController> {
  const Boarding03({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 50),
              Expanded(flex: 2, child: heroWidget()),
              button(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  ///
  /// The Widgets are used in third boarding page
  /// widgets used : titleText(), heroWidget(), button()
  ///

  Widget titleWidget() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SvgPicture.asset(AssetsResource.nikeVector, width: Get.width),
        SizedBox(
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: Get.width * 0.90,
                child: Text(
                  "Let’s Start Journey With Nike",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.varientWhite,
                    fontFamily: AppFonts.ralway,
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: Get.width * 0.70,
                child: Text(
                  "Smart, Gorgeous & Fashionable Collection Explor Now",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.varientWhite,
                    fontFamily: AppFonts.poppins,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => AppWidgets.boardingPageIndicator(
                  currentIndex: controller.currentPageIndex.value,
                  totalPages: 3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget heroWidget() => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Stack(
        clipBehavior: Clip.none,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                left: 20,
                right: 20,
                child: SizedBox(
                  width: Get.width * 0.90,
                  height: Get.height * 0.35,
                  child: SvgPicture.asset(AssetsResource.ringVector),
                ),
              ),
              Positioned(
                child: Image.asset(
                  AssetsResource.airJordanNike,
                  height: Get.height * 0.35,
                  width: Get.width,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 50,
            child: SizedBox(
              height: 100,
              width: 100,
              child: SvgPicture.asset(AssetsResource.smileVector),
            ),
          ),
        ],
      ),
      titleWidget(),
    ],
  );

  Widget button() => AppWidgets.mainButton(
    height: 50,
    onPressed: controller.nextPage,
    child: Text("Next"),
  );
}
