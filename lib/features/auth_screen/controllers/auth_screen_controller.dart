import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nike_sneaker_store_app/routes/app_routes.dart';

class AuthScreenController extends GetxController {
  final currentPageIndex = 0.obs;
  final pageController = PageController();

  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>().obs;

  void handleLoginAction() {
    formKey.value.currentState?.validate();

    if (email.text.isEmpty || password.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill in all fields',
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    if (email.text == "admin@gmail.com" && password.text == "admin") {
      Get.snackbar(
        'Success',
        'Login successful',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        forwardAnimationCurve: Curves.elasticIn,
        snackPosition: SnackPosition.TOP,
      );
      navigateToHome();
    } else {
      Get.snackbar(
        'Error',
        'Invalid credentials',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  void handleGoogleSignIn() async {
    final GoogleSignInAccount? account =
        await GoogleSignIn(
          scopes: ['email', 'https://www.googleapis.com/auth/userinfo.profile'],
          clientId:
              "965022526414-n9dj22j73l090bpgu0qvaco8fd73bbf0.apps.googleusercontent.com",
          serverClientId:
              "965022526414-caqjhpeu2fqvri41p1beeluf8u8hhgbm.apps.googleusercontent.com",
        ).signIn();
    final GoogleSignInAuthentication? auth = await account?.authentication;

    final acessToken = auth?.idToken;

    final Dio dio = Dio();

    if (acessToken != null) {
      dio.get(
        'http://10.0.2.2:8080/auth/oauth2/google',
        options: Options(headers: {'Authorization': 'Bearer $acessToken'}),
      );
    } else {}
  }

  void navigateToHome() {
    Get.offAllNamed(AppRoutes.home);
  }

  void navigateToLogin() {
    currentPageIndex.value = 0;

    pageController.previousPage(
      curve: Curves.decelerate,
      duration: Duration(milliseconds: 300),
    );
  }

  void navigateToRegister() {
    currentPageIndex.value = 1;

    pageController.nextPage(
      curve: Curves.decelerate,
      duration: Duration(milliseconds: 300),
    );
  }

  void navigateToForgotPassword() {
    currentPageIndex.value = 2;

    pageController.animateToPage(
      2,
      curve: Curves.decelerate,
      duration: Duration(milliseconds: 300),
    );
  }

  void back() {
    pageController.animateToPage(
      currentPageIndex.value == 2 ? 0 : currentPageIndex.value - 1,
      curve: Curves.decelerate,
      duration: Duration(milliseconds: 300),
    );

    if (currentPageIndex.value == 2) {
      currentPageIndex.value = 0;
    } else {
      currentPageIndex.value--;
    }
  }

  void navigateToOtp() {
    currentPageIndex.value = 3;

    pageController.animateToPage(
      3,
      curve: Curves.decelerate,
      duration: Duration(milliseconds: 300),
    );
  }
}
