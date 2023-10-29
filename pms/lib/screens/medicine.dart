import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pms/utils/constants.dart';
import 'package:pms/utils/defaultButton.dart';
import 'package:pms/utils/defaultContainer.dart';
import 'package:pms/utils/defaultText.dart';
import 'package:pms/utils/defaultTextFormField.dart';

class Medicine extends StatelessWidget {
  Medicine({super.key});

  final _form = GlobalKey<FormState>();
  late String _name, _price;

  _addDrug() {
    var isValid = _form.currentState!.validate();
    if (!isValid) return;
    _form.currentState!.save();

    print("Data collected: $_name, $_price");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                    text: "Medicine",
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
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DefaultButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (builder) {
                              return Container(
                                height: size.height / 2.5,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(100.0),
                                        topRight: Radius.circular(100.0))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 10.0),
                                  child: Column(
                                    children: [
                                      Form(
                                        key: _form,
                                        child: Column(
                                          children: [
                                            DefaultTextFormField(
                                              obscureText: false,
                                              hintText: "Name",
                                              label: "Name",
                                              validator: Constants.validator,
                                              onSaved: (newValue) =>
                                                  _name = newValue!,
                                            ),
                                            const SizedBox(height: 20.0),
                                            DefaultTextFormField(
                                              obscureText: false,
                                              hintText: "Price",
                                              label: "Price",
                                              validator: Constants.validator,
                                              keyboardInputType:
                                                  TextInputType.number,
                                              onSaved: (newValue) =>
                                                  _price = newValue!,
                                            ),
                                            // const Spacer(),
                                            const SizedBox(height: 20.0),
                                            SizedBox(
                                              width: size.width,
                                              child: DefaultButton(
                                                  onPressed: () {
                                                    // controller.isClicked.value = true;
                                                    _addDrug();
                                                  },
                                                  textSize: 18,
                                                  child: const DefaultText(
                                                    text: "Submit",
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      textSize: 18,
                      child: const DefaultText(text: "Add Drug"))
                ],
              ),
              const SizedBox(height: 20.0),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return DefaultContainer(
                      child: GestureDetector(
                        onTap: () {
                          Constants.showDrugDetails(size, "Drug Name $index",
                              "Drug price $index", context);
                        },
                        child: ListTile(
                          title: DefaultText(text: "Drug Name $index"),
                          subtitle: DefaultText(text: "Drug Price $index"),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
