import 'package:get/get.dart';
import 'package:lahakni_web/models/ride_model.dart';
import 'package:lahakni_web/services/ride_service.dart';

class RideBookingController extends GetxController {
  final RideService _service = RideService();
  var isLoading = false.obs;
  var isError = false.obs;
  var errorMsg = "".obs;
  RxList<RideModel> rides = <RideModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getRides();
  }

  void getRides() async {
    try {
      isLoading(true);
      var result = await _service.getRides();
      isLoading(false);
      if (result is List<RideModel>) {
        rides.assignAll(result);
        isError(false);
        errorMsg.value = '';
        return;
      } else {
        isError(true);
        errorMsg.value = result.toString();
      }
    } catch (e) {
      isLoading(false);
      isError(true);
      errorMsg.value = e.toString();
    }
  }
}
