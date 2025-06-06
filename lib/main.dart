import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nike_sneaker_store_app/routes/app_routes.dart';

void main() => runApp(const Applications());

class Applications extends StatelessWidget {
  const Applications({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(getPages: appRoutes, initialRoute: AppRoutes.home);
  }
}
