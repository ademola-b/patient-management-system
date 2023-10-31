import 'dart:convert';
import 'package:get/get.dart';
import 'package:pms/models/login_response.dart';
import 'package:pms/models/medicine_response.dart';
import 'package:pms/models/patient_list_response.dart';
import 'package:pms/services/urls.dart';
import 'package:http/http.dart' as http;
import 'package:pms/utils/constants.dart';

import '../main.dart';

class RemoteServices {
  static Future<LoginResponse?> login(
      String? username, String? password) async {
    try {
      http.Response response = await http
          .post(loginUrl, body: {'username': username, 'password': password});
      var responseData = jsonDecode(response.body);
      if (responseData != null) {
        if (responseData['key'] != null) {
          sharedPreferences.setString('token', responseData['key']);
          // UserDetailsResponse? userDetail = await RemoteServices.userDetails();
          Get.offAllNamed('/navbar');
          // if (userDetail != null) {
          //   if (userDetail.isLandlord) {
          //     sharedPreferences.setBool("is_landlord", true);
          //   } else {
          //     sharedPreferences.setBool("is_landlord", false);
          //     Get.offAllNamed('/scouterNavBar');
          //   }
          // } else {
          //   Get.showSnackbar(Constants.customSnackBar(
          //       message: "User not found", tag: false));
          // }
        } else if (responseData['non_field_errors'] != null) {
          // RemoteServices.controller.isClicked.value = false;
          Get.showSnackbar(Constants.customSnackBar(
              message: "${responseData['non_field_errors']}", tag: false));
        }
      }
    } catch (e) {
      // RemoteServices.controller.isClicked.value = false;

      Get.showSnackbar(Constants.customSnackBar(
          message: "An error occurred: $e", tag: false));
    }
    return null;
  }

  static Future<List<PatientListResponse>?>? patientList() async {
    try {
      http.Response response = await http.get(patientListUrl, headers: {
        'Authorization': "Token ${sharedPreferences.getString('token')}"
      });
      if (response.statusCode == 200) {
        return patientListResponseFromJson(response.body);
      } else {
        throw Exception("Failed to get patients");
      }
    } catch (e) {
      Get.showSnackbar(
          Constants.customSnackBar(message: "Server Error: $e", tag: false));
    }
  }

  static Future<PatientListResponse?> patientDetails(String id) async {
    try {
      http.Response response = await http.get(patientDetailUrl(id), headers: {
        'Authorization': "Token ${sharedPreferences.getString('token')}"
      });
      if (response.statusCode == 200) {
        print("response.body");
        print("${patientResponseFromJson(response.body)}");
        return patientResponseFromJson(response.body);
      }
    } catch (e) {
      print(e);
      Get.showSnackbar(
          Constants.customSnackBar(message: "Server Error: $e", tag: false));
    }
  }
  static Future<List<MedicineResponse>?>? medicineList() async {
    try {
      http.Response response = await http.get(medicineListUrl, headers: {
        'Authorization': "Token ${sharedPreferences.getString('token')}"
      });
      if (response.statusCode == 200) {
        return medicineListResponseFromJson(response.body);
      } else {
        throw Exception("Failed to get medicine");
      }
    } catch (e) {
      Get.showSnackbar(
          Constants.customSnackBar(message: "Server Error: $e", tag: false));
    }
  }

  static Future<MedicineResponse?> medicineDetails(String id) async {
    try {
      http.Response response = await http.get(medicineDetailUrl(id), headers: {
        'Authorization': "Token ${sharedPreferences.getString('token')}"
      });
      if (response.statusCode == 200) {
        return medicineResponseFromJson(response.body);
      }
    } catch (e) {
      Get.showSnackbar(
          Constants.customSnackBar(message: "Server Error: $e", tag: false));
    }
  }
}
