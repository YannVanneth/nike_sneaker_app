import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nike_sneaker_store_app/core/assets.dart';
import 'package:nike_sneaker_store_app/core/const.dart';

abstract class AppWidgets {
  static Widget logo() {
    return SvgPicture.asset(AssetsResource.logo);
  }

  static Widget mainButton({
    required Function()? onPressed,
    required Widget child,
    ButtonStyle? style,
    Color? backgroundColor,
    Color? foregroundColor,
    double? width,
    double? height,
  }) {
    return SizedBox(
      height: height ?? 50,
      width: width ?? Get.width * 0.90,
      child: OutlinedButton(
        onPressed: onPressed,
        style:
            style ??
            OutlinedButton.styleFrom(
              side: BorderSide.none,
              backgroundColor: backgroundColor ?? AppColors.varientWhite,
              foregroundColor: foregroundColor ?? Colors.black,
              shape: ContinuousRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadiusGeometry.all(Radius.circular(24)),
              ),
            ),
        child: child,
      ),
    );
  }

  static Widget boardingPageIndicator({
    required int currentIndex,
    required int totalPages,
  }) {
    return Row(
      spacing: 5,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) => AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          width: currentIndex == index ? 64.0 : 38.0,
          height: 7.5,
          decoration: BoxDecoration(
            color:
                currentIndex == index ? AppColors.varientWhite : Colors.amber,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ),
    );
  }

  static Widget formFields({
    String? labelText,
    String? hintText,
    TextEditingController? controller,
    bool obscureText = false,
    TextInputType? keyboardType,
    Widget? prefixIcon,
    Widget? suffixIcon,
    Widget? suffix,
    Widget? prefix,
    String? Function(String?)? validate,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText ?? "Password",
          style: TextStyle(
            fontFamily: AppFonts.ralway,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          validator: validate,
          keyboardType: keyboardType,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            suffix: suffix,
            prefix: prefix,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,

            fillColor: Colors.grey.shade200,
            filled: true,
            labelText: hintText ?? "•••••••••",
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
      ],
    );
  }

  static Widget searchField({
    TextEditingController? controller,
    Function(String)? onChanged,
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    double? height,
    double? width,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          hintText: hintText ?? "Search...",
          prefixIcon: prefixIcon ?? Icon(Icons.search),
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  static categoryButton({
    required String title,
    Widget? child,
    Function()? onTap,
    bool isActive = false,
  }) {
    return OutlinedButton(
      onPressed: onTap,

      style: OutlinedButton.styleFrom(
        shadowColor: Colors.black,
        elevation: 1,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        side: BorderSide.none,
        backgroundColor:
            isActive ? AppColors.primaryColor : AppColors.varientWhite,
        foregroundColor: isActive ? AppColors.varientWhite : Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      child:
          child ??
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isActive ? Colors.white : Colors.black,
            ),
          ),
    );
  }

  static Widget productCard({
    required String productName,
    required String price,
    required String imageUrl,
    required Function()? onPress,
    bool isBestSeller = false,
    bool isVertical = false,
  }) {
    return GestureDetector(
      onTap: onPress,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            width: 180,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.rotate(
                  angle: -0.3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.contain,
                      height: 150,
                      width: 150,
                    ),
                  ),
                ),
                if (isBestSeller)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "BEST SELLER",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 5,
                  ),
                  child: Text(
                    productName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFonts.ralway,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                SizedBox(
                  width: 120,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      price,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                        fontFamily: AppFonts.poppins,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: IconButton(
              icon: Icon(Icons.favorite_border, color: Colors.red),
              onPressed: () {},
            ),
          ),
          Positioned(
            bottom: 0,
            right: isVertical ? 10 : 0,
            child: Container(
              padding: EdgeInsets.all(8.0),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),
              ),
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  static Widget newArrivalCard({
    String? eventName,
    String? eventImage,
    String? eventPercentageOFF,
  }) {
    return SizedBox(
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 110,
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            width: Get.width * 0.9,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12.0),
              color: AppColors.varientWhite,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          eventName ?? "New Arrival",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFonts.ralway,

                            color: AppColors.textPrimary,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 26),
                          child: Text(
                            eventPercentageOFF ?? "20% OFF",
                            style: TextStyle(
                              fontSize: 32,
                              color: AppColors.primaryColor,
                              fontFamily: AppFonts.futura,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  top: -50,
                  right: 30,
                  child: Stack(
                    children: [
                      Transform.rotate(
                        angle: -0.5,
                        child: Image.asset(
                          AssetsResource.airJordan,
                          width: 150,
                          height: 150,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 25,
                        child: Image.asset(
                          AssetsResource.ellipse03,
                          width: 120,
                        ),
                      ),
                      Positioned(
                        top: 60,
                        left: 0,
                        child: SvgPicture.asset(
                          AssetsResource.newVector,
                          height: 36,
                          width: 36,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  child: SvgPicture.asset(
                    AssetsResource.star,
                    height: 24,
                    width: 24,
                    colorFilter: ColorFilter.mode(
                      AppColors.textPrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 0,
                  child: SvgPicture.asset(
                    AssetsResource.star,
                    height: 24,
                    width: 24,
                    colorFilter: ColorFilter.mode(
                      AppColors.textPrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 60,
                  left: 0,
                  child: SvgPicture.asset(
                    AssetsResource.star,
                    height: 24,
                    width: 24,
                    colorFilter: ColorFilter.mode(
                      AppColors.textPrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 10,
                  left: 0,
                  child: SvgPicture.asset(
                    AssetsResource.star,
                    height: 24,
                    width: 24,
                    colorFilter: ColorFilter.mode(
                      AppColors.textPrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget favoriteProductCard({
    required String productName,
    required String price,
    required String imageUrl,
    required Function()? onPress,
    bool isBestSeller = false,
    bool isVertical = false,
  }) {
    return GestureDetector(
      onTap: onPress,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            width: 180,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.rotate(
                  angle: -0.3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.contain,
                      height: 150,
                      width: 150,
                    ),
                  ),
                ),
                if (isBestSeller)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "BEST SELLER",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 5,
                  ),
                  child: Text(
                    productName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFonts.ralway,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        price,
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                          fontFamily: AppFonts.poppins,
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: IconButton(
              icon: Icon(Icons.favorite_border, color: Colors.red),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
