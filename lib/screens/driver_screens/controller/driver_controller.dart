import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';

class DriverController extends GetxController {

  var requests = [
    {
      "name": "Sassanian Habib",
      "role": "Driver",
      "createData": "Dec 12-2024",
      "status": "Pending",
      "isChecked": false,
      "image": kPersonImage1,
      "number": "+9212345678901",
      "plateNumber": "12/6/2024",
      "model": "ALP10M90JK",
      "makeYear": "3/4/2004",
      "modelYear": "12/2/2025"
    },
    {
      "name": "Mehaik Fatima",
      "role": "Driver",
      "createData": "Dec 13-2024",
      "status": "Pending",
      "isChecked": false,
      "image": kPersonImage1,
      "number": "+9212345678902",
      "plateNumber": "13/6/2024",
      "model": "BGT21X11PL",
      "makeYear": "6/8/2005",
      "modelYear": "01/3/2026"
    },
    {
      "name": "Ahmed Khan",
      "role": "Driver",
      "createData": "Dec 14-2024",
      "status": "Pending",
      "isChecked": false,
      "image": kPersonImage1,
      "number": "+9212345678903",
      "plateNumber": "14/6/2024",
      "model": "XCV45P98GH",
      "makeYear": "2/5/2003",
      "modelYear": "05/7/2025"
    },
    {
      "name": "Areeba Qamar",
      "role": "Driver",
      "createData": "Dec 15-2024",
      "status": "Pending",
      "isChecked": false,
      "image": kPersonImage1,
      "number": "+9212345678904",
      "plateNumber": "15/6/2024",
      "model": "PLM78Q22TR",
      "makeYear": "7/9/2007",
      "modelYear": "08/8/2026"
    },
    {
      "name": "Umer Rasheed",
      "role": "Driver",
      "createData": "Dec 16-2024",
      "status": "Pending",
      "isChecked": false,
      "image": kPersonImage1,
      "number": "+9212345678905",
      "plateNumber": "16/6/2024",
      "model": "YUI89M55DF",
      "makeYear": "4/3/2006",
      "modelYear": "11/11/2025"
    },
    {
      "name": "Fatima Noor",
      "role": "Driver",
      "createData": "Dec 17-2024",
      "status": "Pending",
      "isChecked": false,
      "image": kPersonImage1,
      "number": "+9212345678906",
      "plateNumber": "17/6/2024",
      "model": "TRK21L98MN",
      "makeYear": "1/6/2002",
      "modelYear": "02/12/2025"
    },
    {
      "name": "Zayan Malik",
      "role": "Driver",
      "createData": "Dec 18-2024",
      "status": "Pending",
      "isChecked": false,
      "image": kPersonImage1,
      "number": "+9212345678907",
      "plateNumber": "18/6/2024",
      "model": "WER12T33ZP",
      "makeYear": "10/10/2008",
      "modelYear": "06/10/2025"
    },
    {
      "name": "Hina Shah",
      "role": "Driver",
      "createData": "Dec 19-2024",
      "status": "Pending",
      "isChecked": false,
      "image": kPersonImage1,
      "number": "+9212345678908",
      "plateNumber": "19/6/2024",
      "model": "MKL99A00XY",
      "makeYear": "12/11/2005",
      "modelYear": "09/5/2025"
    },
    {
      "name": "Bilal Ansari",
      "role": "Driver",
      "createData": "Dec 20-2024",
      "status": "Pending",
      "isChecked": false,
      "image": kPersonImage1,
      "number": "+9212345678909",
      "plateNumber": "20/6/2024",
      "model": "QAZ31S44VB",
      "makeYear": "11/2/2004",
      "modelYear": "04/4/2025"
    },
  ].obs;

  var currentPage = 1.obs;
  final int itemsPerPage = 3;
  final int pagesPerGroup = 4;

  int get totalPages => (requests.length / itemsPerPage).ceil();

  List get pagedUsers {
    int start = (currentPage.value - 1) * itemsPerPage;
    int end = start + itemsPerPage;
    return requests.sublist(start, end > requests.length ? requests.length : end);
  }

  int get currentGroup => ((currentPage.value - 1) / pagesPerGroup).floor();

  List<int> get visiblePageNumbers {
    int startPage = currentGroup * pagesPerGroup + 1;
    int endPage = (startPage + pagesPerGroup - 1).clamp(1, totalPages);
    return List.generate(endPage - startPage + 1, (index) => startPage + index);
  }

  void goToPage(int page) {
    if (page >= 1 && page <= totalPages) currentPage.value = page;
  }

  void goToNextPage() {
    if (currentPage.value < totalPages) {
      currentPage.value++;
    }
  }

  void goToPreviousPage() {
    if (currentPage.value > 1) {
      currentPage.value--;
    }
  }

