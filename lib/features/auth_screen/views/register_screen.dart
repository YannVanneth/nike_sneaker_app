import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nike_sneaker_store_app/core/assets.dart';
import 'package:nike_sneaker_store_app/core/const.dart';
import 'package:nike_sneaker_store_app/core/widgets.dart';

import '../controllers/auth_screen_controller.dart';

class RegisterScreen extends GetView<AuthScreenController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              "Register Account",
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
                "Fill your details or continue with social media",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: AppFonts.poppins, fontSize: 16),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(width: Get.width * 0.90, child: formFields()),
            Spacer(),
            RichText(
              text: TextSpan(
                text: "Already Have Account?",
                children: [
                  TextSpan(
                    text: " Login",
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = controller.navigateToLogin,
                  ),
                ],
                style: TextStyle(
                  color: AppColors.varientGray,
                  fontFamily: AppFonts.ralway,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  ///
  /// Form fields for Login Screen
  ///

  Widget formFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppWidgets.formFields(labelText: "Your Name", hintText: "XXXXXXX"),
        const SizedBox(height: 20),
        AppWidgets.formFields(
          labelText: "Email Address",
          hintText: "Enter your email",
        ),
        const SizedBox(height: 20),
        AppWidgets.formFields(labelText: "Password", obscureText: true),

        const SizedBox(height: 30),
        AppWidgets.mainButton(
          onPressed: () {},
          child: Text("Sign up"),
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.varientWhite,
        ),

        const SizedBox(height: 30),
        AppWidgets.mainButton(
          backgroundColor: Colors.grey.shade100,
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AssetsResource.googleLogo),
              const SizedBox(width: 10),
              Text("Sign up with Google"),
            ],
          ),
        ),
      ],
    );
  }
}
