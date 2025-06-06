import 'package:get/get.dart';
import 'package:nike_sneaker_store_app/features/auth_screen/views/auth_screen.dart';
import 'package:nike_sneaker_store_app/features/auth_screen/views/login_screen.dart';
import 'package:nike_sneaker_store_app/features/auth_screen/views/otp_screen.dart';
import 'package:nike_sneaker_store_app/features/boarding_screen/bindings/boarding_screen_binding.dart';
import 'package:nike_sneaker_store_app/features/boarding_screen/views/boarding_screen.dart';
import 'package:nike_sneaker_store_app/features/detail_screen/views/detail_screen.dart';
import 'package:nike_sneaker_store_app/features/favorite_screen/favorite_screen.dart';
import 'package:nike_sneaker_store_app/features/home_screen/controllers/home_controller.dart';
import 'package:nike_sneaker_store_app/features/home_screen/home_screen.dart';
import 'package:nike_sneaker_store_app/features/splash_screen/views/splash_screen.dart';

import '../features/splash_screen/bindings/splash_screen_binding.dart';

abstract class AppRoutes {
  static const String splashScreen = '/';
  static const String boardingScreen = '/boarding_screen';
  static const String auth = '/auth';
  static const String authLogin = '/auth/login';
  static const String authRegister = '/auth/register';
  static const String authOTP = '/auth/OTP';
  static const String home = '/home';
  static const String detailScreen = '/detail_screen';
  static const String favoriteScreen = "/favorite_screen";
}

final appRoutes = [
  GetPage(
    name: AppRoutes.splashScreen,
    page: () => const SplashScreen(),
    binding: SplashScreenBinding(),
  ),
  GetPage(
    name: AppRoutes.boardingScreen,
    page: () => const BoardingScreen(),
    binding: BoardingScreenBinding(),
  ),

  GetPage(name: AppRoutes.auth, page: () => AuthScreen()),
  GetPage(name: AppRoutes.authLogin, page: () => LoginScreen()),
  GetPage(name: AppRoutes.authOTP, page: () => OtpScreen()),

  GetPage(
    name: AppRoutes.home,
    page: () => const HomeScreen(),
    binding: BindingsBuilder.put(() => HomeController()),
  ),
  GetPage(name: AppRoutes.detailScreen, page: () => const DetailScreen()),
  GetPage(name: AppRoutes.favoriteScreen, page: () => const FavoriteScreen()),
];
