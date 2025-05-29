import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lahakni_web/custom_widgets/auth_component.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../custom_widgets/custom_button.dart';
import '../../custom_widgets/custom_textfield.dart';
import '../../utils/app_strings.dart';
import '../sidemenu/sidemenu.dart';
import 'controller/auth_controller.dart';

class SendOtpScreen extends GetView<AuthController> {
  const SendOtpScreen({super.key});

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
              "Reset Password",
              style: AppStyles.blackTextStyle().copyWith(
                fontSize: 34,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Enter your email, we will send a verification \ncode to your email",
              style: AppStyles.blackTextStyle().copyWith(fontSize: 18,color: kBlackTextColor3,fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 57.h),
            CustomTextField(
              hintText: "Email",
              prefix: Padding(
                padding: EdgeInsets.only(left: 30.h,bottom: 8,top: 8,right: 8),
                child: SvgPicture.asset(kMailIcon),
              ),
              focusedFillColor: kSecondaryColor.withOpacity(0.1),
              fillColor: kWhiteColor,
              isFilled: true,
            ),
            SizedBox(height: 100),
            CustomButton(
              title: "Send Link",
              onTap: () {
                Get.toNamed(kVerifyOtpScreenRoute);
              },
            ),
          ],
        ),
      ),

    );
  }
}
