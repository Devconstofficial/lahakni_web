import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lahakni_web/custom_widgets/custom_button.dart';
import 'package:lahakni_web/screens/driver_screens/controller/driver_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import '../../custom_widgets/custom_dialog.dart';
import '../../custom_widgets/custom_pagination.dart';
import '../../custom_widgets/custom_textfield.dart';
import '../../custom_widgets/user_card.dart';
import '../../custom_widgets/viewDriverDialog.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../notifications/controller/notification_controller.dart';
import '../notifications/notification_screen.dart';
import '../sidemenu/sidemenu.dart';

class DriverScreen extends GetView<DriverController> {
  DriverScreen({super.key});

  final NotificationController notificationController = Get.put(NotificationController());



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
                            Obx(() => Container(
                              width: width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: kGreyColor, width: 0.3),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 33.h,horizontal: 25.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Driver Account Request",
                                          style: AppStyles.regularGilroyTextStyle()
                                              .copyWith(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 45,
                                          width: 331.w,
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
                                            hintSize: 11,
                                            textSize: 11,
                                            contentPadding: EdgeInsets.all(0),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 22.h,),
                                    Stack(
                                      children: [
                                        Container(
                                          height: 70,
                                          decoration: BoxDecoration(
                                            color: kGreyColor15.withOpacity(0.2),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width,
                                          child: DataTable(
                                            columnSpacing: 0,
                                            headingRowHeight: 70,
                                            dividerThickness: 0,
                                            columns: [
                                              DataColumn(label: Container(width: 50),columnWidth: FixedColumnWidth(50)),
                                              DataColumn(
                                                label: Flexible(
                                                  child: Text(
                                                    "Name",
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style:
                                                    AppStyles.regularGilroyTextStyle()
                                                        .copyWith(
                                                      fontSize: 16.sp,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Flexible(
                                                  child: Text(
                                                    "Role",
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style:
                                                    AppStyles.regularGilroyTextStyle()
                                                        .copyWith(
                                                      fontSize: 16.sp,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Flexible(
                                                  child: Text(
                                                    "Account Create Date",
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style:
                                                    AppStyles.regularGilroyTextStyle()
                                                        .copyWith(
                                                      fontSize: 16.sp,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              DataColumn(
                                                headingRowAlignment:
                                                MainAxisAlignment.center,
                                                label: Flexible(
                                                  child: Text(
                                                    "Stats",
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style:
                                                    AppStyles.regularGilroyTextStyle()
                                                        .copyWith(
                                                      fontSize: 16.sp,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              DataColumn(
                                                headingRowAlignment:
                                                MainAxisAlignment.center,
                                                label: Flexible(
                                                  child: Text(
                                                    "Actions",
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style:
                                                    AppStyles.regularGilroyTextStyle()
                                                        .copyWith(
                                                      fontSize: 16.sp,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                            rows: controller.pagedUsers
                                                .map((user) => _buildDataRow(
                                                user['name']!,
                                                user['role']!,
                                                user['createData']!,
                                                user['status'],
                                                user,
                                                context))
                                                .toList(),
                                            dataRowMaxHeight: 70,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 35.h,),
                                    Obx(() => CustomPagination(
                                      currentPage: controller.currentPage.value,
                                      visiblePages: controller.visiblePageNumbers,
                                      onPrevious: controller.goToPreviousPage,
                                      onNext: controller.goToNextPage,
                                      onPageSelected: controller.goToPage,
                                    )),

                                  ],
                                ),
                              ),
                            )),
                            SizedBox(height: 35.h,),

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
                                          "Active Drivers",
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
                                      final currentUsers = controller.pagedUsers1;

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
                                                        Get.toNamed(kDriverDetailScreenRoute);
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
                                    Obx(() => CustomPagination(
                                      currentPage: controller.currentPage1.value,
                                      visiblePages: controller.visiblePageNumbers1,
                                      onPrevious: controller.goToPreviousPage1,
                                      onNext: controller.goToNextPage1,
                                      onPageSelected: controller.goToPage1,
                                    )),
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

  DataRow _buildDataRow(String name, String role, String createDate ,String status, Map<String, dynamic> user, context) {

    return DataRow(
      color: WidgetStateProperty.all(Colors.transparent),
      cells: [
        DataCell(
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                user['isChecked'] = !user['isChecked'];
                controller.requests.refresh();
              },
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: kBlackColor.withOpacity(0.3),
                  ),
                ),
                child: user['isChecked']
                    ? Icon(Icons.check, size: 16, color: kBlackColor)
                    : null,
              ),
            ),
          ),
        ),
        DataCell(
            Text(
              name,
              textAlign: TextAlign.center,
              style: AppStyles.blackTextStyle()
                  .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
            )),
        DataCell(Text(
          role,
          textAlign: TextAlign.center,
          style: AppStyles.blackTextStyle()
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
        )),
        DataCell(Center(
          child: Text(
            createDate,
            textAlign: TextAlign.center,
            style: AppStyles.blackTextStyle()
                .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
          ),
        )),
        DataCell(
          Center(
            child: Container(
              height: 50,
              width: 138.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: kPrimaryColor.withOpacity(0.11),
              ),
              child: Center(
                child: Text(status,style: AppStyles.semiBoldGilroyTextStyle().copyWith(fontSize: 13,color: kPrimaryColor),),
              ),
            ),
          ),
        ),
        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: (){
                    Get.dialog(viewDriverDialog(context, user));
                  },
                  child: Container(
                    height: 44,
                    width: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: kPrimaryColor
                      ),
                      color: kWhiteColor,
                    ),
                    child: Center(
                      child: Text("View",style: AppStyles.semiBoldGilroyTextStyle().copyWith(fontSize: 13,color: kPrimaryColor),),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 14.w,),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: (){},
                  child: Container(
                    height: 44,
                    width: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: kPrimaryColor
                      ),
                      color: kPrimaryColor,
                    ),
                    child: Center(
                      child: Text("Approve",style: AppStyles.semiBoldGilroyTextStyle().copyWith(fontSize: 13,color: kWhiteColor),),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}
