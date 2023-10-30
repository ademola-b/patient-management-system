import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pms/utils/constants.dart';
import 'package:pms/utils/defaultButton.dart';
import 'package:pms/utils/defaultContainer.dart';
import 'package:pms/utils/defaultText.dart';

class PaymentSuccessful extends StatelessWidget {
  PaymentSuccessful({super.key});

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          children: [
            const Spacer(),
            DefaultText(text: data, size: 18.0),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: DefaultButton(
                onPressed: () {
                  Get.close(2);
                },
                child: const DefaultText(
                  text: "Go Back",
                  size: 18,
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
