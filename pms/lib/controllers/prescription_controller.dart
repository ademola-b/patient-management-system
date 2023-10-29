import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pms/models/drug_list.dart';
import 'package:pms/utils/constants.dart';
import 'package:pms/utils/defaultText.dart';

class PrescriptionController extends GetxController {
  Rx<DateTime> pickedDate = DateTime.now().obs;
  Rx<TextEditingController> visit_date = TextEditingController().obs;
  RxString dropdownvalue = ''.obs;

  Constants consts = Constants();

  Rx<bool> isClicked = false.obs;
  RxList drugList = <DrugList>[].obs;

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

  table() {
    print("clicked");
  }
}
