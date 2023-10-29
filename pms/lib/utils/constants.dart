import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pms/utils/defaultButton.dart';
import 'package:pms/utils/defaultText.dart';
import 'package:pms/utils/defaultTextFormField.dart';

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

  static void showDrugDetails(
      Size size, String nameText, String priceText, BuildContext context) {
    final _form = GlobalKey<FormState>();
    late String _name, _price;

    TextEditingController name = TextEditingController(text: nameText);
    TextEditingController price = TextEditingController(text: priceText);

    updateDrug() {
      var isValid = _form.currentState!.validate();
      if (!isValid) return;
      _form.currentState!.save();

      print("Data collected: $_name, $_price");
    }

    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          height: size.height / 2.5,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100.0),
              topRight: Radius.circular(100.0),
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: Column(
              children: [
                Form(
                  key: _form,
                  child: Column(
                    children: [
                      DefaultTextFormField(
                        text: name,
                        obscureText: false,
                        hintText: "Name",
                        label: "Name",
                        validator: Constants.validator,
                        onSaved: (newValue) => _name = newValue!,
                      ),
                      const SizedBox(height: 20.0),
                      DefaultTextFormField(
                        text: price,
                        obscureText: false,
                        hintText: "Price",
                        label: "Price",
                        validator: Constants.validator,
                        keyboardInputType: TextInputType.number,
                        onSaved: (newValue) => _price = newValue!,
                      ),
                      // const Spacer(),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        width: size.width,
                        child: DefaultButton(
                            onPressed: () {
                              // controller.isClicked.value = true;
                              updateDrug();
                            },
                            textSize: 18,
                            child: const DefaultText(
                              text: "Update Drug",
                              size: 18.0,
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget circ(Rx<bool> isClicked, String action) {
    if (isClicked.value) {
      print(isClicked);
      return const CircularProgressIndicator(
        color: Constants.altColor,
      );
    } else {
      print(isClicked);

      return DefaultText(text: action, color: Colors.white, size: 18.0);
    }
  }
}
