import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lahakni_web/custom_widgets/custom_appBar_row.dart';
import 'package:lahakni_web/custom_widgets/custom_button.dart';
import 'package:lahakni_web/custom_widgets/custom_error_widget.dart';
import 'package:lahakni_web/custom_widgets/custom_image_widget.dart';
import 'package:lahakni_web/custom_widgets/custom_pagination.dart';
import 'package:lahakni_web/custom_widgets/detail_dialog.dart';
import 'package:lahakni_web/models/ride_report_model.dart';
import 'package:lahakni_web/screens/support/controller/support_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import '../sidemenu/sidemenu.dart';

class SupportScreen extends GetView<SupportController> {
  const SupportScreen({super.key});

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
                          left: 40.0.w,
                          top: 36.h,
                          right: 40.w,
                          bottom: 36.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomAppbarRow(title: "Support"),
                            SizedBox(height: 28),
                            Container(
                              height: (MediaQuery.of(context).size.height),
                              width: (MediaQuery.of(context).size.width),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                  color: kBlackColor.withOpacity(0.12),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: width,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: kGreyColor3),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Support Messages",
                                                style:
                                                    AppStyles.semiBoldGilroyTextStyle()
                                                        .copyWith(
                                                          fontSize: 20.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 24),
                                          Obx(() {
                                            if (controller.isLoading1.value) {
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            } else if (controller
                                                .isError1
                                                .value) {
                                              return CustomErrorWidget(
                                                title:
                                                    controller.errorMsg1.value,
                                                onTap: () {
                                                  controller
                                                      .getSupportMessages();
                                                },
                                              );
                                            } else if (controller
                                                .supportMessages
                                                .isEmpty) {
                                              return Center(
                                                child: Text(
                                                  "No messages",
                                                  style:
                                                      AppStyles.blackTextStyle()
                                                          .copyWith(
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                ),
                                              );
                                            }

                                            final messages =
                                                controller.supportMessages;

                                            return Column(
                                              children: [
                                                GridView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemCount: messages.length,
                                                  padding:
                                                      const EdgeInsets.only(
                                                        bottom: 24,
                                                      ),
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 4,
                                                        crossAxisSpacing: 24.w,
                                                        mainAxisSpacing: 24.h,
                                                        mainAxisExtent: 290.h,
                                                      ),
                                                  itemBuilder: (
                                                    context,
                                                    index,
                                                  ) {
                                                    final message =
                                                        messages[index];

                                                    return Container(
                                                      width:
                                                          (MediaQuery.of(
                                                            context,
                                                          ).size.width) /
                                                          3,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              10,
                                                            ),
                                                        border: Border.all(
                                                          color: kBlackColor
                                                              .withOpacity(
                                                                0.12,
                                                              ),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              vertical: 26.h,
                                                            ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets.symmetric(
                                                                    horizontal:
                                                                        19.w,
                                                                  ),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets.only(
                                                                          bottom:
                                                                              8.h,
                                                                        ),
                                                                    child: Row(
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              67,
                                                                          width:
                                                                              74,
                                                                          decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(
                                                                              14,
                                                                            ),
                                                                          ),
                                                                          child: ClipRRect(
                                                                            borderRadius: BorderRadius.circular(
                                                                              14,
                                                                            ),
                                                                            child: CustomImageWidget(
                                                                              imageUrl:
                                                                                  message.profileImage ??
                                                                                  "",
                                                                              height:
                                                                                  67,
                                                                              width:
                                                                                  74,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              7,
                                                                        ),
                                                                        Expanded(
                                                                          child: Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                message.name,
                                                                                maxLines:
                                                                                    1,
                                                                                style: AppStyles.semiBoldGilroyTextStyle().copyWith(
                                                                                  fontSize:
                                                                                      18.sp,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                message.email,
                                                                                style: AppStyles.regularGilroyTextStyle().copyWith(
                                                                                  fontSize:
                                                                                      14.sp,
                                                                                  fontWeight:
                                                                                      FontWeight.w400,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    message
                                                                        .message,
                                                                    maxLines: 3,
                                                                    style: AppStyles.regularGilroyTextStyle()
                                                                        .copyWith(
                                                                          fontSize:
                                                                              14.sp,
                                                                        ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 13,
                                                                  ),

                                                                  CustomButton(
                                                                    title:
                                                                        "View",
                                                                    onTap: () {
                                                                      Get.dialog(
                                                                        viewSupportDialog(
                                                                          context,
                                                                          message,
                                                                        ),
                                                                      );
                                                                    },
                                                                    height:
                                                                        56.h,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),

                                                SizedBox(height: 43),
                                              ],
                                            );
                                          }),
                                          SizedBox(height: 28),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 20.w,
                                              vertical: 25.h,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                              border: Border.all(
                                                color: kBlackColor.withOpacity(
                                                  0.12,
                                                ),
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Specific Ride Complaints",
                                                  style:
                                                      AppStyles.blackTextStyle()
                                                          .copyWith(
                                                            fontSize: 20.sp,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                ),
                                                SizedBox(height: 19.h),
                                                Obx(
                                                  () =>
                                                      controller.isLoading.value
                                                          ? Center(
                                                            child:
                                                                CircularProgressIndicator(),
                                                          )
                                                          : controller
                                                              .isError
                                                              .value
                                                          ? CustomErrorWidget(
                                                            title:
                                                                controller
                                                                    .errorMsg
                                                                    .value,
                                                            onTap: () {
                                                              controller
                                                                  .getRideIssues();
                                                            },
                                                          )
                                                          : controller
                                                              .pagedUsers
                                                              .isEmpty
                                                          ? Center(
                                                            child: Text(
                                                              "No complaints",
                                                              style: AppStyles.blackTextStyle()
                                                                  .copyWith(
                                                                    fontSize:
                                                                        15.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          )
                                                          : Column(
                                                            children: [
                                                              Stack(
                                                                children: [
                                                                  Container(
                                                                    height: 70,
                                                                    decoration: BoxDecoration(
                                                                      color: kGreyColor15
                                                                          .withOpacity(
                                                                            0.2,
                                                                          ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            12,
                                                                          ),
                                                                    ),
                                                                  ),

                                                                  SizedBox(
                                                                    width:
                                                                        width,
                                                                    child: DataTable(
                                                                      columnSpacing:
                                                                          0,
                                                                      headingRowHeight:
                                                                          70,
                                                                      dividerThickness:
                                                                          0,
                                                                      columns: [
                                                                        DataColumn(
                                                                          label: Flexible(
                                                                            child: Text(
                                                                              "Passenger Name",
                                                                              overflow:
                                                                                  TextOverflow.ellipsis,
                                                                              maxLines:
                                                                                  1,
                                                                              style: AppStyles.regularGilroyTextStyle().copyWith(
                                                                                fontSize:
                                                                                    16.sp,
                                                                                fontWeight:
                                                                                    FontWeight.w600,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        DataColumn(
                                                                          label: Flexible(
                                                                            child: Text(
                                                                              "Date",
                                                                              overflow:
                                                                                  TextOverflow.ellipsis,
                                                                              maxLines:
                                                                                  1,
                                                                              style: AppStyles.regularGilroyTextStyle().copyWith(
                                                                                fontSize:
                                                                                    16.sp,
                                                                                fontWeight:
                                                                                    FontWeight.w600,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        DataColumn(
                                                                          label: Flexible(
                                                                            child: Text(
                                                                              "Driver Name",
                                                                              overflow:
                                                                                  TextOverflow.ellipsis,
                                                                              maxLines:
                                                                                  1,
                                                                              style: AppStyles.regularGilroyTextStyle().copyWith(
                                                                                fontSize:
                                                                                    16.sp,
                                                                                fontWeight:
                                                                                    FontWeight.w600,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        DataColumn(
                                                                          label: Flexible(
                                                                            child: Text(
                                                                              "Driver ID",
                                                                              overflow:
                                                                                  TextOverflow.ellipsis,
                                                                              maxLines:
                                                                                  1,
                                                                              style: AppStyles.regularGilroyTextStyle().copyWith(
                                                                                fontSize:
                                                                                    16.sp,
                                                                                fontWeight:
                                                                                    FontWeight.w600,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        DataColumn(
                                                                          label: Flexible(
                                                                            child: Text(
                                                                              "Issue Type",
                                                                              overflow:
                                                                                  TextOverflow.ellipsis,
                                                                              maxLines:
                                                                                  1,
                                                                              style: AppStyles.regularGilroyTextStyle().copyWith(
                                                                                fontSize:
                                                                                    16.sp,
                                                                                fontWeight:
                                                                                    FontWeight.w600,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),

                                                                        DataColumn(
                                                                          headingRowAlignment:
                                                                              MainAxisAlignment.center,
                                                                          label: Flexible(
                                                                            child: Text(
                                                                              "Action",
                                                                              overflow:
                                                                                  TextOverflow.ellipsis,
                                                                              maxLines:
                                                                                  1,
                                                                              style: AppStyles.regularGilroyTextStyle().copyWith(
                                                                                fontSize:
                                                                                    16.sp,
                                                                                fontWeight:
                                                                                    FontWeight.w600,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                      rows:
                                                                          controller
                                                                              .pagedUsers
                                                                              .map(
                                                                                (
                                                                                  user,
                                                                                ) => _buildDataRow(
                                                                                  user,
                                                                                  context,
                                                                                ),
                                                                              )
                                                                              .toList(),
                                                                      dataRowMaxHeight:
                                                                          70,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 35.h,
                                                              ),
                                                              Obx(
                                                                () => CustomPagination(
                                                                  currentPage:
                                                                      controller
                                                                          .currentPage
                                                                          .value,
                                                                  visiblePages:
                                                                      controller
                                                                          .visiblePageNumbers,
                                                                  onPrevious:
                                                                      controller
                                                                          .goToPreviousPage,
                                                                  onNext:
                                                                      controller
                                                                          .goToNextPage,
                                                                  onPageSelected:
                                                                      controller
                                                                          .goToPage,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
    );
  }

  DataRow _buildDataRow(RideReportModel issue, context) {
    return DataRow(
      color: WidgetStateProperty.all(Colors.transparent),
      cells: [
        DataCell(
          Text(
            issue.customer == null
                ? "Unknown"
                : issue.customer!.name.isEmpty
                ? "Unknown"
                : issue.customer!.name,
            textAlign: TextAlign.center,
            style: AppStyles.blackTextStyle().copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        DataCell(
          Text(
            DateFormat('d.M.y').format(DateTime.parse(issue.createdAt)),
            textAlign: TextAlign.center,
            style: AppStyles.blackTextStyle().copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        DataCell(
          Text(
            issue.driver == null
                ? "Unknown"
                : issue.driver!.name.isEmpty
                ? "Unknown"
                : issue.driver!.name,
            textAlign: TextAlign.center,
            style: AppStyles.blackTextStyle().copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        DataCell(
          Text(
            issue.driverId,
            textAlign: TextAlign.center,
            style: AppStyles.blackTextStyle().copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        DataCell(
          Text(
            issue.reason,
            textAlign: TextAlign.center,
            style: AppStyles.blackTextStyle().copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
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
                  onTap: () {
                    Get.dialog(viewRideIssueDialog(context, issue));
                  },
                  child: Container(
                    height: 44,
                    width: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: kPrimaryColor),
                      color: kBlackColor,
                    ),
                    child: Center(
                      child: Text(
                        "View",
                        style: AppStyles.semiBoldGilroyTextStyle().copyWith(
                          fontSize: 13,
                          color: kWhiteColor,
                        ),
                      ),
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
