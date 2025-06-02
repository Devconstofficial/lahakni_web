import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';

class DashboardController extends GetxController {
  RxString selectedOption = "".obs;
  List<String> options = ["Last 7 days", "Monthly", "Yearly"];
  void selectOption(String option) {
    selectedOption.value = option;
  }

  final yInterval = 20;

  var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'].obs;

  var completedSpots = <FlSpot>[
    FlSpot(0, 20),
    FlSpot(1, 25),
    FlSpot(2, 60),
    FlSpot(3, 55),
    FlSpot(4, 50),
    FlSpot(5, 58),
    FlSpot(6, 70),
  ].obs;

  var pendingSpots = <FlSpot>[
    FlSpot(0, 30),
    FlSpot(1, 40),
    FlSpot(2, 70),
    FlSpot(3, 60),
    FlSpot(4, 65),
    FlSpot(5, 62),
    FlSpot(6, 75),
  ].obs;

  LineChartBarData get completedLine => LineChartBarData(
    spots: completedSpots,
    isCurved: true,
    color: kBlackColor,
    barWidth: 2,
    dotData: FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
  );

  LineChartBarData get pendingLine => LineChartBarData(
    spots: pendingSpots,
    isCurved: true,
    color: kGreyColor5,
    barWidth: 2,
    dotData: FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
  );

  List<LineChartBarData> get lineBars => [completedLine, pendingLine];

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
}