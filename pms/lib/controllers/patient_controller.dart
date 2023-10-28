import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pms/utils/constants.dart';
import 'package:pms/utils/defaultText.dart';

class PatientController extends GetxController {
  var isClicked = false.obs;
  var isEnabled = false.obs;

  Rx<DateTime> pickedDate = DateTime.now().obs;
  RxString dropdownvalue = ''.obs;

  Rx<TextEditingController> firstname = TextEditingController().obs;

  Rx<TextEditingController> dob = TextEditingController().obs;

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
      dob.value.text = DateFormat("yyyy-MM-dd").format(pickedDate.value);
    }
  }

  Widget circ(String action) {
    if (isClicked.value) {
      // print(isClicked);
      return const CircularProgressIndicator(
        color: Constants.altColor
      );
    } else {
      // print(isClicked);

      return DefaultText(text: action, color: Colors.white, size: 18.0);
    }
  }
}
