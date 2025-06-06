import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nike_sneaker_store_app/core/core_export.dart';
import 'package:nike_sneaker_store_app/core/widgets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppWidgets.logo().fadeInUpBig(),
            Text(
              "Nike".toUpperCase(),
              style: TextStyle(
                color: AppColors.varientWhite,
                fontFamily: AppFonts.ralway,
                fontWeight: FontWeight.w700,
                fontSize: 65,
              ),
            ).elasticInUp(),
          ],
        ),
      ),
    );
  }
}
