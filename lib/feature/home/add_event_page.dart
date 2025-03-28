// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tevent/core/models/event_model.dart';
import 'package:tevent/core/providers/app_theme_provider.dart';
import 'package:tevent/core/providers/event_proivder.dart';
import 'package:tevent/core/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tevent/core/widget/CustomTextField.dart';
import 'package:tevent/core/widget/TabEventWidget1.dart';
import 'package:provider/provider.dart';
import 'package:tevent/core/widget/custom_eleveted_button.dart'; 
class AddEventPage extends StatefulWidget {
  AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  var startTimeController = TextEditingController();
  var dateContrller = TextEditingController();
  int selectedIndex = 0;
  var titleController = TextEditingController();
  var descriptionContrller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String selectedEvent = '';
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

    return Consumer<AppThemeProvider>(
      // Consumer added to wrap the entire Scaffold
      builder: (context, themeProvider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.whiteColor,
            foregroundColor: themeProvider.app_theme == ThemeMode.dark
                ? AppColors.primaryDark
                : AppColors.primaryLight,
            centerTitle: true,
            title: Text(
              AppLocalizations.of(context)!.create,
              style: TextStyle(
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
                        selectedEvent = eventNameList[index];
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
                            selectedIndex == eventNameList.indexOf(eventName),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Form(
                  key: formKey,
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.title,
                            style: TextStyle(
                                fontFamily: "Times New Roman", fontSize: 17),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            controller: titleController,
                            validator: (value) => value!.isEmpty
                                ? "Please Enter Event Title"
                                : null,
                            hintText: AppLocalizations.of(context)!.eventTitle,
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
                            controller: descriptionContrller,
                            validator: (value) => value!.isEmpty
                                ? "Please Enter Event Description"
                                : null,
                            hintText: AppLocalizations.of(context)!.description,
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
                            hintText: AppLocalizations.of(context)!.date,
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
                                        DateFormat("dd/MM/yyyy")
                                            .format(pickedDate);
                                  });
                                }
                              },
                              child: Text(
                                AppLocalizations.of(context)!.chooseDate,
                                style: TextStyle(
                                  fontFamily: "Times New Roman",
                                  color:
                                      themeProvider.app_theme == ThemeMode.dark
                                          ? AppColors.primaryDark
                                          : AppColors.primaryLight,
                                ),
                              ),
                            ),
                            hintStyle: TextStyle(
                              fontFamily: "Times New Roman",
                              color: AppColors.greyColor,
                            ),
                            color: AppColors.transparentColor,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            hintText: AppLocalizations.of(context)!.time,
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
                                    startTimeController.text =
                                        value.format(context);
                                  }
                                  return null;
                                });
                                if (pickedTime != null) {
                                  setState(() {
                                    startTimeController.text =
                                        DateFormat("dd/MM/yyyy")
                                            .format(pickedTime);
                                  });
                                }
                              },
                              child: Text(
                                AppLocalizations.of(context)!.choosetime,
                                style: TextStyle(
                                  fontFamily: "Times New Roman",
                                  color:
                                      themeProvider.app_theme == ThemeMode.dark
                                          ? AppColors.primaryDark
                                          : AppColors.primaryLight,
                                ),
                              ),
                            ),
                            hintStyle: TextStyle(
                              fontFamily: "Times New Roman",
                              color: AppColors.greyColor,
                            ),
                            color: AppColors.transparentColor,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            hintText:
                                " " + AppLocalizations.of(context)!.location,
                            color: themeProvider.app_theme == ThemeMode.dark
                                ? AppColors.primaryDark
                                : AppColors.primaryLight,
                            hintStyle: TextStyle(
                              fontFamily: "Times New Roman",
                              color: themeProvider.app_theme == ThemeMode.dark
                                  ? AppColors.primaryDark
                                  : AppColors.primaryLight,
                            ),
                            prefixIcon: Padding(
                              padding:
                                  EdgeInsets.only(left: 8, top: 3, bottom: 3),
                              child: Container(
                                width: 20,
                                decoration: BoxDecoration(
                                    color: themeProvider.app_theme == 
                                            ThemeMode.dark
                                        ? AppColors.primaryDark
                                        : AppColors.primaryLight,
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
                                color: themeProvider.app_theme == ThemeMode.dark
                                    ? AppColors.primaryDark
                                    : AppColors.primaryLight,
                              ),
                            ),
                            readOnly: true,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: CustomElevetedButton(
                              text: AppLocalizations.of(context)!.addEvent,
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  // Create the event object
                                  var event = EventModel(
                                    title: titleController.text,
                                    description: descriptionContrller.text,
                                    dateTime: dateContrller.text,
                                    time: startTimeController.text,
                                    eventName: selectedEvent,
                                  );

                                  // Call the addEvent method from the EventProvider
                                  await context.read<EventProvider>().addEvent(event);
                                  Navigator.pushNamed(context, '/home');
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
