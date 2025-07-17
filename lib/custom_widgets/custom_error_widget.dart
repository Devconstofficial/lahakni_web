import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahakni_web/utils/app_colors.dart';
import 'package:lahakni_web/utils/app_styles.dart';

class CustomErrorWidget extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const CustomErrorWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            title,
            style: AppStyles.blackTextStyle().copyWith(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20.h),
          GestureDetector(
            onTap: onTap,
            child: Icon(Icons.refresh, color: kBlackColor),
          ),
        ],
      ),
    );
  }
}
