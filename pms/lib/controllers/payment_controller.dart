import 'package:get/get.dart';
import 'package:pms/services/remote_services.dart';

class PaymentController extends GetxController {
  var data = Get.arguments;

  @override
  void onInit() async {
    super.onInit();
    await RemoteServices.prescribeDrugs(
        drugsPrescribe: data['drug_prescribed'], patient: data['patientId']);
  }
}
