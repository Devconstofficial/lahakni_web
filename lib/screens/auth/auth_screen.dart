import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lahakni_web/custom_widgets/auth_component.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../custom_widgets/custom_button.dart';
import '../../custom_widgets/custom_textfield.dart';
import '../../utils/app_strings.dart';
import 'controller/auth_controller.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthComponent(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(kLogoImage, height: 86.h, width: 76.w),
            SizedBox(height: 28.h),
            Text(
              "Welcome Back",
              style: AppStyles.blackTextStyle().copyWith(
                fontSize: 34,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Log in and pick up right where you left",
              style: AppStyles.blackTextStyle().copyWith(
                fontSize: 18,
                color: kBlackTextColor3,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 57.h),
            CustomTextField(
              controller: controller.emailLoginController,
              hintText: "Email",
              prefix: Padding(
                padding: EdgeInsets.only(
                  left: 30.h,
                  bottom: 8,
                  top: 8,
                  right: 8,
                ),
                child: SvgPicture.asset(kMailIcon),
              ),
              focusedFillColor: kSecondaryColor.withOpacity(0.1),
              fillColor: kWhiteColor,
              isFilled: true,
            ),
            SizedBox(height: 14),
            Obx(
              () => CustomTextField(
                controller: controller.passwordLoginController,
                hintText: "Password",
                isObscure: controller.isPasswordHidden.value,
                prefix: Padding(
                  padding: EdgeInsets.only(
                    left: 30.h,
                    bottom: 8,
                    top: 8,
                    right: 8,
                  ),
                  child: SvgPicture.asset(kLockIcon),
                ),
                suffix: Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: IconButton(
                    icon: Icon(
                      controller.isPasswordHidden.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      controller.togglePasswordVisibility();
                    },
                  ),
                ),
                focusedFillColor: kSecondaryColor.withOpacity(0.1),
                fillColor: kWhiteColor,
                isFilled: true,
              ),
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(kSendOtpScreenRoute);
                  },
                  child: Text(
                    "Forgot Password?",
                    style: AppStyles.blackTextStyle().copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 44),
            CustomButton(
              title: "Sign In",
              onTap: () {
                controller.login();
              },
            ),
          ],
        ),
      ),
    );
  }
}
