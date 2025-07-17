import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lahakni_web/custom_widgets/custom_error_widget.dart';
import 'package:lahakni_web/custom_widgets/custom_image_widget.dart';
import 'package:lahakni_web/screens/driver_screens/controller/driver_controller.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';
import 'custom_button.dart';
import 'custom_dialog.dart';
import 'custom_row.dart';

Widget customImageContainer(title, image) {
  return Container(
    height: 93,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: kBlackTextColor1.withOpacity(0.12)),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 4,
      children: [
        CustomImageWidget(imageUrl: image, height: 40, width: 40),

        Text(
          title,
          style: AppStyles.semiBoldGilroyTextStyle().copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}

Widget viewDriverDialog(context, String id) {
  double width = MediaQuery.of(context).size.width;
  final DriverController controller = Get.find();

  return CustomDialog(
    horPadding: 53,
    width: 626.w,
    content: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: Obx(
        () =>
            controller.isLoading1.value
                ? Center(child: CircularProgressIndicator())
                : controller.isError1.value
                ? CustomErrorWidget(
                  title: controller.errorMsg1.value,
                  onTap: () {
                    controller.getDriverDetail(id);
                  },
                )
                : controller.pagedUsers.isEmpty
                ? Center(
                  child: Text(
                    "No data found",
                    style: AppStyles.blackTextStyle().copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 30.h),
                    Container(
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: kBlackTextColor1.withOpacity(0.12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 53,
                          horizontal: 41,
                        ),
                        child: Column(
                          children: [
                            Row(
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
                                      imageUrl:
                                          controller
                                              .driverDetail
                                              .value
                                              .userImage,
                                      height: 130,
                                      width: 130,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 9),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.driverDetail.value.name,
                                        style:
                                            AppStyles.semiBoldGilroyTextStyle()
                                                .copyWith(fontSize: 24.sp),
                                      ),
                                      Text(
                                        controller.driverDetail.value.role,
                                        style:
                                            AppStyles.semiBoldGilroyTextStyle()
                                                .copyWith(fontSize: 16.sp),
                                      ),
                                      Text(
                                        controller
                                            .driverDetail
                                            .value
                                            .phoneNumber,
                                        style:
                                            AppStyles.semiBoldGilroyTextStyle()
                                                .copyWith(fontSize: 16.sp),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 39.h),
                    Container(
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: kBlackTextColor1.withOpacity(0.12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 53,
                          horizontal: 41,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 25.h,
                              children: [
                                Text(
                                  "Vehicle Details",
                                  style: AppStyles.semiBoldGilroyTextStyle()
                                      .copyWith(fontSize: 20.sp),
                                ),
                                customRow(
                                  "Car Plate Number",
                                  controller
                                      .driverDetail
                                      .value
                                      .driverDetails
                                      .first
                                      .vehicleNumber,
                                ),
                                customRow(
                                  "Car Model",
                                  controller
                                      .driverDetail
                                      .value
                                      .driverDetails
                                      .first
                                      .vehicleModel,
                                ),
                                customRow(
                                  "Issued State",
                                  controller
                                      .driverDetail
                                      .value
                                      .driverDetails
                                      .first
                                      .vehicleIssueState,
                                ),
                                customRow(
                                  "Vehicle Type",
                                  controller
                                      .driverDetail
                                      .value
                                      .driverDetails
                                      .first
                                      .vehicleType,
                                ),
                              ],
                            ),
                            SizedBox(height: 43),
                            Row(
                              spacing: 19.w,
                              children: [
                                Expanded(
                                  child: customImageContainer(
                                    "Front",
                                    controller
                                        .driverDetail
                                        .value
                                        .driverDetails
                                        .first
                                        .drivingLicenseFrontImage,
                                  ),
                                ),
                                Expanded(
                                  child: customImageContainer(
                                    "Back",
                                    controller
                                        .driverDetail
                                        .value
                                        .driverDetails
                                        .first
                                        .drivingLicenseBackImage,
                                  ),
                                ),
                                Expanded(
                                  child: customImageContainer(
                                    "Selfie",
                                    controller
                                        .driverDetail
                                        .value
                                        .driverDetails
                                        .first
                                        .selfieImage,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 25),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 65.h),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            title: "Reject",
                            onTap: () {
                              Get.back();
                              controller.rejectDriver(id);
                            },
                            color: kWhiteColor,
                            textColor: kPrimaryColor,
                            textSize: 16,
                            height: 66,
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Expanded(
                          child: CustomButton(
                            title: "Approve",
                            onTap: () {
                              Get.back();
                              controller.approveDriver(id);
                            },
                            height: 66,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
      ),
    ),
    showTitle: true,
    title: "Driver Documents",
  );
}
