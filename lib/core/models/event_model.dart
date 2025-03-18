// ignore_for_file: non_constant_identifier_names

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tevent/core/utils/app_colors.dart';

class EventModel {
  static const String collectionName = "Events";

  String id;
  String title;
  String description;
  String dateTime;
  String time;
  bool isFav;
  String eventName;
  Color? FavColor;
  Color? NotFavColor;

  EventModel({
    this.id = '',
    required this.title,
    required this.dateTime,
    required this.description,
    required this.time,
    required this.eventName,
    this.isFav = false,
    this.NotFavColor = AppColors.greyColor,
    this.FavColor = AppColors.redColor,
  });

  // Convert object to Firestore-compatible JSON
  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'title': title,
      'dateTime': dateTime,
      'description': description,
      'time': time,
      'isFav': isFav,
      'eventName': eventName,
      'FavColor': FavColor?.value, // Store Color as an integer
      'NotFavColor': NotFavColor?.value,
    };
  }

  // Create an EventModel object from Firestore data
  EventModel.fromFireStore(Map<String, dynamic> data)
      : this(
          id: data['id'],
          title: data['title'],
          dateTime: data['dateTime'],
          description: data['description'],
          time: data['time'],
          isFav: data['isFav'],
          eventName: data['eventName'],
          FavColor: data['FavColor'] != null ? Color(data['FavColor']) : AppColors.redColor,
          NotFavColor: data['NotFavColor'] != null ? Color(data['NotFavColor']) : AppColors.greyColor,
        );

  // Toggle favorite status and update Firestore
  Future<void> updateFavoriteStatus() async {
  try {
    bool newFavStatus = !isFav;
    await FirebaseFirestore.instance
        .collection(EventModel.collectionName)
        .doc(id)
        .update({'isFav': newFavStatus});

    // Ensure local state is also updated
    isFav = newFavStatus;
    log("Favorite status updated successfully!");
  } catch (e) {
    log("Error updating favorite status: $e");
  }
}

}