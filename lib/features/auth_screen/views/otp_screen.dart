import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nike_sneaker_store_app/core/widgets.dart';
import 'package:pinput/pinput.dart';

import '../../../core/const.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              "OTP Verification",
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
                "Please check your email to see the verification code",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: AppFonts.poppins, fontSize: 16),
              ),
            ),
            const SizedBox(height: 30),
            otpField(),
            const SizedBox(height: 30),
            SizedBox(
              width: Get.width * 0.88,
              child: AppWidgets.mainButton(
                onPressed: () {
                  // Handle OTP verification logic here
                },
                child: Text(
                  "Verify",
                  style: TextStyle(
                    fontFamily: AppFonts.ralway,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                backgroundColor: AppColors.primaryColor,
                foregroundColor: AppColors.varientWhite,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Spacer(),
                Text(
                  "Didn't receive the code?",
                  style: TextStyle(fontFamily: AppFonts.poppins, fontSize: 16),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    // Handle resend OTP logic here
                  },
                  child: Text(
                    "Resend",
                    style: TextStyle(
                      fontFamily: AppFonts.poppins,
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget otpField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "OTP Code",
          style: TextStyle(
            fontFamily: AppFonts.ralway,
            fontSize: 21,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 15),
        Pinput(
          separatorBuilder: (_) => const SizedBox(width: 10),
          defaultPinTheme: PinTheme(
            width: 72,
            height: 72,
            textStyle: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontFamily: AppFonts.poppins,
            ),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
