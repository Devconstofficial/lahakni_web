import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:lahakni_web/utils/app_colors.dart';
import 'dart:typed_data';

import '../../../utils/app_images.dart';

class SettingController extends GetxController {
  RxInt selectedTab = 0.obs;
  RxString selectedVehicle = 'Luxury'.obs;
  RxList<String> vehicleTypes = <String>[
    'Luxury',
    'SUV',
    'Economy',
    'Business',
    'Electric',
    'Hybrid'
  ].obs;
  RxDouble selectedPrice = 350.0.obs;

  RxList<String> tags = <String>[
    'Tag 1',
    'Tag 2',
    'Tag 3',
  ].obs;

  RxList<String> assignies = <String>[
    'User',
    'Both'
  ].obs;

  RxList<String> categories = <String>[
    'Cat 1',
    'Cat 2'
  ].obs;

  RxnString selectedVehicleType = RxnString(null);
  RxnString selectedAssign = RxnString(null);
  RxnString selectedCategory = RxnString(null);
  RxnString selectedTag = RxnString(null);

  void changeTab(int index) {
    selectedTab.value = index;
  }

  Rx<Uint8List?> selectedImage = Rx<Uint8List?>(null);
  Rx<Uint8List?> selectedImage1 = Rx<Uint8List?>(null);

  Future<void> pickImage(Rx<Uint8List?> imageHolder) async {
    final image = await ImagePickerWeb.getImageAsBytes();
    if (image != null) {
      imageHolder.value = image;
    }
  }

  var singleVehicleData = [
    {
      'image': kCar1Image,
      'name': "Luxury",
      'rating': "4.8",
      'reviews': "345",
      'status': "Top Performing",
      'speed': "1200",
      'price': "1500",
    },
    {
      'image': kCar2Image,
      'name': "Luxury",
      'rating': "4.9",
      'reviews': "310",
      'status': "First Class",
      'speed': "1350",
      'price': "1650",
    },
    {
      'image': kCar3Image,
      'name': "Luxury",
      'rating': "4.7",
      'reviews': "278",
      'status': "High-End",
      'speed': "1400",
      'price': "1800",
    },

    {
      'image': kCar2Image,
      'name': "Premium",
      'rating': "4.6",
      'reviews': "278",
      'status': "Reliable",
      'speed': "1100",
      'price': "1300",
    },
    {
      'image': kCar1Image,
      'name': "Premium",
      'rating': "4.5",
      'reviews': "260",
      'status': "Stylish",
      'speed': "1250",
      'price': "1400",
    },
    {
      'image': kCar3Image,
      'name': "Premium",
      'rating': "4.7",
      'reviews': "300",
      'status': "Refined",
      'speed': "1320",
      'price': "1500",
    },

    {
      'image': kCar3Image,
      'name': "SUV",
      'rating': "4.9",
      'reviews': "412",
      'status': "Top Rated",
      'speed': "1350",
      'price': "1700",
    },
    {
      'image': kCar1Image,
      'name': "SUV",
      'rating': "4.8",
      'reviews': "390",
      'status': "Power Drive",
      'speed': "1400",
      'price': "1750",
    },
    {
      'image': kCar2Image,
      'name': "SUV",
      'rating': "4.7",
      'reviews': "370",
      'status': "All Terrain",
      'speed': "1420",
      'price': "1780",
    },

    {
      'image': kCar1Image,
      'name': "Economy",
      'rating': "4.4",
      'reviews': "198",
      'status': "Budget Friendly",
      'speed': "980",
      'price': "900",
    },
    {
      'image': kCar2Image,
      'name': "Executive",
      'rating': "4.7",
      'reviews': "329",
      'status': "Corporate Choice",
      'speed': "1250",
      'price': "1600",
    },
    {
      'image': kCar3Image,
      'name': "Electric",
      'rating': "4.5",
      'reviews': "163",
      'status': "Eco Friendly",
      'speed': "1120",
      'price': "1400",
    },
  ];

