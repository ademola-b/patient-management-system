import 'dart:convert';

import 'package:get/get.dart';
import 'package:pms/models/login_response.dart';
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
}
