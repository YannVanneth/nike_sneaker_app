import 'package:awesome_drawer_bar/awesome_drawer_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nike_sneaker_store_app/core/assets.dart';
import 'package:nike_sneaker_store_app/core/core_export.dart';
import 'package:nike_sneaker_store_app/core/widgets.dart';
import 'package:nike_sneaker_store_app/data/data.dart';
import 'package:nike_sneaker_store_app/features/favorite_screen/favorite_screen.dart';

import 'controllers/home_controller.dart';

///
/// Home Screen for Nike Sneaker Store App
/// Design issued on 30th May 2025
///

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AwesomeDrawerBar(
        type: StyleState.scaleRotate,
        controller: controller.drawerController.value,
        menuScreen: _sideBar(),
        mainScreen: _home(),
        borderRadius: 24.0,
        showShadow: false,
        backgroundColor: Colors.grey.shade300,
        slideWidth: MediaQuery.of(context).size.width * 0.55,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.bounceIn,
      ),
    );
  }

  ///
  /// App Widget
  ///
  Widget _home() {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: controller.currentPageIndex.value == 1 ? null : _appBar(),
      body: PageView(
        controller: controller.pageController.value,

        children: [_body(), const FavoriteScreen()],
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  ///
  /// Side Bar
  ///
  Widget _sideBar() {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                  "https://avatars.githubusercontent.com/u/141898937?v=4?s=400",
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "Yann Vanneth",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: AppFonts.poppins,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              for (int i = 0; i < 5; i++)
                ListTile(
                  leading: Icon(Icons.car_crash, color: Colors.white),
                  title: Text(
                    "item $i",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: AppFonts.poppins,
                      color: Colors.white,
                    ),
                  ),
                  contentPadding: EdgeInsets.all(0),
                ),
              Divider(
                color: Colors.white,
                thickness: 5,
                radius: BorderRadius.all(Radius.circular(8)),
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.white),
                title: Text(
                  "Sign out",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: AppFonts.poppins,
                    color: Colors.white,
                  ),
                ),
                contentPadding: EdgeInsets.all(0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///
  /// AppBar for Home Screen
  ///

  PreferredSizeWidget _appBar() {
    return AppBar(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      title: Container(
        color: Colors.white,
        child: Row(
          children: [
            GestureDetector(
              onTap: controller.toggleDrawer,
              child: SvgPicture.asset(AssetsResource.hamburger, height: 24),
            ),
            Spacer(),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Text(
                  "Explore",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Positioned(
                  top: -7,
                  left: -15,
                  child: SvgPicture.asset(
                    AssetsResource.highlight_05,
                    height: 20,
                    colorFilter: ColorFilter.mode(
                      Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            SvgPicture.asset(AssetsResource.bag, height: 32),
          ],
        ),
      ),
    );
  }

  ///
  ///  Search Field for Home Screen
  ///

  Widget _searchField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppWidgets.searchField(
          height: 50,
          width: Get.width * 0.80,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SvgPicture.asset(AssetsResource.searchIcon, height: 24),
          ),
        ),
        const SizedBox(width: 15),
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            shape: BoxShape.circle,
          ),

          child: SvgPicture.asset(
            AssetsResource.slider,
            height: 24,
            width: 24,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ],
    );
  }

  ///
  /// Select Category Section
  ///

  Widget _selectCategorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Select Category",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 10,
            children: [
              ...List.generate((DATA['categories'] as List).length, (index) {
                return AppWidgets.categoryButton(
                  title: DATA['categories'][index]['name'],
                  isActive: index == 0,
                );
              }),
            ],
          ),
        ),
      ],
    );
  }

  ///
  /// Popular Products Section
  ///

  Widget _popularProductsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Popular Products",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See All",
                  style: TextStyle(color: AppColors.primaryColor, fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 10,
              children: List.generate((DATA['popular_shose'] as List).length, (
                index,
              ) {
                final item = DATA["popular_shose"][index];
                return AppWidgets.productCard(
                  onPress: controller.handleToProductDetailScreen,
                  productName: item["name"],
                  price: "${item["currency_sign"]}${item["price"]}",
                  imageUrl: item["image"] ?? AssetsResource.sneakersImage,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  ///
  /// New Arrivals Section
  ///

  Widget _newArrivalsProductsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "New Arrivals",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See All",
                  style: TextStyle(color: AppColors.primaryColor, fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          AppWidgets.newArrivalCard(),
        ],
      ),
    );
  }

  /// Recommended for Home Screen
  ///
  ///

  Widget _recommendSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Recomment Products",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See All",
                  style: TextStyle(color: AppColors.primaryColor, fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: Get.height - 240,
            width: Get.width,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: (DATA['popular_shose'] as List).length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                mainAxisExtent: 240,
              ),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final item = DATA["popular_shose"][index];
                return AppWidgets.productCard(
                  onPress: controller.handleToProductDetailScreen,
                  productName: item["name"],
                  price: "${item["currency_sign"]}${item["price"]}",
                  imageUrl: item["image"] ?? AssetsResource.sneakersImage,
                  isVertical: true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  ///
  /// Home Widget Body
  ///
  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          _searchField(),
          const SizedBox(height: 20),
          _selectCategorySection(),
          const SizedBox(height: 20),
          _popularProductsSection(),
          const SizedBox(height: 20),
          _newArrivalsProductsSection(),
          const SizedBox(height: 20),
          _popularProductsSection(),
          const SizedBox(height: 20),
          _recommendSection(),
        ],
      ),
    );
  }

  ///
  ///  Bottom Navigation Bar
  ///

  Widget _bottomNavigationBar() {
    return SizedBox(
      height: Get.height * 0.1,
      child: CurvedNavigationBar(
        buttonBackgroundColor: AppColors.primaryColor,
        color: AppColors.primaryColor,
        backgroundColor: Colors.transparent,
        items: [
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.favorite, size: 30, color: Colors.white),
          SvgPicture.asset(
            AssetsResource.bag,
            height: 30,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          Icon(Icons.notifications, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        onTap: controller.handleChangePage,
        index: controller.getCurrentPage(),
      ),
    );
  }
}
