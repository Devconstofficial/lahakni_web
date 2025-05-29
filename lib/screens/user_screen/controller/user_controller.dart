import 'package:get/get.dart';

import '../../../utils/app_images.dart';

class UserController extends GetxController {

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

  var currentPage = 1.obs;
  final int itemsPerPage = 6;
  final int pagesPerGroup = 4;

  int get totalPages => (users.length / itemsPerPage).ceil();

  List<Map<String, String>> get pagedUsers {
    int start = (currentPage.value - 1) * itemsPerPage;
    int end = start + itemsPerPage;
    return users.sublist(start, end > users.length ? users.length : end);
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

}