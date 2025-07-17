import 'package:get/get.dart';
import 'package:lahakni_web/models/ride_model.dart';
import 'package:lahakni_web/services/ride_service.dart';

class RideDetailController extends GetxController {
  final RideService _service = RideService();
  var isLoading1 = false.obs;
  var isError1 = false.obs;
  var errorMsg1 = "".obs;
  Rx<RideModel> rideDetail = RideModel.empty().obs;

  void geRideDetail(String id) async {
    rideDetail.value = RideModel.empty();
    try {
      isLoading1(true);
      var result = await _service.getRideDetail(id: id);
      isLoading1(false);
      if (result is RideModel) {
        rideDetail.value = result;
        isError1(false);
        errorMsg1.value = '';
        return;
      } else {
        isError1(true);
        errorMsg1.value = result.toString();
      }
    } catch (e) {
      isLoading1(false);
      isError1(true);
      errorMsg1.value = e.toString();
    }
  }
}
