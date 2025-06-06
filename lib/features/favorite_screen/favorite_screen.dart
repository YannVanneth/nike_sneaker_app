import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nike_sneaker_store_app/core/assets.dart';
import 'package:nike_sneaker_store_app/core/widgets.dart';

import '../../data/data.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: Center(
        child: SizedBox(
          width: Get.width * 0.9,
          child: GridView.builder(
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
              return AppWidgets.favoriteProductCard(
                onPress: () {},
                productName: item["name"],
                price: "${item["currency_sign"]}${item["price"]}",
                imageUrl: item["image"] ?? AssetsResource.sneakersImage,
                isVertical: true,
              );
            },
          ),
        ),
      ),
    );
  }

  ///
  /// Appbar Widget
  ///

  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Icon(Icons.arrow_back_ios),
          Spacer(),
          Text("favorite"),
          Spacer(),
          Icon(Icons.favorite_border_outlined),
        ],
      ),
    );
  }
}
