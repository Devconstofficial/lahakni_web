import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lahakni_web/custom_widgets/custom_image_widget.dart';
import 'package:lahakni_web/models/customer_model.dart';
import 'package:lahakni_web/models/driver_detail_model.dart';
import 'package:lahakni_web/screens/driver_screens/controller/driver_controller.dart';
import 'package:lahakni_web/screens/user_screen/controller/user_controller.dart';
import '../utils/app_styles.dart';
import 'custom_button.dart';
import 'custom_dialog.dart';

Widget suspendDialog(CustomerModel user) {
  final UserController controller = Get.find();
  return CustomDialog(
    width: 646.w,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 27),
        Container(
          height: 165,
          width: 179,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: CustomImageWidget(
              imageUrl: user.profileImage,
              height: 165,
              width: 179,
            ),
          ),
        ),
        SizedBox(height: 6),
        Text(
          user.username,
          style: AppStyles.regularGilroyTextStyle().copyWith(fontSize: 29.sp),
        ),
        Text(
          user.role,
          style: AppStyles.regularGilroyTextStyle().copyWith(fontSize: 20.sp),
        ),
        SizedBox(height: 33),
        Center(
          child: Text(
            user.isSuspend == true
                ? "Are You sure to Reactivate This Passenger Profile?"
                : "Are You sure to Suspend This Passenger Profile?",
            style: AppStyles.semiBoldGilroyTextStyle().copyWith(
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 82),
        CustomButton(
          title:
              user.isSuspend == true ? "Reactivate Profile" : "Suspend Profile",
          onTap: () {
            controller.suspendCustomer(
              user.id,
              user.isSuspend == true ? false : true,
            );
          },
          height: 78.h,
          width: 411.w,
        ),
        SizedBox(height: 90),
      ],
    ),
  );
}

Widget suspendDriverDialog(DriverDetailModel user) {
  final DriverController controller = Get.find();
  return CustomDialog(
    width: 646.w,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 27),
        Container(
          height: 165,
          width: 179,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: CustomImageWidget(
              imageUrl: user.userImage,
              height: 165,
              width: 179,
            ),
          ),
        ),
        SizedBox(height: 6),
        Text(
          user.name,
          style: AppStyles.regularGilroyTextStyle().copyWith(fontSize: 29.sp),
        ),
        Text(
          user.role,
          style: AppStyles.regularGilroyTextStyle().copyWith(fontSize: 20.sp),
        ),
        SizedBox(height: 33),
        Center(
          child: Text(
            user.isSuspend == true
                ? "Are You sure to Reactivate This Driver Profile?"
                : "Are You sure to Suspend This Driver Profile?",
            style: AppStyles.semiBoldGilroyTextStyle().copyWith(
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 82),
        CustomButton(
          title:
              user.isSuspend == true ? "Reactivate Profile" : "Suspend Profile",
          onTap: () {
            controller.suspendDriver(
              user.userId,
              user.isSuspend == true ? false : true,
            );
          },
          height: 78.h,
          width: 411.w,
        ),
        SizedBox(height: 90),
      ],
    ),
  );
}
