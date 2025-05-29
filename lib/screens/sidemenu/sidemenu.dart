import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lahakni_web/custom_widgets/custom_button.dart';
import 'package:lahakni_web/custom_widgets/custom_dialog.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_styles.dart';
import 'controller/sidemenu_controller.dart';


class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}


class _SideMenuState extends State<SideMenu> {
  final menuController = Get.put(SideMenuController());

  deleteDialog(){
    return CustomDialog(
        content: Column(
          children: [
            SizedBox(height: 39,),
            Text(
              "Are you sure to logout this \nApp?",style: AppStyles.semiBoldGilroyTextStyle().copyWith(
              fontSize: 35.sp,
            ),textAlign: TextAlign.center,),
            SizedBox(height: 22,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.0),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",style: AppStyles.regularGilroyTextStyle().copyWith(
                fontSize: 18.sp,
              ),textAlign: TextAlign.center,),
            ),
            SizedBox(height: 81,),
            CustomButton(title: "Yes Logout", onTap: (){
              Get.offAllNamed(kAuthScreenRoute);
              Get.back();
            },
              height: 68.h,
            ),
            SizedBox(height: 90,),
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    // bool isTablet = ResponsiveBreakpoints.of(context).largerThan(TABLET);
    double width = MediaQuery.of(context).size.width;

    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0)
      ),
      backgroundColor: kBlackColor,
      width: 260,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 128,
              child: DrawerHeader(
                child: Padding(
                  padding: const EdgeInsets.only(left: 7.0),
                  child: Row(
                    children: [
                      SizedBox(
                          height: 32,
                          width: 137,
                          child: Center(
                            child: Image.asset(
                              kFullLogoImage,
                              fit: BoxFit.fitWidth,
                            ),)
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              menuController.onItemTapped(0);
                              Get.toNamed(kDashboardScreenRoute);
                            },
                            child: SizedBox(
                              width: width,
                              height: 58,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                        height: 58,
                                        decoration: BoxDecoration(
                                          color: menuController.selectedIndex.value == 0 ? kWhiteColor : kBlackColor,
                                          borderRadius: BorderRadius.horizontal(right: Radius.circular(24))
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only( left: 24),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                kDashboardIcon,
                                                height: 26,
                                                width: 26,
                                                colorFilter: ColorFilter.mode(
                                                  menuController.selectedIndex.value == 0 ? kBlackColor : kWhiteColor,
                                                  BlendMode.srcIn,
                                                ),
                                              ),
                                              SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                                              Text(
                                                "Dashboard",
                                                style: AppStyles.blackTextStyle().copyWith(
                                                    color: menuController.selectedIndex.value == 0
                                                        ? kBlackColor : kWhiteColor,
                                                    fontSize: 20,
                                                  fontWeight: FontWeight.w600
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                      const SizedBox(height: 20,),
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              menuController.onItemTapped(1);
                              Get.toNamed(kUserScreenRoute);
                            },
                            child: SizedBox(
                              width: width,
                              height: 58,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                        height: 58,
                                        decoration: BoxDecoration(
                                            color: menuController.selectedIndex.value == 1 ? kWhiteColor : kBlackColor,
                                            borderRadius: BorderRadius.horizontal(right: Radius.circular(24))
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only( left: 24),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                kUserIcon,
                                                height: 26,
                                                width: 26,
                                                colorFilter: ColorFilter.mode(
                                                  menuController.selectedIndex.value == 1 ? kBlackColor : kWhiteColor,
                                                  BlendMode.srcIn,
                                                ),
                                              ),
                                              SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                                              Text(
                                                "Users",
                                                style: AppStyles.blackTextStyle().copyWith(
                                                    color: menuController.selectedIndex.value == 1
                                                        ? kBlackColor : kWhiteColor,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                      const SizedBox(height: 20,),
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              menuController.onItemTapped(2);
                              // Get.toNamed(kSalesScreenRoute);
                            },
                            child: SizedBox(
                              width: width,
                              height: 58,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                        height: 58,
                                        decoration: BoxDecoration(
                                            color: menuController.selectedIndex.value == 2 ? kWhiteColor : kBlackColor,
                                            borderRadius: BorderRadius.horizontal(right: Radius.circular(24))
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only( left: 24),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                kDriverIcon,
                                                height: 26,
                                                width: 26,
                                                colorFilter: ColorFilter.mode(
                                                  menuController.selectedIndex.value == 2 ? kBlackColor : kWhiteColor,
                                                  BlendMode.srcIn,
                                                ),
                                              ),
                                              SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                                              Text(
                                                "Drivers",
                                                style: AppStyles.blackTextStyle().copyWith(
                                                    color: menuController.selectedIndex.value == 2
                                                        ? kBlackColor : kWhiteColor,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                      const SizedBox(height: 20,),
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              menuController.onItemTapped(3);
                              // Get.toNamed(kChatScreenRoute);
                            },
                            child: SizedBox(
                              width: width,
                              height: 58,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                        height: 58,
                                        decoration: BoxDecoration(
                                            color: menuController.selectedIndex.value == 3 ? kWhiteColor : kBlackColor,
                                            borderRadius: BorderRadius.horizontal(right: Radius.circular(24))
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only( left: 24),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                kCarIcon,
                                                height: 26,
                                                width: 26,
                                                colorFilter: ColorFilter.mode(
                                                  menuController.selectedIndex.value == 3 ? kBlackColor : kWhiteColor,
                                                  BlendMode.srcIn,
                                                ),
                                              ),
                                              SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                                              Text(
                                                "Ride Bookings",
                                                style: AppStyles.blackTextStyle().copyWith(
                                                    color: menuController.selectedIndex.value == 3
                                                        ? kBlackColor : kWhiteColor,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
            // const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0,right: 15),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Get.dialog(deleteDialog());
                  },
                  child: SizedBox(
                    width: width,
                    height: 58,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                              height: 58,
                              decoration: BoxDecoration(
                                  color: kBlackColor,
                                  borderRadius: BorderRadius.horizontal(right: Radius.circular(24))
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only( left: 24),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      kLogoutIcon,
                                      height: 26,
                                      width: 26,
                                      colorFilter: ColorFilter.mode(
                                        kWhiteColor,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                                    Text(
                                      "Logout",
                                      style: AppStyles.blackTextStyle().copyWith(
                                          color: kWhiteColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ),

          ],
        ),
      ),
    );
  }
}