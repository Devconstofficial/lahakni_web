import 'package:get/get.dart';

import '../../../utils/app_images.dart';

class RideBookingController extends GetxController {
  var bookings = [
    {
      'name': "Mehaik Fatima",
      'bookingDate': "12-2- At 12:20",
      'status': "Passenger",
      'pay': "120",
      'charges': "20",
      "isChecked": false,
      "role": "Driver",
      "image": kPersonImage1,
      "pickupLat": 33.6844,
      "pickupLng": 73.0479,
      "dropoffLat": 33.6938,
      "dropoffLng": 73.0652,
    },
    {
      'name': "Ahmed Khan",
      'bookingDate': "12-3- At 10:00",
      'status': "Passenger",
      'pay': "120",
      'charges': "20",
      "isChecked": false,
      "role": "Driver",
      "image": kPersonImage1,
      "pickupLat": 24.8607,
      "pickupLng": 67.0011,
      "dropoffLat": 24.8712,
      "dropoffLng": 66.9987,
    },
    {
      'name': "Areeba Qamar",
      'bookingDate': "12-4- At 15:45",
      'status': "Passenger",
      'pay': "120",
      'charges': "20",
      "isChecked": false,
      "role": "Driver",
      "image": kPersonImage1,
      "pickupLat": 31.5497,
      "pickupLng": 74.3436,
      "dropoffLat": 31.5700,
      "dropoffLng": 74.3522,
    },
    {
      'name': "Zayan Malik",
      'bookingDate': "12-5- At 09:30",
      'status': "Passenger",
      'pay': "120",
      'charges': "20",
      "isChecked": false,
      "role": "Driver",
      "image": kPersonImage1,
      "pickupLat": 34.0151,
      "pickupLng": 71.5249,
      "dropoffLat": 34.0200,
      "dropoffLng": 71.5300,
    },
    {
      'name': "Fatima Noor",
      'bookingDate': "12-6- At 11:15",
      'status': "Passenger",
      'pay': "120",
      'charges': "20",
      "isChecked": false,
      "role": "Driver",
      "image": kPersonImage1,
      "pickupLat": 30.1575,
      "pickupLng": 71.5249,
      "dropoffLat": 30.1700,
      "dropoffLng": 71.5400,
    },
    {
      'name': "Umer Rasheed",
      'bookingDate': "12-7- At 16:10",
      'status': "Passenger",
      'pay': "120",
      'charges': "20",
      "isChecked": false,
      "role": "Driver",
      "image": kPersonImage1,
      "pickupLat": 25.3960,
      "pickupLng": 68.3578,
      "dropoffLat": 25.4100,
      "dropoffLng": 68.3700,
    },
    {
      'name': "Hina Shah",
      'bookingDate': "12-8- At 13:40",
      'status': "Passenger",
      'pay': "120",
      'charges': "20",
      "isChecked": false,
      "role": "Driver",
      "image": kPersonImage1,
      "pickupLat": 35.8818,
      "pickupLng": 74.4644,
      "dropoffLat": 35.8900,
      "dropoffLng": 74.4800,
    },
    {
      'name': "Bilal Ansari",
      'bookingDate': "12-9- At 08:00",
      'status': "Passenger",
      'pay': "120",
      'charges': "20",
      "isChecked": false,
      "role": "Driver",
      "image": kPersonImage1,
      "pickupLat": 33.7380,
      "pickupLng": 72.8260,
      "dropoffLat": 33.7500,
      "dropoffLng": 72.8400,
    },
    {
      'name': "Sassanian Habib",
      'bookingDate': "12-10- At 14:20",
      'status': "Passenger",
      'pay': "120",
      'charges': "20",
      "isChecked": false,
      "role": "Driver",
      "image": kPersonImage1,
      "pickupLat": 32.1617,
      "pickupLng": 74.1883,
      "dropoffLat": 32.1700,
      "dropoffLng": 74.2000,
    },
  ].obs;

  var currentPage2 = 1.obs;
  final int itemsPerPage2 = 4;
  final int pagesPerGroup2 = 4;

  int get totalPages2 => (bookings.length / itemsPerPage2).ceil();

  List get pagedUsers2 {
    int start = (currentPage2.value - 1) * itemsPerPage2;
    int end = start + itemsPerPage2;
    return bookings.sublist(start, end > bookings.length ? bookings.length : end);
  }

  int get currentGroup2 => ((currentPage2.value - 1) / pagesPerGroup2).floor();

  List<int> get visiblePageNumbers2 {
    int startPage = currentGroup2 * pagesPerGroup2 + 1;
    int endPage = (startPage + pagesPerGroup2 - 1).clamp(1, totalPages2);
    return List.generate(endPage - startPage + 1, (index) => startPage + index);
  }

  void goToPage2(int page) {
    if (page >= 1 && page <= totalPages2) currentPage2.value = page;
  }

  void goToNextPage2() {
    if (currentPage2.value < totalPages2) {
      currentPage2.value++;
    }
  }

  void goToPreviousPage2() {
    if (currentPage2.value > 1) {
      currentPage2.value--;
    }
  }

  var barData = <List<double>>[
    [40.0, 25.0],
    [20.0, 20.0],
    [65.0, 10.0],
    [35.0, 15.0],
    [20.0, 10.0],
    [80.0, 0.0],  
    [20.0, 20.0],
    [60.0, 10.0],
    [35.0, 15.0],
    [20.0, 10.0],
    [40.0, 30.0],
    [30.0, 20.0],
    [60.0, 10.0],
  ].obs;
}