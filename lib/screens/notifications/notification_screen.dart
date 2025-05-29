import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lahakni_web/utils/app_colors.dart';
import 'package:lahakni_web/utils/app_styles.dart';

class NotificationPanel extends StatelessWidget {
  final bool show;
  final VoidCallback onClose;
  final List<NotificationItem> notifications;

  const NotificationPanel({
    super.key,
    required this.show,
    required this.onClose,
    required this.notifications,
  });

  @override
  Widget build(BuildContext context) {
    if (!show) return SizedBox.shrink();

    return Positioned(
      right: 0,
      top: 0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(38),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: kGreyColor7.withOpacity(0.3),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 37.h,
                  bottom: 37.h,
                  left: 60.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: 54.w,
                        bottom: 39,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Notifications",
                            style: AppStyles.semiBoldGilroyTextStyle().copyWith(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          InkWell(
                            onTap: onClose,
                            child: Icon(
                              Icons.close,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Today",
                      style: AppStyles.semiBoldGilroyTextStyle().copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 22),
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: notifications.length,
                      itemBuilder: (context, index) {
                        final item = notifications[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Container(
                                  height: 44,
                                  width: 44,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
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
                                    child: SvgPicture.asset(
                                      item.iconPath,
                                      height: 24,
                                      width: 24,
                                      color: kBlackColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.title,
                                      style: AppStyles.semiBoldGilroyTextStyle().copyWith(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      item.message,
                                      style: AppStyles.regularGilroyTextStyle().copyWith(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NotificationItem {
  final String iconPath;
  final String title;
  final String message;

  NotificationItem({
    required this.iconPath,
    required this.title,
    required this.message,
  });
}
