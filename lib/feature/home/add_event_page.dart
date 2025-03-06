// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tevent/core/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tevent/core/widget/CustomTextField.dart';
import 'package:tevent/core/widget/TabEventWidget1.dart';
import 'package:tevent/feature/home/home_page.dart';

class AddEventPage extends StatefulWidget {
  AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  var startTimeController = TextEditingController();
  var dateContrller = TextEditingController();
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<String> eventNameList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sports,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.meetting,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.eating,
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        foregroundColor: AppColors.primaryLight,
        centerTitle: true,
        title: Text(
          "Create Event",
          style: TextStyle(
            color: AppColors.primaryLight,
            fontFamily: "Times New Roman",
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 190,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage("assets/images/birthday.png"),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 10,
            ),
            DefaultTabController(
              length: eventNameList.length,
              child: TabBar(
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  indicatorColor: AppColors.transparentColor,
                  dividerColor: AppColors.transparentColor,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  labelPadding:
                      EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  tabs: eventNameList.map((eventName) {
                    return Tabeventwidget1(
                        eventName: eventName,
                        isSelected:
                            selectedIndex == eventNameList.indexOf(eventName));
                  }).toList()),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Title",
                      style: TextStyle(
                          fontFamily: "Times New Roman", fontSize: 17),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hintText: "Event Title",
                      prefixIcon: Icon(Icons.edit_square),
                      hintStyle: TextStyle(
                          fontFamily: "Times New Roman",
                          color: AppColors.greyColor),
                      color: AppColors.greyColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hintText: "Event Description",
                      maxLines: 3,
                      color: AppColors.greyColor,
                      hintStyle: TextStyle(
                          fontFamily: "Times New Roman",
                          color: AppColors.greyColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hintText:
                          "Event Date", // Hint will be visible when text is empty
                      controller: dateContrller,
                      readOnly: true,
                      prefixIcon: Icon(Icons.calendar_month_rounded),
                      suffixIcon: GestureDetector(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2028),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              dateContrller.text =
                                  DateFormat("dd/MM/yyyy").format(pickedDate);
                            });
                          }
                        },
                        child: Text(
                          "Choose Date",
                          style: TextStyle(
                            fontFamily: "Times New Roman",
                            color: AppColors.primaryLight,
                          ),
                        ),
                      ),
                      hintStyle: TextStyle(
                        fontFamily: "Times New Roman",
                        color: AppColors
                            .greyColor, // Ensure hint color is distinct
                      ),
                      color: AppColors.transparentColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hintText:
                          "Event Time", // Hint will be visible when text is empty
                      controller: startTimeController,
                      readOnly: true,
                      prefixIcon: Icon(Icons.access_time_rounded),
                      suffixIcon: GestureDetector(
                        onTap: () async {
                          DateTime? pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now())
                              .then((value) {
                            if (value != null) {
                              startTimeController.text = value.format(context);
                            }
                          });

                          if (pickedTime != null) {
                            setState(() {
                              startTimeController.text =
                                  DateFormat("dd/MM/yyyy").format(pickedTime);
                            });
                          }
                        },
                        child: Text(
                          "Choose Time",
                          style: TextStyle(
                            fontFamily: "Times New Roman",
                            color: AppColors.primaryLight,
                          ),
                        ),
                      ),
                      hintStyle: TextStyle(
                        fontFamily: "Times New Roman",
                        color: AppColors
                            .greyColor, // Ensure hint color is distinct
                      ),
                      color: AppColors.transparentColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hintText: " choose event location",
                      color: AppColors.primaryLight,
                      hintStyle: TextStyle(
                        fontFamily: "Times New Roman",
                        color: AppColors.primaryLight,
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 8, top: 3, bottom: 3),
                        child: Container(
                          width: 20,
                          decoration: BoxDecoration(
                              color: AppColors.primaryLight,
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.my_location_rounded,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: AppColors.primaryLight,
                        ),
                      ),
                      readOnly: true,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryLight,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // Adjust as needed
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .pop();
                        },
                        child: Text(
                          "Add Event",
                          style: TextStyle(
                              fontFamily: "Times New Roman",
                              color: AppColors.whiteColor),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
