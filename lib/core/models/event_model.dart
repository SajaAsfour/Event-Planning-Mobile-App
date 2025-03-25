// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tevent/core/utils/app_colors.dart';

class EventModel {
  static const String collectionName = "Events";
  final StreamController<bool> _favController = StreamController<bool>.broadcast();
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

    Stream<bool> get favStream => _favController.stream;
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

    // update the state
    isFav = newFavStatus;
    _favController.add(isFav); 
    log("Favorite status updated successfully!");
  } catch (e) {
    log("Error updating favorite status: $e");
  }
}

  // colse the StreamController 
  void dispose() {
    _favController.close();
  }

Future<void> deleteDoc() async {
  try {
    
    await FirebaseFirestore.instance
        .collection(EventModel.collectionName)
        .doc(id).delete();

    // Ensure local state is also updated
    log("Doc deleted successfully!");
  } catch (e) {
    log("Error deletting doc: $e");
  }
}

}