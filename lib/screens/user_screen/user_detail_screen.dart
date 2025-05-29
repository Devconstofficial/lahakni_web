import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lahakni_web/custom_widgets/custom_button.dart';
import 'package:lahakni_web/custom_widgets/suspend_user_dialog.dart';
import 'package:lahakni_web/custom_widgets/user_card.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../custom_widgets/custom_textfield.dart';
import '../notifications/controller/notification_controller.dart';
import '../notifications/notification_screen.dart';
import '../sidemenu/sidemenu.dart';
import 'controller/user_controller.dart';

class UserDetailScreen extends GetView<UserController> {
  UserDetailScreen({super.key});
  final NotificationController notificationController = Get.put(NotificationController());

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

  Widget _buildLegend(Color color, String text) {
    return Row(
      children: [
        CircleAvatar(radius: 5, backgroundColor: color),
        SizedBox(width: 6),
        Text(text, style: AppStyles.regularGilroyTextStyle().copyWith(fontSize: 14.sp)),
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
                    child: SingleChildScrollView(
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
                            Row(
                              children: [
                                Text(
                                  "Passenger Profile Details",
                                  style: AppStyles.semiBoldGilroyTextStyle()
                                      .copyWith(
                                    fontSize: 32.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Spacer(),
                                customContainer(kNotiIcon, () {
                                  notificationController.showNotification.value = true;
                                }),
                                SizedBox(width: 9.w),
                                customContainer(kSettingsIcon, () {}),
                                SizedBox(width: 21.w),
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(color: kBlackColor),
                                  ),
                                  child: Image.asset(
                                    kPersonImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Kaleemullah",
                                      style: AppStyles.blackTextStyle()
                                          .copyWith(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      "Admin",
                                      style: AppStyles.blackTextStyle()
                                          .copyWith(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 21.w),
                              ],
                            ),
                            SizedBox(height: 25),
                            InkWell(
                              onTap: (){
                                Get.back();
                              },
                              child: Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                  color: kGreyColor9,
                                  borderRadius: BorderRadius.circular(4)
                                ),
                                child: Center(child: Icon(Icons.arrow_back_ios,size: 22,color: kBlackTextColor3,)),
                              ),
                            ),
                            SizedBox(height: 27),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  spacing: 24,
                                  children: [
                                    UserCard(
                                      image: kPersonImage1,
                                      name: "Zainab Tariq",
                                      status: "Passenger",
                                      totalRides: "20",
                                      completedRides: "10",
                                      canceledRides: "1",
                                      paymentStatus: "Completed",
                                      onViewProfile: () {
                                        Get.dialog(suspendDialog());
                                      },
                                      isUserDetail: true,
                                    ),
                                    Container(
                                      width: width / 4.2,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: kGreyColor3),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 35),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Payment",
                                              style: AppStyles.semiBoldGilroyTextStyle()
                                                  .copyWith(
                                                fontSize: 20.sp,
                                              ),
                                            ),
                                            Center(
                                              child: SizedBox(
                                                width: 208,
                                                height: 208,
                                                child: PieChart(
                                                  PieChartData(
                                                    sectionsSpace: 10,
                                                    centerSpaceRadius: 50,
                                                    startDegreeOffset: 270,
                                                    sections: [
                                                      PieChartSectionData(
                                                        color: kBlackColor,
                                                        value: 30,
                                                        radius: 18,
                                                        showTitle: false,
                                                      ),
                                                      PieChartSectionData(
                                                        color: kGreenColor,
                                                        value: 40,
                                                        radius: 18,
                                                        showTitle: false,
                                                      ),
                                                      PieChartSectionData(
                                                        color: kRedColor,
                                                        value: 30,
                                                        radius: 18,
                                                        showTitle: false,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 30.h),
                                            Row(
                                              children: [
                                                _buildLegend(kBlackColor, "Completed"),
                                                SizedBox(width: 20.w,),
                                                _buildLegend(kGreenColor, "Pending"),
                                                SizedBox(width: 20.w,),
                                                _buildLegend(kRedColor, "Canceled"),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(width: 32.w),
                                Expanded(
                                  child: Container(
                                    width: width,
                                    height: MediaQuery.of(context).size.height / 1.23,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: kGreyColor3),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 49,horizontal: 42),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Ride History",
                                              style: AppStyles.semiBoldGilroyTextStyle()
                                                  .copyWith(
                                                fontSize: 24.sp,
                                              ),
                                            ),
                                            SizedBox(height: 42.h,),
                                            ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: 5,
                                              physics: NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                              return Padding(
                                                padding: EdgeInsets.only(bottom: 24.h),
                                                child: Container(
                                                  width: width,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: kGreyColor3),
                                                    borderRadius: BorderRadius.circular(12),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 31),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Column(
                                                                  children: [
                                                                    SvgPicture.asset(kCursorIcon,height: 40,width: 40,),
                                                                    Image.asset(kLineImage,height: 34,width: 2,),
                                                                    SvgPicture.asset(kLocationIcon,height: 40,width: 40,),

                                                                  ],
                                                                ),
                                                                SizedBox(width: 4,),
                                                                Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Text(
                                                                      "Gbagi market, Iwo road",
                                                                      style: AppStyles.regularGilroyTextStyle()
                                                                          .copyWith(
                                                                        fontSize: 20.sp,
                                                                      ),
                                                                    ),
                                                                    SizedBox(height: 43.h,),
                                                                    Text(
                                                                      "Tulip Pharmacy, Oluwo",
                                                                      style: AppStyles.regularGilroyTextStyle()
                                                                          .copyWith(
                                                                        fontSize: 20.sp,
                                                                      ),
                                                                    ),

                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                            CustomButton(title: "Pending", onTap: (){},height: 50,width: 138.w,color: kPrimaryColor.withOpacity(0.11),borderColor: kWhiteColor,borderRadius: 100,)
                                                          ],
                                                        ),
                                                        SizedBox(height: 37.h,),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text(
                                                              "12:59pm 29/05",
                                                              style: AppStyles.regularGilroyTextStyle()
                                                                  .copyWith(
                                                                fontSize: 20.sp,
                                                              ),
                                                            ),
                                                            Text(
                                                              "Fare Bid \$200",
                                                              style: AppStyles.semiBoldGilroyTextStyle()
                                                                  .copyWith(
                                                                  fontSize: 20.sp,
                                                                  color: kGreenColor
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Obx(() => NotificationPanel(
                show: notificationController.showNotification.value,
                onClose: () => notificationController.showNotification.value = false,
                notifications: notificationController.notifications,
              )),
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
