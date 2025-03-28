// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tevent/core/models/event_model.dart';
import 'package:tevent/core/providers/app_theme_provider.dart';
import 'package:tevent/core/providers/event_proivder.dart';
import 'package:tevent/core/utils/app_colors.dart';

class EventItemWidget extends StatefulWidget {
  final EventModel event;

  EventItemWidget({super.key, required this.event});

  @override
  State<EventItemWidget> createState() => _EventItemWidgetState();
}

class _EventItemWidgetState extends State<EventItemWidget> {
  late bool isFav; // Local variable to track favorite status

  @override
  void initState() {
    super.initState();
    isFav = widget.event.isFav; // Initialize isFav with the current status
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<AppThemeProvider, EventProvider>(
      builder: (context, themeProvider, eventProvider, child) {
        DateTime? parsedDate;
        try {
          parsedDate = DateFormat("dd/MM/yyyy").parse(widget.event.dateTime);
        } catch (e) {
          parsedDate = null;
        }

        return Container(
          padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
          margin: EdgeInsets.only(bottom: 20),
          height: 260,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/birthday.png"),
              fit: BoxFit.fill,
            ),
            border: Border.all(
              color: themeProvider.app_theme == ThemeMode.dark
                  ? AppColors.primaryDark
                  : AppColors.primaryLight,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          parsedDate != null
                              ? DateFormat("dd").format(parsedDate)
                              : "??",
                          style: TextStyle(
                            color: themeProvider.app_theme == ThemeMode.dark
                                ? AppColors.primaryDark
                                : AppColors.primaryLight,
                            fontFamily: "Times New Roman",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          parsedDate != null
                              ? DateFormat("MMM").format(parsedDate)
                              : "???",
                          style: TextStyle(
                            color: themeProvider.app_theme == ThemeMode.dark
                                ? AppColors.primaryDark
                                : AppColors.primaryLight,
                            fontFamily: "Times New Roman",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await eventProvider.deleteEvent(widget.event.id);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 130),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.event.title,
                          style: TextStyle(
                            color: themeProvider.app_theme == ThemeMode.dark
                                ? AppColors.primaryDark
                                : AppColors.primaryLight,
                            fontFamily: "Times New Roman",
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          // Update favorite status locally and in Firestore
                          await eventProvider.updateFavoriteStatus(widget.event);

                          // Update the local favorite status variable
                          setState(() {
                            isFav = !isFav;
                          });
                        },
                        icon: Icon(
                          widget.event.isFav ? Icons.favorite : Icons.favorite_border,
                          color: widget.event.isFav
                              ? widget.event.FavColor
                              : widget.event.NotFavColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
