import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lahakni_web/screens/auth/controller/auth_controller.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_strings.dart';
import '../utils/app_styles.dart';
import 'custom_button.dart';
import 'custom_textfield.dart';

class AuthComponent extends StatelessWidget {
  Widget content;
  AuthComponent({super.key,required this.content});

  AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 0,
              top: 0,
              child: SizedBox(
                  width: width / 4.5,
                  child: Image.asset(kAuthImage2,fit: BoxFit.contain,))),
          Positioned(
              left: 0,
              top: 35,
              child: SizedBox(
                  width: width / 4.8,
                  child: Image.asset(kAuthImage1,fit: BoxFit.cover,))),
          SizedBox(
            height: height,
            width: width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 120.h,left: 60.w),
                  child: Container(
                    height: height / 1.4,
                    width: width / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r),
                        color: kWhiteColor,
                        border: Border.all(
                            color: kBlackTextColor1.withOpacity(0.4)
                        )
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 68.h,horizontal: 74.w),
                        child: content,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              right: 44,
              top: 46,
              child: SvgPicture.asset(kDotsVerticalImage,width: 62,height: 101,)),
          Positioned(
              left: 88,
              bottom: 70,
              child: SvgPicture.asset(kDotsHoriImage,width: 130,height: 49,)),
          Positioned(
              right: 88,
              bottom: 70,
              child: SvgPicture.asset(kPlayImage,width: 90,height: 49,)),
        ],
      ),
    );
  }
}
