import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pms/utils/constants.dart';
import 'package:pms/utils/defaultGesture.dart';
import 'package:pms/utils/defaultText.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      appBar: AppBar(
        title: const DefaultText(
          text: "Dashboard",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DefaultGesture(
                  svgAsset: "assets/images/illness.svg",
                  tag: "Patients",
                  func: () {
                    Get.toNamed('/patients');
                  },
                ),
                DefaultGesture(
                  svgAsset: "assets/images/pills_1.svg",
                  tag: "Prescription",
                  func: () {},
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DefaultGesture(
                  svgAsset: "assets/images/pill.svg",
                  tag: "Medicine",
                  func: () {
                    Get.toNamed('/medicine');
                  },
                ),
                DefaultGesture(
                  svgAsset: "assets/images/treatment_list.svg",
                  tag: "Reports",
                  func: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
