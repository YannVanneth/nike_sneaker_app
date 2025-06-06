import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nike_sneaker_store_app/core/assets.dart';
import 'package:nike_sneaker_store_app/core/const.dart';
import 'package:nike_sneaker_store_app/core/widgets.dart';
import 'package:nike_sneaker_store_app/features/auth_screen/controllers/auth_screen_controller.dart';

class ForgotPassword extends GetView<AuthScreenController> {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              "Forgot Password",
              style: TextStyle(
                fontFamily: AppFonts.ralway,
                fontWeight: FontWeight.w700,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: Get.width * 0.6,
              child: Text(
                "Enter your Email account to reset your password",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: AppFonts.poppins, fontSize: 16),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(width: Get.width * 0.90, child: AppWidgets.formFields()),
            const SizedBox(height: 30),
            SizedBox(
              width: Get.width * 0.90,
              child: AppWidgets.mainButton(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: AppColors.varientWhite,
                onPressed: () {
                  Get.dialog(
                    barrierColor: Colors.grey.shade400.withOpacity(0.7),
                    emailDialog(),
                  );

                  Future.delayed(const Duration(seconds: 5), () {
                    Get.back();
                    controller.navigateToOtp();
                  });
                },
                child: Text("Reset password"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///
  /// email dialog
  ///

  Widget emailDialog() {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 80,
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                AssetsResource.emailIcon,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              "Check your email",
              style: TextStyle(
                fontFamily: AppFonts.ralway,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: Get.width * 0.7,
              child: Text(
                "We have send password recovery code in your email",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: AppFonts.poppins, fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
