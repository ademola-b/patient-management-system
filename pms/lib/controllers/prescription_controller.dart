import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pms/models/drug_list.dart';
import 'package:pms/utils/constants.dart';

class PrescriptionController extends GetxController {
  Rx<DateTime> pickedDate = DateTime.now().obs;
  Rx<TextEditingController> visit_date = TextEditingController().obs;
  RxString? name = ''.obs;
  Rx<TextEditingController> qty = TextEditingController().obs;
  Rx<TextEditingController> dosage = TextEditingController().obs;
  RxString dropdownvalue = ''.obs;
  Rx<bool> isClicked = false.obs;
  RxList drugList = <DrugList>[].obs;
  String publicKey = 'pk_test_967fd6ae89cd3a4c7b03b27c93083beab0329110';
  RxString message = ''.obs;
  RxDouble total = 0.0.obs;

  final plugin = PaystackPlugin();

  @override
  void onInit() {
    super.onInit();
    plugin.initialize(publicKey: publicKey);
  }

  void makePayment(context) async {
    Charge charge = Charge()
      ..amount = 1000
      ..reference = 'ref_${DateTime.now()}'
      ..email = 'bellofaisol@gmail.com'
      // ..accessCode = '+234'
      ..currency = 'NGN';

    CheckoutResponse response = await plugin.checkout(context,
        method: CheckoutMethod.card, charge: charge);

    if (response.status == true) {
      message.value = 'Payment was successful. Ref: ${response.reference}';
      Get.toNamed('/payment_success', arguments: message.value);
    } else {
      print(response.message);
    }

    isClicked.value = false;
  }

  cir() {
    return Constants.circ(isClicked, "Proceed to Payment");
  }

  Future<void> pickDate(context) async {
    var selectedDate = await showDatePicker(
      context: context,
      initialDate: pickedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                    primary: Constants.primaryColor,
                    onPrimary: Constants.altColor,
                    onSurface: Constants.secondaryColor)),
            child: child!);
      },
    );

    if (selectedDate != null) {
      pickedDate.value = selectedDate;
      visit_date.value.text = DateFormat("yyyy-MM-dd").format(pickedDate.value);
    }
  }

  populateTable() {
    drugList.add(DrugList(
        name: name!.value,
        price: 22.5,
        total: double.parse(qty.value.text) * 10.0,
        qty: qty.value.text,
        dosage: dosage.value.text));
    print(drugList[0].name);

    // total.value = ;
  }
}
