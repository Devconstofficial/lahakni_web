import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lahakni_web/custom_widgets/custom_appBar_row.dart';
import 'package:lahakni_web/custom_widgets/custom_button.dart';
import 'package:lahakni_web/custom_widgets/custom_error_widget.dart';
import 'package:lahakni_web/utils/app_strings.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../notifications/controller/notification_controller.dart';
import '../sidemenu/sidemenu.dart';
import 'controller/ride_booking_controller.dart';

class RideBookingScreen extends GetView<RideBookingController> {
  RideBookingScreen({super.key});
  final NotificationController notificationController = Get.put(
    NotificationController(),
  );

  statusRow(text, Color color) {
    return Row(
      children: [
        CircleAvatar(radius: 4, backgroundColor: color),
        SizedBox(width: 8.w),
        Text(
          text,
          style: AppStyles.blackTextStyle().copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        // CommonCode.unFocus(context);
      },
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SideMenu(),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 50.0.w,
                        top: 36.h,
                        right: 50.w,
                        bottom: 36.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomAppbarRow(title: "Ride Booking"),
                          SizedBox(height: 28),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.78,
                            width: width,
                            decoration: BoxDecoration(
                              border: Border.all(color: kGreyColor3),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 37,
                                horizontal: 26,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ride History",
                                    style: AppStyles.semiBoldGilroyTextStyle()
                                        .copyWith(fontSize: 16.sp),
                                  ),
                                  SizedBox(height: 26.h),
                                  Expanded(
                                    child: Obx(() {
                                      if (controller.isLoading.value) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      } else if (controller.isError.value) {
                                        return CustomErrorWidget(
                                          title: controller.errorMsg.value,
                                          onTap: () {
                                            controller.getRides();
                                          },
                                        );
                                      } else if (controller.rides.isEmpty) {
                                        return Center(
                                          child: Text(
                                            "No rides history",
                                            style: AppStyles.blackTextStyle()
                                                .copyWith(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        );
                                      }
                                      return ListView.builder(
                                        itemCount: controller.rides.length,
                                        shrinkWrap: true,
                                        padding: EdgeInsets.all(0),
                                        itemBuilder: (context, index) {
                                          final ride = controller.rides[index];
                                          String formatRideDate(
                                            String createdAt,
                                          ) {
                                            DateTime dateTime =
                                                DateTime.parse(
                                                  createdAt,
                                                ).toLocal();
                                            return DateFormat(
                                              'hh:mma dd/MM',
                                            ).format(dateTime).toLowerCase();
                                          }

                                          return Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 20,
                                            ),
                                            child: Container(
                                              width: width,
                                              decoration: BoxDecoration(
                                                color: kGreyColor9,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: kBlackColor
                                                        .withOpacity(0.1),
                                                    offset: Offset(0, 4),
                                                    blurRadius: 10,
                                                    spreadRadius: 1,
                                                  ),
                                                ],
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                  17,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Column(
                                                              children: [
                                                                SvgPicture.asset(
                                                                  kCursorIcon,
                                                                  height: 24,
                                                                  width: 24,
                                                                ),
                                                                Image.asset(
                                                                  kLineImage,
                                                                  height: 30,
                                                                  width: 2,
                                                                ),
                                                                SvgPicture.asset(
                                                                  kLocationIcon,
                                                                  height: 24,
                                                                  width: 24,
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(width: 4),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  ride.from,
                                                                  style: AppStyles.regularGilroyTextStyle()
                                                                      .copyWith(
                                                                        fontSize:
                                                                            14.sp,
                                                                      ),
                                                                ),
                                                                SizedBox(
                                                                  height: 43.h,
                                                                ),
                                                                Text(
                                                                  ride.to,
                                                                  style: AppStyles.regularGilroyTextStyle()
                                                                      .copyWith(
                                                                        fontSize:
                                                                            14.sp,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              width: 50.w,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              spacing: 4,
                                                              children: [
                                                                Text(
                                                                  ride.status,
                                                                  style: AppStyles.semiBoldGilroyTextStyle()
                                                                      .copyWith(
                                                                        fontSize:
                                                                            14.sp,
                                                                        color:
                                                                            kGreenColor,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  "\$${ride.offeredFare}",
                                                                  style: AppStyles.semiBoldGilroyTextStyle()
                                                                      .copyWith(
                                                                        fontSize:
                                                                            14.sp,
                                                                        color:
                                                                            kGreenColor,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 9.h),
                                                        Text(
                                                          formatRideDate(
                                                            ride.createdAt,
                                                          ),
                                                          style:
                                                              AppStyles.regularGilroyTextStyle()
                                                                  .copyWith(
                                                                    fontSize:
                                                                        12.sp,
                                                                  ),
                                                        ),
                                                      ],
                                                    ),
                                                    CustomButton(
                                                      width: 175,
                                                      title: "View Details",
                                                      onTap: () {
                                                        Get.toNamed(
                                                          kRideDetailScreenRoute,
                                                          arguments: ride.id,
                                                        );
                                                      },
                                                      height: 45,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 32.w),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  customContainer(image, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 53,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: kBlackColor.withOpacity(0.2)),
          boxShadow: [
            BoxShadow(
              color: kBlackColor.withOpacity(0.2),
              blurRadius: 2,
              spreadRadius: 0,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Center(
          child: SvgPicture.asset(image, height: 24.h, width: 24.w),
        ),
      ),
    );
  }
}
