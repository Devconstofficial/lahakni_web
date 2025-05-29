
import 'package:get/get.dart';

import '../../../utils/app_images.dart';
import '../notification_screen.dart';

class NotificationController extends GetxController {
  var showNotification = false.obs;

  var notifications = <NotificationItem>[
    NotificationItem(
      iconPath: kCarIcon,
      title: "Ride Completed",
      message: "The lorem ipsum trip has been completed",
    ),
    NotificationItem(
      iconPath: kCarIcon,
      title: "Payment Received",
      message: "You have received a payment for your last trip.",
    ),
    NotificationItem(
      iconPath: kCarIcon,
      title: "Driver Assigned",
      message: "A driver has been assigned to your scheduled ride.",
    ),
  ].obs;
}
