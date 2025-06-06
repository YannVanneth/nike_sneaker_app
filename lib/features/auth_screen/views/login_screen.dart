import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nike_sneaker_store_app/core/assets.dart';
import 'package:nike_sneaker_store_app/core/core_export.dart';
import 'package:nike_sneaker_store_app/core/widgets.dart';

import '../controllers/auth_screen_controller.dart';

///
/// Login Screen UI
/// Issued date : 27th May 2025
///

class LoginScreen extends GetView<AuthScreenController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKey.value,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Text(
                "Hello Again!",
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
                  text: "New User?",
                  children: [
                    TextSpan(
                      text: " Create an account",
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = controller.navigateToRegister,
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
        AppWidgets.formFields(
          validate: (p0) {
            if (p0 == null || p0.isEmpty) {
              return "Email is required";
            }
            if (!GetUtils.isEmail(p0)) {
              return "Invalid email format";
            }
            return null;
          },
          controller: controller.email,
          labelText: "Email Address",
          hintText: "Enter your email",
        ),
        const SizedBox(height: 20),
        AppWidgets.formFields(
          validate: (p0) {
            if (p0 == null || p0.isEmpty) {
              return "Password is required";
            }
            if (p0.length < 6) {
              return "Password must be at least 6 characters";
            }
            return null;
          },
          controller: controller.password,
          labelText: "Password",
          obscureText: true,
        ),

        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: controller.navigateToForgotPassword,
              child: Text("Recovery Password"),
            ),
          ],
        ),
        const SizedBox(height: 20),
        AppWidgets.mainButton(
          onPressed: controller.handleLoginAction,
          child: Text("Sign In"),
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.varientWhite,
        ),

        const SizedBox(height: 30),
        AppWidgets.mainButton(
          backgroundColor: Colors.grey.shade100,
          onPressed: controller.handleGoogleSignIn,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AssetsResource.googleLogo),
              const SizedBox(width: 10),
              Text("Sign in with Google"),
            ],
          ),
        ),
      ],
    );
  }
}
