import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lahakni_web/custom_widgets/custom_button.dart';
import 'package:lahakni_web/custom_widgets/custom_dialog.dart';
import 'package:lahakni_web/custom_widgets/custom_textfield.dart';
import 'package:lahakni_web/custom_widgets/vehicle_card.dart';
import 'package:lahakni_web/screens/setting_screen/controller/setting_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../custom_widgets/custom_pagination.dart';
import '../../custom_widgets/user_card.dart';
import '../../utils/app_strings.dart';
import '../notifications/controller/notification_controller.dart';
import '../notifications/notification_screen.dart';
import '../sidemenu/sidemenu.dart';

class SettingScreen extends GetView<SettingController> {
  SettingScreen({super.key});
  final NotificationController notificationController = Get.put(NotificationController());

  addVehicleDialog(context){
    return CustomDialog(
      width: 626.w,
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50,),
              Obx(() => MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: ()async{
                    await controller.pickImage(controller.selectedImage1);
                  },
                  child: DottedBorder(
                    color: kGreyColor12,
                    dashPattern: [6, 3],
                    strokeWidth: 2,
                    borderType: BorderType.RRect,
                    radius: Radius.circular(26),
                    child: Container(
                      height: 168,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: kGreyColor11,
                      ),
                      child: controller.selectedImage1.value == null
                          ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add,size: 24,),
                          SizedBox(height: 15.h),
                          Text(
                            "Upload image",
                            style: AppStyles.regularGilroyTextStyle().copyWith(
                              fontSize: 18.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                          : ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.memory(
                          controller.selectedImage1.value!,
                          fit: BoxFit.cover,
                          height: 130,
                          width: 130,
                        ),
                      ),
                    ),
                  ),
                ),
              ),),
              SizedBox(height: 44,),
              Obx(() => DropdownButtonFormField<String>(
                dropdownColor: kWhiteColor,
                borderRadius: BorderRadius.circular(12),
                value: controller.selectedVehicleType.value,
                items: controller.vehicleTypes
                    .map(
                      (type) => DropdownMenuItem<String>(
                    value: type,
                    child: Text(
                      type,
                      style: AppStyles.regularGilroyTextStyle().copyWith(fontSize: 16.sp),
                    ),
                  ),
                )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedVehicleType.value = value;
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Selected Category',
                  labelStyle: AppStyles.regularGilroyTextStyle().copyWith(fontSize: 14.sp),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: kGreyColor1, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: kSecondaryColor, width: 2),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 25,horizontal: 20),
                ),
              )),

              SizedBox(height: 26,),

              CustomTextField(
                hintText: "Base Fare (Rs)",
                focusedFillColor: kSecondaryColor.withOpacity(0.1),
                fillColor: kWhiteColor,
                isFilled: true,
              ),
              SizedBox(height: 26,),
              CustomTextField(
                hintText: "Per KM Rate (Rs/km)",
                focusedFillColor: kSecondaryColor.withOpacity(0.1),
                fillColor: kWhiteColor,
                isFilled: true,
              ),
              SizedBox(height: 26,),
              Obx(() => DropdownButtonFormField<String>(
                dropdownColor: kWhiteColor,
                borderRadius: BorderRadius.circular(12),
                value: controller.selectedTag.value,
                items: controller.tags
                    .map(
                      (type) => DropdownMenuItem<String>(
                    value: type,
                    child: Text(
                      type,
                      style: AppStyles.regularGilroyTextStyle().copyWith(fontSize: 16.sp),
                    ),
                  ),
                )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedTag.value = value;
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Tag',
                  labelStyle: AppStyles.regularGilroyTextStyle().copyWith(fontSize: 14.sp),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: kGreyColor1, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: kSecondaryColor, width: 2),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 25,horizontal: 20),
                ),
              )),
              SizedBox(height: 26,),
              CustomTextField(
                hintText: "Speed",
                focusedFillColor: kSecondaryColor.withOpacity(0.1),
                fillColor: kWhiteColor,
                isFilled: true,
              ),
              SizedBox(height: 26,),
              CustomTextField(
                hintText: "Price",
                focusedFillColor: kSecondaryColor.withOpacity(0.1),
                fillColor: kWhiteColor,
                isFilled: true,
              ),
              SizedBox(height: 74,),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                        title: "Cancel",
                        onTap: (){
                          Get.back();
                        },
                      height: 66,
                      color: kWhiteColor,
                      borderColor: kBlackTextColor1,
                      borderRadius: 14,
                      textColor: kBlackTextColor1,
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(child: CustomButton(title: "Save", onTap: (){
                    Get.back();
                  },height: 66,))
                ],
              )
            ],
          ),
        ),
      showTitle: true,
      title: "Add Vehicle",
    );
  }

  suggestFareDialog(context){
    return CustomDialog(
      width: 626.w,
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50,),
              Obx(() => DropdownButtonFormField<String>(
                dropdownColor: kWhiteColor,
                borderRadius: BorderRadius.circular(12),
                value: controller.selectedVehicleType.value,
                items: controller.vehicleTypes
                    .map(
                      (type) => DropdownMenuItem<String>(
                    value: type,
                    child: Text(
                      type,
                      style: AppStyles.regularGilroyTextStyle().copyWith(fontSize: 16.sp),
                    ),
                  ),
                )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedVehicleType.value = value;
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Selected Category',
                  labelStyle: AppStyles.regularGilroyTextStyle().copyWith(fontSize: 14.sp),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: kGreyColor1, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: kSecondaryColor, width: 2),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 25,horizontal: 20),
                ),
              )),
              SizedBox(height: 26,),
              CustomTextField(
                hintText: "Base Fare (Rs)",
                focusedFillColor: kSecondaryColor.withOpacity(0.1),
                fillColor: kWhiteColor,
                isFilled: true,
              ),

              SizedBox(height: 74,),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                        title: "Cancel",
                        onTap: (){
                          Get.back();
                        },
                      height: 66,
                      color: kWhiteColor,
                      borderColor: kBlackTextColor1,
                      borderRadius: 14,
                      textColor: kBlackTextColor1,
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(child: CustomButton(title: "Save", onTap: (){
                    Get.back();
                  },height: 66,))
                ],
              )
            ],
          ),
        ),
      showTitle: true,
      title: "Suggest Fare",
    );
  }

  addRuleDialog(context){
    return CustomDialog(
      width: 626.w,
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50,),
              Obx(() => DropdownButtonFormField<String>(
                dropdownColor: kWhiteColor,
                borderRadius: BorderRadius.circular(12),
                value: controller.selectedCategory.value,
                items: controller.categories
                    .map(
                      (type) => DropdownMenuItem<String>(
                    value: type,
                    child: Text(
                      type,
                      style: AppStyles.regularGilroyTextStyle().copyWith(fontSize: 16.sp),
                    ),
                  ),
                )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedCategory.value = value;
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Selected Category',
                  labelStyle: AppStyles.regularGilroyTextStyle().copyWith(fontSize: 14.sp),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: kGreyColor1, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: kSecondaryColor, width: 2),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 25,horizontal: 20),
                ),
              )),
              SizedBox(height: 26,),
              CustomTextField(
                hintText: "Cancellation Time",
                focusedFillColor: kSecondaryColor.withOpacity(0.1),
                fillColor: kWhiteColor,
                isFilled: true,
              ),
              SizedBox(height: 26,),
              CustomTextField(
                hintText: "Fee",
                focusedFillColor: kSecondaryColor.withOpacity(0.1),
                fillColor: kWhiteColor,
                isFilled: true,
              ),
              SizedBox(height: 26,),
              Obx(() => DropdownButtonFormField<String>(
                dropdownColor: kWhiteColor,
                borderRadius: BorderRadius.circular(12),
                value: controller.selectedAssign.value,
                items: controller.assignies
                    .map(
                      (type) => DropdownMenuItem<String>(
                    value: type,
                    child: Text(
                      type,
                      style: AppStyles.regularGilroyTextStyle().copyWith(fontSize: 16.sp),
                    ),
                  ),
                )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedAssign.value = value;
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Assign to',
                  labelStyle: AppStyles.regularGilroyTextStyle().copyWith(fontSize: 14.sp),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: kGreyColor1, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: kSecondaryColor, width: 2),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 25,horizontal: 20),
                ),
              )),
              SizedBox(height: 74,),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                        title: "Cancel",
                        onTap: (){
                          Get.back();
                        },
                      height: 66,
                      color: kWhiteColor,
                      borderColor: kBlackTextColor1,
                      borderRadius: 14,
                      textColor: kBlackTextColor1,
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(child: CustomButton(title: "Save", onTap: (){
                    Get.back();
                  },height: 66,))
                ],
              )
            ],
          ),
        ),
      showTitle: true,
      title: "Add Cancellation Rule",
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
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
                                "Setting",
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
                              customContainer(kSettingsIcon, () {

                              }),
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
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              spacing: 12.w,
                              children: [
                                customTab(
                                  onTap: () => controller.changeTab(0),
                                  title: "Account Setting",
                                  index: 0,
                                ),
                                customTab(
                                  onTap: () => controller.changeTab(1),
                                  title: "Security",
                                  index: 1,
                                ),
                                customTab(
                                  onTap: () => controller.changeTab(2),
                                  title: "Set suggested fare ranges",
                                  index: 2,
                                ),
                                customTab(
                                  onTap: () => controller.changeTab(3),
                                  title: "Manage cancellation rules",
                                  index: 3,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 43),
                          accountSettingTab(),
                          manVehicleTab(context),
                          fareTab(context),
                          rulesTab(context),
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
    );
  }

  DataRow _buildDataRow(String title, String fee, String status,
      Color statusColor, Color statusBackColor,Map<String, dynamic> user, context) {

    return DataRow(
      color: WidgetStateProperty.all(Colors.transparent),
      cells: [
        DataCell(
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                user['isChecked'] = !user['isChecked'];
                controller.rules.refresh();
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
          title,
          textAlign: TextAlign.center,
          style: AppStyles.blackTextStyle()
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
        )),
        DataCell(Text(
          fee,
          textAlign: TextAlign.center,
          style: AppStyles.blackTextStyle()
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
        )),
        DataCell(
          Container(
            height: 30,
            width: 100.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: statusBackColor,
            ),
            child: Center(
              child: Text(status,style: AppStyles.semiBoldGilroyTextStyle().copyWith(fontSize: 13,color: statusColor),),
            ),
          ),
        ),
        DataCell(
          Center(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: (){
                  Get.dialog(addRuleDialog(context));
                },
                child: Container(
                  height: 30,
                  width: 100.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kBlackColor,),
                  child: Center(
                    child: Text("Edit",style: AppStyles.semiBoldGilroyTextStyle().copyWith(fontSize: 13,color: kWhiteColor),),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
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

  Widget customTab({
    required VoidCallback onTap,
    required String title,
    required int index,
  }) {
    final controller = Get.find<SettingController>();

    return Obx(
          () => MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
                    onTap: onTap,
                    child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: controller.selectedTab.value == index
                      ? kGreenColor
                      : kGreyColor10,
                  width: 2,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 12.0.w, right: 12.w, bottom: 9.h),
              child: Text(
                title,
                style: AppStyles.semiBoldGilroyTextStyle().copyWith(
                  fontSize: 20,
                  color: controller.selectedTab.value == index
                      ? kGreenColor
                      : kGreyColor10,
                ),
              ),
            ),
                    ),
                  ),
          ),
    );
  }

  accountSettingTab(){
    return Obx(
          () => controller.selectedTab.value == 0 ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Your Profile  Picture",style: AppStyles.regularGilroyTextStyle().copyWith(fontSize: 16.sp),),
          SizedBox(height: 13,),
          Obx(() => MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: ()async{
                await controller.pickImage(controller.selectedImage);
              },
              child: DottedBorder(
                color: kGreyColor12,
                dashPattern: [6, 3],
                strokeWidth: 2,
                borderType: BorderType.RRect,
                radius: Radius.circular(18),
                child: Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: kGreyColor11,
                  ),
                  child: controller.selectedImage.value == null
                      ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(kGalleryIcon, height: 36, width: 36),
                      SizedBox(height: 15.h),
                      Text(
                        "Upload your \nphoto",
                        style: AppStyles.regularGilroyTextStyle().copyWith(
                          fontSize: 12.sp,
                          color: kGreyColor12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                      : ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.memory(
                      controller.selectedImage.value!,
                      fit: BoxFit.cover,
                      height: 130,
                      width: 130,
                    ),
                  ),
                ),
              ),
            ),
          ),),
          Padding(
            padding: EdgeInsets.only(top: 30,bottom: 30,right: 170.w),
            child: Divider(
              height: 2,
              thickness: 2,
              color: kGreyColor13,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 170.w),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email",style: AppStyles.regularGilroyTextStyle().copyWith(fontSize: 24.sp,fontWeight: FontWeight.w500),),
                      SizedBox(
                        height: 69.h,
                        child: CustomTextField(
                          hintText: "xxx.xx@gmail.com",
                          fillColor: kGreyColor11,
                          isFilled: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 31),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 51.w,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Password",style: AppStyles.regularGilroyTextStyle().copyWith(fontSize: 24.sp,fontWeight: FontWeight.w500),),
                      SizedBox(
                        height: 69.h,
                        child: CustomTextField(
                          hintText: "xxx.xx@gmail.com",
                          fillColor: kGreyColor11,
                          isFilled: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 31),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ) : SizedBox.shrink(),);
  }

  manVehicleTab(context){
    return Obx(
          () => controller.selectedTab.value == 1 ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                height: 50,
                width: 331.w,
                child: CustomTextField(
                  hintText: "Search here user,cars, etc...",
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
              SizedBox(width: 7,),
              Container(
                height: 50,
                width: 73.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: kGreyColor2
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(kFilterIcon,height: 15,width: 15,),
                    SizedBox(width: 4,),
                    Text("Filter",style: AppStyles.regularGilroyTextStyle().copyWith(fontSize: 13.sp,color: kGreyColor14),)
                  ],
                ),
              ),
              SizedBox(width: 7,),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: kGreyColor2
                    )
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 9.0.h,horizontal: 12.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 3,
                    children: [
                      Image.asset(kCalenderIcon,height: 15,width: 15,),
                      Text("12/3/2025",style: AppStyles.regularGilroyTextStyle().copyWith(fontSize: 15.sp,color: kGreyColor14),),
                      Icon(Icons.keyboard_arrow_down_rounded,size: 24,color: kGreyColor2,),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 7,),
              Container(
                height: 50,
                width: 147.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: kGreyColor2
                    )
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 3,
                  children: [
                    Text("Luxury",style: AppStyles.regularGilroyTextStyle().copyWith(fontSize: 15.sp,color: kGreyColor14),),
                    Icon(Icons.keyboard_arrow_down_rounded,size: 24,color: kGreyColor2,),
                  ],
                ),
              ),
              SizedBox(width: 7,),
              Spacer(),
              CustomButton(title: "Add new vehicle", onTap: (){
                Get.dialog(addVehicleDialog(context));
              },height: 61,width: 252,textSize: 18.sp,borderRadius: 16,)
            ],
          ),
          SizedBox(height: 65.h,),
          Obx(() {
            List<List<Map<String, String>>> vehicleRows = [];
            final currentVehicles = controller.pagedUsers;

            for (int i = 0; i < currentVehicles.length; i += 3) {
              int end = (i + 3 < currentVehicles.length) ? i + 3 : currentVehicles.length;
              vehicleRows.add(currentVehicles.sublist(i, end));
            }

            return Column(
              children: vehicleRows.map((row) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: List.generate(row.length, (index) {
                      final vehicle = row[index];

                      EdgeInsets padding = EdgeInsets.only(
                        left: index == 0 ? 0 : 10,
                        right: index == row.length - 1 ? 0 : 10,
                      );

                      return Expanded(
                        child: Padding(
                          padding: padding,
                          child: VehicleCard(
                            image: vehicle['image']!,
                            onViewDetail: (){},
                            name: vehicle['name']!,
                            rating: vehicle['rating']!,
                            reviews: vehicle['reviews']!,
                            status: vehicle['status']!,
                            price: vehicle['price']!,
                            speed: vehicle['speed']!,
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
            currentPage: controller.currentPage.value,
            visiblePages: controller.visiblePageNumbers,
            onPrevious: controller.goToPreviousPage,
            onNext: controller.goToNextPage,
            onPageSelected: controller.goToPage,
          )),

        ],
      ) : SizedBox.shrink(),);
  }
  
  fareTab(context){
    return Obx(
          () => controller.selectedTab.value == 2 ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomButton(
                title: "Luxury",
                onTap: (){
                  controller.selectedVehicle.value = "Luxury";
                },
                height: 61,
                width: 252.w,
                textSize: 18.sp,
                borderRadius: 16,
                fontWeight: FontWeight.w400,
                color: controller.selectedVehicle.value == "Luxury" ? kBlackColor : kWhiteColor,
                textColor: controller.selectedVehicle.value == "Luxury" ? kWhiteColor : kBlackColor,
              ),
              SizedBox(width: 33.w,),
              CustomButton(
                title: "Premium",
                onTap: (){
                  controller.selectedVehicle.value = "Premium";
                },
                height: 61,
                width: 252.w,
                textSize: 18.sp,
                borderRadius: 16,
                fontWeight: FontWeight.w400,
                color: controller.selectedVehicle.value == "Premium" ? kBlackColor : kWhiteColor,
                textColor: controller.selectedVehicle.value == "Premium" ? kWhiteColor : kBlackColor,
              ),
              SizedBox(width: 33.w,),
              CustomButton(
                title: "SUV",
                onTap: (){
                  controller.selectedVehicle.value = "SUV";
                },
                height: 61,
                width: 252.w,
                textSize: 18.sp,
                borderRadius: 16,
                fontWeight: FontWeight.w400,
                color: controller.selectedVehicle.value == "SUV" ? kBlackColor : kWhiteColor,
                textColor: controller.selectedVehicle.value == "SUV" ? kWhiteColor : kBlackColor,
              ),
              SizedBox(width: 10.w,),
              Spacer(),
              CustomButton(title: "Update Fare", onTap: (){
                Get.dialog(suggestFareDialog(context));
              },height: 61,width: 252.w,textSize: 18.sp,borderRadius: 16,fontWeight: FontWeight.w400,),

            ],
          ),
          SizedBox(height: 65.h,),
          Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 87,
                width: 224,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 87,
                      width: 224,
                      child: Image.asset(kPopupImage,fit: BoxFit.contain,),
                    ),
                    Positioned(
                      top: 15,
                      left: 41,
                      child: Text(
                        "Suggest Bid",
                        style: AppStyles.semiBoldGilroyTextStyle().copyWith(fontSize: 24),
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 3.h),
              Text(
                "\$${controller.selectedPrice.value.toInt()}",
                style: AppStyles.semiBoldGilroyTextStyle().copyWith(fontSize: 45.sp),
              ),

              SizedBox(height: 24.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.w),
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 8,
                    activeTrackColor: kSecondaryColor1,
                    inactiveTrackColor: kBlackTextColor1.withOpacity(0.2),
                    thumbColor: kBlackColor,
                    valueIndicatorShape: SliderComponentShape.noOverlay,
                  ),
                  child: Slider(
                    value: controller.selectedPrice.value,
                    min: 100,
                    max: 500,
                    label: "\$${controller.selectedPrice.value.toInt()}",
                    onChanged: (value) {
                      controller.selectedPrice.value = value;
                    },
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$100",
                      style: AppStyles.semiBoldGilroyTextStyle().copyWith(fontSize: 24.sp),
                    ),
                    Text(
                      "\$500",
                      style: AppStyles.semiBoldGilroyTextStyle().copyWith(fontSize: 24.sp),
                    ),
                  ],
                ),
              ),
            ],
          )),

          SizedBox(height: 65.h,),
          Obx(() {

            final selectedType = controller.selectedVehicle.value;

            final filteredVehicles = selectedType.isEmpty
                ? []
                : controller.singleVehicleData
                .where((vehicle) => vehicle['name'] == selectedType)
                .toList();

            var vehicleRows = [];
            for (int i = 0; i < filteredVehicles.length; i += 3) {
              int end = (i + 3 < filteredVehicles.length) ? i + 3 : filteredVehicles.length;
              vehicleRows.add(filteredVehicles.sublist(i, end));
            }

            return Column(
              children: vehicleRows.map((row) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(row.length, (index) {
                      final vehicle = row[index];

                      EdgeInsets padding = EdgeInsets.only(
                        left: index == 0 ? 0 : 10.w,
                        right: index == row.length - 1 ? 0 : 10.w,
                      );

                      return Expanded(
                        child: Padding(
                          padding: padding,
                          child: VehicleCard(
                            image: vehicle['image']!,
                            onViewDetail: (){},
                            name: vehicle['name']!,
                            rating: vehicle['rating']!,
                            reviews: vehicle['reviews']!,
                            status: vehicle['status']!,
                            price: vehicle['price']!,
                            speed: vehicle['speed']!,
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
        ],
      ) : SizedBox.shrink(),);
  }

  rulesTab(context){
    double width = MediaQuery.of(context).size.width;

    return Obx(() => controller.selectedTab.value == 3 ? Column(
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
                Text(
                  "Manage Cancellation Rules",
                  style: AppStyles.regularGilroyTextStyle()
                      .copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
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
                      child: DataTableTheme(
                        data: DataTableThemeData(

                          dividerThickness: 0,
                          dataRowColor: WidgetStateProperty.all(Colors.transparent),
                        ),
                        child: DataTable(
                          columnSpacing: 0,
                          headingRowHeight: 70,
                          dividerThickness: 0,

                          columns: [
                            DataColumn(label: Container(width: 50),columnWidth: FixedColumnWidth(50)),
                            DataColumn(
                              label: Flexible(
                                child: Text(
                                  "Cancellation Window",
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
                                  "Fee",
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
                                  "Applies To",
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
                          rows: controller.pagedUsers1
                              .map((user) => _buildDataRow(
                              user['window']!,
                              user['fee']!,
                              user['status']!,
                              user['StatusColor'],
                              user['statusBackColor'],
                              user,
                              context))
                              .toList(),
                          dataRowMaxHeight: 70,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),),
        SizedBox(
          height: 51.h,
        ),
        Obx(() => CustomPagination(
          currentPage: controller.currentPage1.value,
          visiblePages: controller.visiblePageNumbers1,
          onPrevious: controller.goToPreviousPage1,
          onNext: controller.goToNextPage1,
          onPageSelected: controller.goToPage1,
        )),
      ],
    ) : SizedBox.shrink());
  }

}
