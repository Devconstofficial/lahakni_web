import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lahakni_web/custom_widgets/custom_button.dart';
import 'package:lahakni_web/custom_widgets/user_card.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../custom_widgets/custom_textfield.dart';
import '../../utils/app_strings.dart';
import '../notifications/controller/notification_controller.dart';
import '../notifications/notification_screen.dart';
import '../sidemenu/sidemenu.dart';
import 'controller/user_controller.dart';

class UserScreen extends GetView<UserController> {
  UserScreen({super.key});
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
                                  "Users",
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
                            SizedBox(height: 28),
                            Container(
                              width: width,
                              decoration: BoxDecoration(
                                border: Border.all(color: kGreyColor3),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Active Passengers",
                                          style:
                                          AppStyles.semiBoldGilroyTextStyle()
                                              .copyWith(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Spacer(),
                                        SizedBox(
                                          height: 44,
                                          width: 357,
                                          child: CustomTextField(
                                            hintText: "Search here...",
                                            // width: 357.w,
                                            prefix: Padding(
                                              padding: const EdgeInsets.all(
                                                12.0,
                                              ),
                                              child: SvgPicture.asset(
                                                kSearchIcon,
                                              ),
                                            ),
                                            contentPadding:
                                            EdgeInsets.symmetric(
                                              vertical: 6,
                                              horizontal: 10,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 24),
                                    Obx(() {
                                      List<List<Map<String, String>>> userRows = [];
                                      final currentUsers = controller.pagedUsers;

                                      for (int i = 0; i < currentUsers.length; i += 3) {
                                        int end = (i + 3 < currentUsers.length) ? i + 3 : currentUsers.length;
                                        userRows.add(currentUsers.sublist(i, end));
                                      }

                                      return Column(
                                        children: userRows.map((row) {
                                          return Padding(
                                            padding: const EdgeInsets.only(bottom: 24),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: List.generate(row.length, (index) {
                                                final user = row[index];
                                                EdgeInsets padding = EdgeInsets.only(
                                                  left: index == 0 ? 0 : 10,
                                                  right: index == row.length - 1 ? 0 : 10,
                                                );

                                                return Expanded(
                                                  flex: 1,
                                                  child: Padding(
                                                    padding: padding,
                                                    child: UserCard(
                                                      image: user['image']!,
                                                      name: user['name']!,
                                                      status: user['status']!,
                                                      totalRides: user['totalRides']!,
                                                      completedRides: user['completedRides']!,
                                                      canceledRides: user['canceledRides']!,
                                                      paymentStatus: user['paymentStatus']!,
                                                      onViewProfile: () {
                                                        Get.toNamed(kUserDetailScreenRoute);
                                                      },
                                                    ),
                                                  ),
                                                );
                                              }),
                                            ),
                                          );
                                        }).toList(),
                                      );
                                    }),
                                    SizedBox(height: 43),

                                    Obx(() {
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: controller.goToPreviousPage,
                                            child: Container(
                                              height: 44,
                                              width: 115,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(100),
                                                border: Border.all(color: kBlackColor.withOpacity(0.08)),
                                              ),
                                              padding: const EdgeInsets.all(5),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  CircleAvatar(
                                                    radius: 16,
                                                    backgroundColor: kGreyColor8.withOpacity(0.5),
                                                    child: Transform.rotate(
                                                      angle: 3.1416,
                                                      child: const Icon(Icons.arrow_right_alt, size: 12),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Text("Previous", style: AppStyles.semiBoldGilroyTextStyle().copyWith(fontSize: 14)),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 18),
                                          ...controller.visiblePageNumbers.map((page) {
                                            final isSelected = controller.currentPage.value == page;
                                            return Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 5),
                                              child: GestureDetector(
                                                onTap: () => controller.goToPage(page),
                                                child: Container(
                                                  height: 30,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                    color: isSelected ? kBlackColor : Colors.transparent,
                                                    borderRadius: BorderRadius.circular(8),
                                                    border: Border.all(
                                                      color: isSelected ? kBlackColor : kBlackColor.withOpacity(0.08),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      page.toString(),
                                                      style: AppStyles.semiBoldGilroyTextStyle().copyWith(
                                                        fontSize: 14,
                                                        color: isSelected ? Colors.white : Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                          const SizedBox(width: 18),
                                          GestureDetector(
                                            onTap: controller.goToNextPage,
                                            child: Container(
                                              height: 44,
                                              width: 115,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(100),
                                                border: Border.all(color: kBlackColor.withOpacity(0.08)),
                                              ),
                                              padding: const EdgeInsets.all(5),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  CircleAvatar(
                                                    radius: 16,
                                                    backgroundColor: kGreyColor8.withOpacity(0.5),
                                                    child: const Icon(Icons.arrow_right_alt, size: 12),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Text("Next", style: AppStyles.semiBoldGilroyTextStyle().copyWith(fontSize: 14)),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                  ],
                                ),
                              ),
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

  insightContainer(
      String insights,
      String title,
      String image,
      String arrowIcon,
      String value,
      String percent,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          SizedBox(
            width: 198,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 6,
                  children: [
                    Text(
                      insights,
                      style: AppStyles.semiBoldGilroyTextStyle().copyWith(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      title,
                      style: AppStyles.regularGilroyTextStyle().copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: kWhiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: kBlackColor.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: SvgPicture.asset(image, height: 24, width: 24),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              SvgPicture.asset(arrowIcon, height: 20, width: 20),
              SizedBox(width: 8),
              Text(
                value,
                style: AppStyles.regularGilroyTextStyle().copyWith(
                  fontSize: 14.sp,
                  color: kGreyColor4,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 12),
              Text(
                "${percent}% this week",
                style: AppStyles.regularGilroyTextStyle().copyWith(
                  fontSize: 14.sp,
                  color: kGreyColor4,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
