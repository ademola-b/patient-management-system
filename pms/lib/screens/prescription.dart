import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pms/controllers/prescription_controller.dart';
import 'package:pms/utils/constants.dart';
import 'package:pms/utils/defaultButton.dart';
import 'package:pms/utils/defaultDropDown.dart';
import 'package:pms/utils/defaultText.dart';
import 'package:pms/utils/defaultTextFormField.dart';

class Prescription extends StatelessWidget {
  Prescription({super.key});

  final controller = Get.put(PrescriptionController());

  final _form = GlobalKey<FormState>();

  late String _diagnosis, _visitDate, _qty, _dosage;
  Map medicine = {'male': 'male', 'female': 'female'};
  late String _medicine;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
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
                    text: "Prescribe Drug",
                    size: 20.0,
                    color: Constants.secondaryColor,
                  )
                ],
              ),
              const SizedBox(height: 40.0),
              Expanded(
                child: Form(
                  key: _form,
                  child: Column(
                    children: [
                      DefaultTextFormField(
                        obscureText: false,
                        hintText: "Diagnosis",
                        label: "Diagnosis",
                        validator: Constants.validator,
                        fillColor: Colors.white,
                        onSaved: (newValue) => _diagnosis = newValue!,
                      ),
                      const SizedBox(height: 20.0),
                      DefaultTextFormField(
                        label: "Visitation Date",
                        text: controller.visit_date.value,
                        obscureText: false,
                        icon: Icons.date_range_outlined,
                        fillColor: Colors.white,
                        maxLines: 1,
                        onTap: () => controller.pickDate(context),
                        keyboardInputType: TextInputType.none,
                        onSaved: (value) => _visitDate = value!,
                      ),
                      // const Spacer(),
                      const SizedBox(height: 20.0),
                      Obx(
                        () => DefaultDropDown(
                          onChanged: (newVal) {
                            controller.dropdownvalue.value = newVal;
                            controller.name.value = newVal;
                          },
                          dropdownMenuItemList: medicine
                              .map((key, value) => MapEntry(
                                  key,
                                  DropdownMenuItem(
                                    value: key,
                                    child: DefaultText(
                                      text: value.toString(),
                                    ),
                                  )))
                              .values
                              .toList(),
                          value: controller.dropdownvalue.value,
                          text: "Medicine",
                          onSaved: (newVal) {
                            _medicine = newVal;
                          },
                          validator: (value) {
                            if (value == null || value == '') {
                              return "field is required";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20.0),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: DefaultTextFormField(
                            text: controller.qty.value,
                            label: "Quantity",
                            obscureText: false,
                            icon: Icons.date_range_outlined,
                            fillColor: Colors.white,
                            maxLines: 1,
                            keyboardInputType: TextInputType.number,
                            onSaved: (value) => _qty = value!,
                          )),
                          const SizedBox(width: 10.0),
                          Expanded(
                            child: DefaultTextFormField(
                              text: controller.dosage.value,
                              label: "Dosage",
                              obscureText: false,
                              icon: Icons.date_range_outlined,
                              fillColor: Colors.white,
                              maxLines: 1,
                              keyboardInputType: TextInputType.number,
                              onSaved: (value) => _dosage = value!,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          DefaultButton(
                              onPressed: () {
                                controller.populateTable();
                              },
                              textSize: 15.0,
                              child: const DefaultText(
                                text: "Add Drug to List",
                                size: 15,
                              ))
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Obx(() => Table(
                            border: TableBorder.all(),
                            children: [
                              const TableRow(children: [
                                TableCell(
                                  child: DefaultText(
                                    text: "Drug Name",
                                    size: 18.0,
                                  ),
                                ),
                                TableCell(
                                  child: DefaultText(
                                    text: "Quantity",
                                    size: 18.0,
                                  ),
                                ),
                                TableCell(
                                  child: DefaultText(
                                    text: "Dosage",
                                    size: 18.0,
                                  ),
                                ),
                                TableCell(
                                  child: DefaultText(
                                    text: "Action",
                                    size: 18.0,
                                  ),
                                ),
                              ]),
                              for (var item in controller.drugList)
                                TableRow(
                                  children: [
                                    TableCell(
                                        child: DefaultText(text: item.name)),
                                    TableCell(
                                        child: DefaultText(text: item.qty)),
                                    TableCell(
                                        child: DefaultText(text: item.dosage)),
                                    TableCell(
                                        child: DefaultText(text: item.dosage)),
                                  ],
                                ),
                            ],
                          )),

                      const Spacer(),
                      SizedBox(
                        width: size.width,
                        child: Obx(() => DefaultButton(
                              onPressed: () {
                                controller.isClicked.value = true;
                                controller.makePayment(context);
                              },
                              textSize: 18,
                              child: controller.cir(),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
