import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pms/utils/constants.dart';
import 'package:pms/utils/defaultContainer.dart';
import 'package:pms/utils/defaultText.dart';
import 'package:pms/utils/defaultTextFormField.dart';

class Patients extends StatelessWidget {
  const Patients({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios,
                        color: Constants.secondaryColor),
                    iconSize: 25,
                  ),
                  const DefaultText(
                    text: "Patients",
                    size: 20.0,
                    color: Constants.secondaryColor,
                  )
                ],
              ),
              const SizedBox(height: 40.0),
              const DefaultTextFormField(
                label: "Search by name",
                obscureText: false,
                icon: Icons.search_outlined,
                fillColor: Colors.white,
                maxLines: 1,
              ),
              const SizedBox(height: 50),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return DefaultContainer(
                      child: GestureDetector(
                        onTap: () => Get.toNamed('/patient_details',
                            arguments: {"patient": index}),
                        child: ListTile(
                          leading: ClipOval(
                              child: Image.asset(
                            "assets/images/default.jpg",
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )),
                          title: DefaultText(text: "Name $index"),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed('/add_patient');
          },
          child: const DefaultText(
            text: "+",
            size: 30,
            weight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
