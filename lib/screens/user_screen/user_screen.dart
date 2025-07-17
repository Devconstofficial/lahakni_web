import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lahakni_web/custom_widgets/custom_appBar_row.dart';
import 'package:lahakni_web/custom_widgets/custom_error_widget.dart';
import 'package:lahakni_web/custom_widgets/user_card.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import '../../custom_widgets/custom_pagination.dart';
import '../../utils/app_strings.dart';
import '../notifications/controller/notification_controller.dart';
import '../notifications/notification_screen.dart';
import '../sidemenu/sidemenu.dart';
import 'controller/user_controller.dart';

class UserScreen extends GetView<UserController> {
  UserScreen({super.key});
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
                            CustomAppbarRow(title: "Users"),
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
                                        // SizedBox(
                                        //   height: 44,
                                        //   width: 357,
                                        //   child: CustomTextField(
                                        //     hintText: "Search here...",
                                        //     // width: 357.w,
                                        //     prefix: Padding(
                                        //       padding: const EdgeInsets.all(
                                        //         12.0,
                                        //       ),
                                        //       child: SvgPicture.asset(
                                        //         kSearchIcon,
                                        //       ),
                                        //     ),
                                        //     contentPadding:
                                        //         EdgeInsets.symmetric(
                                        //           vertical: 6,
                                        //           horizontal: 10,
                                        //         ),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                    SizedBox(height: 24),
                                    Obx(() {
                                      if (controller.isLoading.value) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      } else if (controller.isError.value) {
                                        return CustomErrorWidget(
                                          title: controller.errorMsg.value,
                                          onTap: () {
                                            controller.getCustomers();
                                          },
                                        );
                                      } else if (controller
                                          .pagedUsers
                                          .isEmpty) {
                                        return Center(
                                          child: Text(
                                            "No users",
                                            style: AppStyles.blackTextStyle()
                                                .copyWith(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        );
                                      }

                                      final users = controller.pagedUsers;

                                      return Column(
                                        children: [
                                          GridView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: users.length,
                                            padding: const EdgeInsets.only(
                                              bottom: 24,
                                            ),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  crossAxisSpacing: 10.w,
                                                  mainAxisSpacing: 24.h,
                                                  childAspectRatio: 0.95,
                                                ),
                                            itemBuilder: (context, index) {
                                              final user = users[index];

                                              return UserCard(
                                                image: user.profileImage,
                                                name: user.username,
                                                status: user.role,
                                                totalRides:
                                                    user.totalRides.toString(),
                                                completedRides:
                                                    user.completed.toString(),
                                                canceledRides:
                                                    user.canceled.toString(),
                                                onViewProfile: () {
                                                  Get.toNamed(
                                                    kUserDetailScreenRoute,
                                                    arguments: user.id,
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                          SizedBox(height: 43),
                                          Obx(
                                            () => CustomPagination(
                                              currentPage:
                                                  controller.currentPage.value,
                                              visiblePages:
                                                  controller.visiblePageNumbers,
                                              onPrevious:
                                                  controller.goToPreviousPage,
                                              onNext: controller.goToNextPage,
                                              onPageSelected:
                                                  controller.goToPage,
                                            ),
                                          ),
                                        ],
                                      );
                                    }),

                                    SizedBox(height: 24),
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
              Obx(
                () => NotificationPanel(
                  show: notificationController.showNotification.value,
                  onClose:
                      () =>
                          notificationController.showNotification.value = false,
                  notifications: notificationController.notifications,
                ),
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
                "$percent% this week",
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
