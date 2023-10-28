import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pms/utils/defaultText.dart';

class Constants {
  // static const Color primaryColor = Colors.blue;
  static const Color primaryColor = Color(0xFF5A81FA);
  static const Color altColor = Color(0xFFCDDEFF);
  static const Color backgroundColor = Color(0xFFF2F5FF);
  static const Color secondaryColor = Color(0xFF2C3D8F);
  static const Color containerColor = Color.fromARGB(255, 189, 162, 122);

  static String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return "Field is required";
    }
    return null;
  }

  static customSnackBar({String? title, String? message, required bool tag}) {
    return GetSnackBar(
        title: title,
        // message: message,
        messageText: DefaultText(
          text: message,
          color: Colors.white,
        ),
        backgroundColor: tag ? Colors.green : Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        snackStyle: SnackStyle.FLOATING,
        margin: EdgeInsets.all(20.0),
        borderRadius: 10);
  }

  static dialogBox(
    context, {
    String? text,
    Color? color,
    Color? textColor,
    IconData? icon,
    // String? buttonText,
    List<Widget>? actions,
    // void Function()? buttonAction,
  }) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: color,
              content: SizedBox(
                height: 180.0,
                child: Column(
                  children: [
                    Icon(
                      icon,
                      size: 70.0,
                      color: Colors.orange,
                    ),
                    const SizedBox(height: 20.0),
                    DefaultText(
                      size: 20.0,
                      text: text!,
                      color: textColor,
                      align: TextAlign.center,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              actions: actions,
            ));
  }

  
}
