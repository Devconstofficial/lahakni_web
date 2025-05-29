import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lahakni_web/custom_widgets/auth_component.dart';
import 'package:otp_text_field/style.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../custom_widgets/custom_button.dart';
import '../../custom_widgets/custom_textfield.dart';
import '../../utils/app_strings.dart';
import '../sidemenu/sidemenu.dart';
import 'controller/auth_controller.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';

class VerifyOtpScreen extends GetView<AuthController> {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: AuthComponent(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(kLogoImage, height: 86.h, width: 76.w),
                InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: Container(
                    height: 62,
                    width: 62,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: kWhiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: kGreyColor6.withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 22,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(child: Icon(Icons.close,color: kBlackTextColor2,size: 24,)),
                  ),
                )
              ],
            ),
            SizedBox(height: 28.h),
            Text(
              "Verification Code",
              style: AppStyles.blackTextStyle().copyWith(
                fontSize: 34,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Enter your email, we will Enter the verification code \nthat have sent to your email.",
              style: AppStyles.blackTextStyle().copyWith(fontSize: 18,color: kBlackTextColor3,fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 48.h),
            OTPTextField(
              length: 4,
              width: MediaQuery.of(context).size.width,
              textFieldAlignment: MainAxisAlignment.center,
              fieldWidth: 70,
              margin: EdgeInsets.only(left: 16),
              otpFieldStyle: OtpFieldStyle(enabledBorderColor: kBlackTextColor2,borderColor: kBlackTextColor2,focusBorderColor: kPrimaryColor,disabledBorderColor: kBlackTextColor2),
              fieldStyle: FieldStyle.box,
              contentPadding: EdgeInsets.symmetric(vertical: 25),
              outlineBorderRadius: 8.r,
              style: const TextStyle(fontSize: 17),
              onChanged: (pin) {

              },
              onCompleted: (pin) async {},
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                "Resend Code",
                style: AppStyles.blackTextStyle().copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 60),
            CustomButton(
              title: "Continue",
              onTap: () {
                Get.toNamed(kSetNewPassScreenRoute);
              },
            ),
          ],
        ),
      ),

    );
  }
}
