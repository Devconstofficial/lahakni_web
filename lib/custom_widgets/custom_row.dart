
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahakni_web/utils/app_colors.dart';

import '../utils/app_styles.dart';

Widget customRow(title,detail, {Color detailColor = kBlackColor}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style:
        AppStyles.regularGilroyTextStyle()
            .copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500
        ),
      ),
      Text(
        detail,
        style:
        AppStyles.semiBoldGilroyTextStyle()
            .copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          color: detailColor
        ),
      ),
    ],
  );
}