  var users = [
    {
      'image': kPersonImage1,
      'name': "Mehaik Fatima",
      'status': "Passenger",
      'totalRides': "12",
      'completedRides': "4",
      'canceledRides': "4",
      'paymentStatus': "Completed",
    },
    {
      'image': kPersonImage1,
      'name': "Ahmed Khan",
      'status': "Passenger",
      'totalRides': "9",
      'completedRides': "6",
      'canceledRides': "1",
      'paymentStatus': "Pending",
    },
    {
      'image': kPersonImage1,
      'name': "Areeba Sheikh",
      'status': "Passenger",
      'totalRides': "15",
      'completedRides': "12",
      'canceledRides': "2",
      'paymentStatus': "Completed",
    },
    {
      'image': kPersonImage1,
      'name': "Hassan Raza",
      'status': "Passenger",
      'totalRides': "7",
      'completedRides': "5",
      'canceledRides': "1",
      'paymentStatus': "Failed",
    },
    {
      'image': kPersonImage1,
      'name': "Zainab Tariq",
      'status': "Passenger",
      'totalRides': "20",
      'completedRides': "18",
      'canceledRides': "1",
      'paymentStatus': "Completed",
    },
    {
      'image': kPersonImage1,
      'name': "Umar Saeed",
      'status': "Passenger",
      'totalRides': "10",
      'completedRides': "9",
      'canceledRides': "0",
      'paymentStatus': "Pending",
    },
    {
      'image': kPersonImage1,
      'name': "Mariam Ali",
      'status': "Passenger",
      'totalRides': "13",
      'completedRides': "11",
      'canceledRides': "1",
      'paymentStatus': "Completed",
    },
    {
      'image': kPersonImage1,
      'name': "Talha Qureshi",
      'status': "Passenger",
      'totalRides': "17",
      'completedRides': "16",
      'canceledRides': "0",
      'paymentStatus': "Completed",
    },
    {
      'image': kPersonImage1,
      'name': "Sara Malik",
      'status': "Passenger",
      'totalRides': "5",
      'completedRides': "3",
      'canceledRides': "1",
      'paymentStatus': "Failed",
    },
    {
      'image': kPersonImage1,
      'name': "Bilal Asim",
      'status': "Passenger",
      'totalRides': "14",
      'completedRides': "12",
      'canceledRides': "1",
      'paymentStatus': "Pending",
    },
    {
      'image': kPersonImage1,
      'name': "Nadia Shams",
      'status': "Passenger",
      'totalRides': "6",
      'completedRides': "5",
      'canceledRides': "0",
      'paymentStatus': "Completed",
    },
    {
      'image': kPersonImage1,
      'name': "Osama Javed",
      'status': "Passenger",
      'totalRides': "11",
      'completedRides': "10",
      'canceledRides': "1",
      'paymentStatus': "Pending",
    },
    {
      'image': kPersonImage1,
      'name': "Farah Nawaz",
      'status': "Passenger",
      'totalRides': "8",
      'completedRides': "6",
      'canceledRides': "2",
      'paymentStatus': "Failed",
    },
    {
      'image': kPersonImage1,
      'name': "Ali Raza",
      'status': "Passenger",
      'totalRides': "18",
      'completedRides': "17",
      'canceledRides': "1",
      'paymentStatus': "Completed",
    },
    {
      'image': kPersonImage1,
      'name': "Zoya Iqbal",
      'status': "Passenger",
      'totalRides': "7",
      'completedRides': "5",
      'canceledRides': "1",
      'paymentStatus': "Pending",
    },
    {
      'image': kPersonImage1,
      'name': "Rehan Saleem",
      'status': "Passenger",
      'totalRides': "16",
      'completedRides': "14",
      'canceledRides': "1",
      'paymentStatus': "Completed",
    },
    {
      'image': kPersonImage1,
      'name': "Amina Yousuf",
      'status': "Passenger",
      'totalRides': "9",
      'completedRides': "8",
      'canceledRides': "0",
      'paymentStatus': "Completed",
    },
    {
      'image': kPersonImage1,
      'name': "Haris Mehmood",
      'status': "Passenger",
      'totalRides': "10",
      'completedRides': "9",
      'canceledRides': "1",
      'paymentStatus': "Pending",
    },
    {
      'image': kPersonImage1,
      'name': "Sana Mir",
      'status': "Passenger",
      'totalRides': "11",
      'completedRides': "10",
      'canceledRides': "0",
      'paymentStatus': "Completed",
    },
    {
      'image': kPersonImage1,
      'name': "Junaid Ahmed",
      'status': "Passenger",
      'totalRides': "12",
      'completedRides': "11",
      'canceledRides': "0",
      'paymentStatus': "Completed",
    },
    {
      'image': kPersonImage1,
      'name': "Fatima Bukhari",
      'status': "Passenger",
      'totalRides': "6",
      'completedRides': "4",
      'canceledRides': "1",
      'paymentStatus': "Failed",
    },
    {
      'image': kPersonImage1,
      'name': "Abdullah Waqar",
      'status': "Passenger",
      'totalRides': "19",
      'completedRides': "17",
      'canceledRides': "1",
      'paymentStatus': "Completed",
    },
    {
      'image': kPersonImage1,
      'name': "Hiba Nawaz",
      'status': "Passenger",
      'totalRides': "13",
      'completedRides': "12",
      'canceledRides': "0",
      'paymentStatus': "Pending",
    },
    {
      'image': kPersonImage1,
      'name': "Tariq Shah",
      'status': "Passenger",
      'totalRides': "20",
      'completedRides': "20",
      'canceledRides': "0",
      'paymentStatus': "Completed",
    },
    {
      'image': kPersonImage1,
      'name': "Nadia Shams",
      'status': "Passenger",
      'totalRides': "6",
      'completedRides': "5",
      'canceledRides': "0",
      'paymentStatus': "Completed",
    },
    {
      'image': kPersonImage1,
      'name': "Osama Javed",
      'status': "Passenger",
      'totalRides': "11",
      'completedRides': "10",
      'canceledRides': "1",
      'paymentStatus': "Pending",
    },
    {
      'image': kPersonImage1,
      'name': "Farah Nawaz",
      'status': "Passenger",
      'totalRides': "8",
      'completedRides': "6",
      'canceledRides': "2",
      'paymentStatus': "Failed",
    },
    {
      'image': kPersonImage1,
      'name': "Ali Raza",
      'status': "Passenger",
      'totalRides': "18",
      'completedRides': "17",
      'canceledRides': "1",
      'paymentStatus': "Completed",
    },
    {
      'image': kPersonImage1,
      'name': "Zoya Iqbal",
      'status': "Passenger",
      'totalRides': "7",
      'completedRides': "5",
      'canceledRides': "1",
      'paymentStatus': "Pending",
    },
    {
      'image': kPersonImage1,
      'name': "Rehan Saleem",
      'status': "Passenger",
      'totalRides': "16",
      'completedRides': "14",
      'canceledRides': "1",
      'paymentStatus': "Completed",
    },
    {
      'image': kPersonImage1,
      'name': "Amina Yousuf",
      'status': "Passenger",
      'totalRides': "9",
      'completedRides': "8",
      'canceledRides': "0",
      'paymentStatus': "Completed",
    },
    {
      'image': kPersonImage1,
      'name': "Haris Mehmood",
      'status': "Passenger",
      'totalRides': "10",
      'completedRides': "9",
      'canceledRides': "1",
      'paymentStatus': "Pending",
    },
    {
      'image': kPersonImage1,
      'name': "Sana Mir",
      'status': "Passenger",
      'totalRides': "11",
      'completedRides': "10",
      'canceledRides': "0",
      'paymentStatus': "Completed",
    },
    {
      'image': kPersonImage1,
      'name': "Junaid Ahmed",
      'status': "Passenger",
      'totalRides': "12",
      'completedRides': "11",
      'canceledRides': "0",
      'paymentStatus': "Completed",
    },
    {
      'image': kPersonImage1,
      'name': "Fatima Bukhari",
      'status': "Passenger",
      'totalRides': "6",
      'completedRides': "4",
      'canceledRides': "1",
      'paymentStatus': "Failed",
    },
    {
      'image': kPersonImage1,
      'name': "Abdullah Waqar",
      'status': "Passenger",
      'totalRides': "19",
      'completedRides': "17",
      'canceledRides': "1",
      'paymentStatus': "Completed",
    },
    {
      'image': kPersonImage1,
      'name': "Hiba Nawaz",
      'status': "Passenger",
      'totalRides': "13",
      'completedRides': "12",
      'canceledRides': "0",
      'paymentStatus': "Pending",
    },
    {
      'image': kPersonImage1,
      'name': "Tariq Shah",
      'status': "Passenger",
      'totalRides': "20",
      'completedRides': "20",
      'canceledRides': "0",
      'paymentStatus': "Completed",
    },
  ].obs;

  var currentPage1 = 1.obs;
  final int itemsPerPage1 = 3;
  final int pagesPerGroup1 = 4;

  int get totalPages1 => (users.length / itemsPerPage1).ceil();

  List<Map<String, String>> get pagedUsers1 {
    int start = (currentPage1.value - 1) * itemsPerPage1;
    int end = start + itemsPerPage1;
    return users.sublist(start, end > users.length ? users.length : end);
  }

  int get currentGroup1 => ((currentPage1.value - 1) / pagesPerGroup1).floor();

  List<int> get visiblePageNumbers1 {
    int startPage = currentGroup1 * pagesPerGroup1 + 1;
    int endPage = (startPage + pagesPerGroup1 - 1).clamp(1, totalPages1);
    return List.generate(endPage - startPage + 1, (index) => startPage + index);
  }

  void goToPage1(int page) {
    if (page >= 1 && page <= totalPages1) currentPage1.value = page;
  }

  void goToNextPage1() {
    if (currentPage1.value < totalPages1) {
      currentPage1.value++;
    }
  }

  void goToPreviousPage1() {
    if (currentPage1.value > 1) {
      currentPage1.value--;
    }
  }

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
}