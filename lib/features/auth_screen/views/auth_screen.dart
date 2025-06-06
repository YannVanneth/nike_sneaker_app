import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nike_sneaker_store_app/core/const.dart';
import 'package:nike_sneaker_store_app/features/auth_screen/views/forgot_password.dart';
import 'package:nike_sneaker_store_app/features/auth_screen/views/otp_screen.dart';
import 'package:nike_sneaker_store_app/features/auth_screen/views/register_screen.dart';

import '../controllers/auth_screen_controller.dart';
import 'login_screen.dart';

class AuthScreen extends GetView<AuthScreenController> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<AuthScreenController>(() => AuthScreenController());
    return Scaffold(
      backgroundColor: AppColors.varientWhite,
      appBar: appBar(),
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          LoginScreen(),
          RegisterScreen(),
          ForgotPassword(),
          OtpScreen(),
        ],
      ),
    );
  }

  ///
  /// AppBar for Auth Screen
  ///

  PreferredSizeWidget appBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.varientGray,
        ),
        onPressed: controller.back,
      ),
    );
  }
}
