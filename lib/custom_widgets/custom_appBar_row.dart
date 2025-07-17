import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_network/image_network.dart';
import 'package:lahakni_web/custom_widgets/user_detail_dialog.dart';
import 'package:lahakni_web/screens/dashboard_screen/controller/dashboard_controller.dart';
import 'package:lahakni_web/utils/app_images.dart';
import 'package:lahakni_web/utils/app_styles.dart';

class CustomAppbarRow extends StatelessWidget {
  final String title;
  const CustomAppbarRow({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.find();

    return Row(
      children: [
        Text(
          title,
          style: AppStyles.semiBoldGilroyTextStyle().copyWith(
            fontSize: 32.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        Spacer(),

        Obx(
          () =>
              controller.userData.value.userId.isEmpty
                  ? SizedBox(
                    height: 60,
                    width: 60,
                    child: Center(child: CircularProgressIndicator()),
                  )
                  : ClipOval(
                    child: ImageNetwork(
                      image: controller.userData.value.userImage,
                      height: 80,
                      width: 80,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => UpdateDetailsDialog(),
                        );
                      },
                      fitWeb: BoxFitWeb.cover,
                      fitAndroidIos: BoxFit.cover,
                      onLoading: const CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                      onError: Image.asset(kDummyImg, fit: BoxFit.cover),
                    ),
                  ),
        ),

        SizedBox(width: 5.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Text(
                controller.userData.value.name,
                style: AppStyles.blackTextStyle().copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Text(
              "Admin",
              style: AppStyles.blackTextStyle().copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(width: 21.w),
      ],
    );
  }
}
