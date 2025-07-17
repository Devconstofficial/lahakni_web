import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahakni_web/custom_widgets/custom_image_widget.dart';
import 'package:lahakni_web/custom_widgets/custom_textfield.dart';
import 'package:lahakni_web/models/ride_report_model.dart';
import 'package:lahakni_web/models/support_model.dart';
import '../utils/app_styles.dart';
import 'custom_dialog.dart';

Widget viewSupportDialog(context, SupportModel message) {
  return CustomDialog(
    horPadding: 53,
    width: 626.w,
    content: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 30.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: CustomImageWidget(
                    imageUrl: "",
                    height: 130,
                    width: 130,
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                message.name,
                style: AppStyles.semiBoldGilroyTextStyle().copyWith(
                  fontSize: 24.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 39.h),
          CustomTextField(
            readOnly: true,
            hintText: "",
            controller: TextEditingController(text: message.email),
          ),

          SizedBox(height: 18.h),
          CustomTextField(
            maxLines: 4,
            readOnly: true,
            hintText: "",
            controller: TextEditingController(text: message.message),
          ),
        ],
      ),
    ),
    showTitle: true,
    title: "Support Message",
  );
}

Widget viewRideIssueDialog(context, RideReportModel issue) {
  return CustomDialog(
    horPadding: 53,
    width: 626.w,
    content: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 30.h),
          CustomTextField(
            readOnly: true,
            hintText: "",
            controller: TextEditingController(
              text:
                  issue.customer == null
                      ? "No email"
                      : issue.customer!.email.isEmpty
                      ? "No email"
                      : issue.customer!.email,
            ),
          ),
          SizedBox(height: 18.h),
          CustomTextField(
            readOnly: true,
            hintText: "",
            controller: TextEditingController(text: issue.reason),
          ),
          SizedBox(height: 18.h),
          CustomTextField(
            maxLines: 4,
            readOnly: true,
            hintText: "",
            controller: TextEditingController(text: issue.message),
          ),
        ],
      ),
    ),
    showTitle: true,
    title: "Ride Compliant",
  );
}
