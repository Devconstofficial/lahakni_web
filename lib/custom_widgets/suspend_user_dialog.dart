import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lahakni_web/utils/app_images.dart';

import '../utils/app_strings.dart';
import '../utils/app_styles.dart';
import 'custom_button.dart';
import 'custom_dialog.dart';

Widget suspendDialog(){
  return CustomDialog(
    width: 646.w,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 27,),
          Container(
            height: 165,
            width: 179,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(kPersonImage1,fit: BoxFit.cover,)),
          ),
          SizedBox(height: 6,),
          Text(
            "Mehaik fatima",style: AppStyles.regularGilroyTextStyle().copyWith(
            fontSize: 29.sp,
          ),),
          Text(
            "Passenger",style: AppStyles.regularGilroyTextStyle().copyWith(
            fontSize: 20.sp,
          )),
          SizedBox(height: 33,),
          Center(
            child: Text(
              "Are You sure to Suspend This Passenger Profile?",style: AppStyles.semiBoldGilroyTextStyle().copyWith(
              fontSize: 24.sp,
              fontWeight: FontWeight.w400
            ),),
          ),
          SizedBox(height: 82,),
          CustomButton(title: "Suspend Profile", onTap: (){
            Get.back();
          },
            height: 78.h,
            width: 411.w,
          ),
          SizedBox(height: 90,),
        ],
      )
  );
}