  var vehiclesData = [
    {
      'image': kCar1Image,
      'name': "Luxury",
      'rating': "4.8",
      'reviews': "345",
      'status': "Top Performing",
      'speed': "1234",
      'price': "1000",
    },
    {
      'image': kCar2Image,
      'name': "Economy",
      'rating': "4.5",
      'reviews': "220",
      'status': "Reliable",
      'speed': "1080",
      'price': "600",
    },
    {
      'image': kCar3Image,
      'name': "SUV",
      'rating': "4.7",
      'reviews': "290",
      'status': "Popular",
      'speed': "1150",
      'price': "800",
    },
    {
      'image': kCar1Image,
      'name': "Electric",
      'rating': "4.9",
      'reviews': "400",
      'status': "Eco-Friendly",
      'speed': "980",
      'price': "950",
    },
    {
      'image': kCar2Image,
      'name': "Convertible",
      'rating': "4.6",
      'reviews': "150",
      'status': "Stylish",
      'speed': "1250",
      'price': "1100",
    },
    {
      'image': kCar3Image,
      'name': "Pickup",
      'rating': "4.4",
      'reviews': "180",
      'status': "Utility",
      'speed': "1000",
      'price': "700",
    },
    {
      'image': kCar1Image,
      'name': "Compact",
      'rating': "4.3",
      'reviews': "210",
      'status': "Efficient",
      'speed': "970",
      'price': "550",
    },
    {
      'image': kCar2Image,
      'name': "Crossover",
      'rating': "4.6",
      'reviews': "240",
      'status': "Family Favorite",
      'speed': "1020",
      'price': "750",
    },
    {
      'image': kCar3Image,
      'name': "Minivan",
      'rating': "4.2",
      'reviews': "160",
      'status': "Spacious",
      'speed': "880",
      'price': "670",
    },
    {
      'image': kCar1Image,
      'name': "Hybrid",
      'rating': "4.8",
      'reviews': "310",
      'status': "Fuel Saver",
      'speed': "920",
      'price': "820",
    },
    {
      'image': kCar2Image,
      'name': "Off-Road",
      'rating': "4.7",
      'reviews': "275",
      'status': "Rugged",
      'speed': "1160",
      'price': "1050",
    },
    {
      'image': kCar3Image,
      'name': "Classic",
      'rating': "4.5",
      'reviews': "130",
      'status': "Vintage",
      'speed': "870",
      'price': "980",
    },
    {
      'image': kCar1Image,
      'name': "Sport",
      'rating': "4.9",
      'reviews': "410",
      'status': "Fastest",
      'speed': "1340",
      'price': "1200",
    },
    {
      'image': kCar2Image,
      'name': "Luxury Plus",
      'rating': "4.8",
      'reviews': "390",
      'status': "Elite",
      'speed': "1280",
      'price': "1400",
    },
    {
      'image': kCar3Image,
      'name': "Touring",
      'rating': "4.6",
      'reviews': "250",
      'status': "Traveler's Choice",
      'speed': "990",
      'price': "760",
    },
    {
      'image': kCar1Image,
      'name': "Executive",
      'rating': "4.7",
      'reviews': "275",
      'status': "Premium",
      'speed': "1100",
      'price': "1150",
    },
  ].obs;

  var rules = [
    {"window": "1 hour before ride", 'fee': "120", "status": "User", "statusBackColor": kGreenColor.withOpacity(0.14), "StatusColor": kGreenColor, "isChecked": false},
    {"window": "30 min before ride", 'fee': "120", "status": "User", "statusBackColor": kGreenColor.withOpacity(0.14), "StatusColor": kGreenColor, "isChecked": false},
    {"window": "1 hour before ride", 'fee': "120", "status": "Both", "statusBackColor": kBlackColor, "StatusColor": kWhiteColor, "isChecked": false},
    {"window": "1 hour before ride", 'fee': "120", "status": "User", "statusBackColor": kGreenColor.withOpacity(0.14), "StatusColor": kGreenColor, "isChecked": false},
    {"window": "30 min before ride", 'fee': "120", "status": "Both", "statusBackColor": kBlackColor, "StatusColor": kWhiteColor, "isChecked": false},
    {"window": "30 min before ride", 'fee': "120", "status": "User", "statusBackColor": kGreenColor.withOpacity(0.14), "StatusColor": kGreenColor, "isChecked": false},
  ].obs;


  var currentPage = 1.obs;
  final int itemsPerPage = 6;
  final int pagesPerGroup = 4;

  var currentPage1 = 1.obs;
  final int itemsPerPage1 = 4;
  final int pagesPerGroup1 = 4;

  int get totalPages => (vehiclesData.length / itemsPerPage).ceil();

  int get totalPages1 => (rules.length / itemsPerPage1).ceil();

  List<Map<String, String>> get pagedUsers {
    int start = (currentPage.value - 1) * itemsPerPage;
    int end = start + itemsPerPage;
    return vehiclesData.sublist(start, end > vehiclesData.length ? vehiclesData.length : end);
  }

  List get pagedUsers1 {
    int start = (currentPage1.value - 1) * itemsPerPage1;
    int end = start + itemsPerPage1;
    return rules.sublist(start, end > rules.length ? rules.length : end);
  }

  int get currentGroup => ((currentPage.value - 1) / pagesPerGroup).floor();

  int get currentGroup1 => ((currentPage1.value - 1) / pagesPerGroup1).floor();

  List<int> get visiblePageNumbers {
    int startPage = currentGroup * pagesPerGroup + 1;
    int endPage = (startPage + pagesPerGroup - 1).clamp(1, totalPages);
    return List.generate(endPage - startPage + 1, (index) => startPage + index);
  }

  List<int> get visiblePageNumbers1 {
    int startPage = currentGroup1 * pagesPerGroup1 + 1;
    int endPage = (startPage + pagesPerGroup1 - 1).clamp(1, totalPages1);
    return List.generate(endPage - startPage + 1, (index) => startPage + index);
  }

  void goToPage(int page) {
    if (page >= 1 && page <= totalPages) currentPage.value = page;
  }

  void goToPage1(int page) {
    if (page >= 1 && page <= totalPages1) currentPage1.value = page;
  }

  void goToNextPage() {
    if (currentPage.value < totalPages) {
      currentPage.value++;
    }
  }

  void goToNextPage1() {
    if (currentPage1.value < totalPages1) {
      currentPage1.value++;
    }
  }

  void goToPreviousPage() {
    if (currentPage.value > 1) {
      currentPage.value--;
    }
  }

  void goToPreviousPage1() {
    if (currentPage1.value > 1) {
      currentPage1.value--;
    }
  }

}