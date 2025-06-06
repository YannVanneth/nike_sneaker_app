import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nike_sneaker_store_app/core/assets.dart';
import 'package:nike_sneaker_store_app/core/core_export.dart';
import 'package:nike_sneaker_store_app/core/widgets.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width * 0.75,
                child: Text(
                  "Nike Air Max 270 Essential",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 2),

              Text("Man's Shoes", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 5),
              Text(
                "\$179.8",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              _heroWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
        color: Colors.transparent,
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ),
            AppWidgets.mainButton(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
              width: Get.width * 0.6,
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AssetsResource.bag,
                    colorFilter: ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text("Add to Cart"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///
  /// AppBar for Detail Screen
  ///
  PreferredSizeWidget _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Icon(Icons.arrow_back_ios, color: Colors.black),

          Spacer(),
          const Text(
            'Sneaker Shop',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          Spacer(),
          SvgPicture.asset(AssetsResource.bag),
        ],
      ),
    );
  }

  ///
  /// Hero widget for product image
  ///
  Widget _heroWidget() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          height: Get.height * 0.35,
          width: Get.width,
          child: Transform.rotate(
            angle: -0.3,
            child: Image.asset(
              AssetsResource.airJordan,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 56,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                clipBehavior: Clip.hardEdge,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Transform.rotate(
                  angle: -0.3,
                  child: Image.asset(
                    AssetsResource.airJordan,
                    fit: BoxFit.contain,
                    width: 56,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 10),
            itemCount: 10,
          ),
        ),
        // Description Section
        const SizedBox(height: 20),
        Column(
          children: [
            Text(
              "The Max Air 270 unit delivers unrivaled, all-day comfort. The sleek, running-inspired design roots you to everything Nike........",

              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: Get.width,
              child: Text(
                "Read More",
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 16, color: AppColors.primaryColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
