import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tevent/core/models/event_model.dart';
import 'package:tevent/core/utils/firebase_utils.dart';

class EventProvider extends ChangeNotifier {
  List<EventModel> _events = [];
  List<EventModel> _favoriteEvents = [];

  List<EventModel> get events => _events;
  List<EventModel> get favoriteEvents => _favoriteEvents;

  Future<void> getAllEvents() async {
    try {
      QuerySnapshot query = await FirebaseFirestore.instance
          .collection(EventModel.collectionName)
          .orderBy('dateTime')
          .get();
      _events = query.docs
          .map((doc) =>
              EventModel.fromFireStore(doc.data() as Map<String, dynamic>))
          .toList();
      notifyListeners();
    } catch (e) {
      log("Error fetching events: $e");
    }
  }

  // Fetch filtered events by event name
  Future<void> getFilterEvents(String filterEvent) async {
    try {
      Query query =
          FirebaseFirestore.instance.collection(EventModel.collectionName);
      if (filterEvent != 'All') {
        query = query.where("eventName", isEqualTo: filterEvent);
      }
      var events = await query.get();
      _events = events.docs
          .map((doc) =>
              EventModel.fromFireStore(doc.data() as Map<String, dynamic>))
          .toList();
      notifyListeners();
    } catch (e) {
      log("Error fetching filtered events: $e");
    }
  }

  // Fetch favorite events from Firestore
  Future<void> getFavoriteEvents() async {
    try {
      QuerySnapshot query = await FirebaseFirestore.instance
          .collection(EventModel.collectionName)
          .where("isFav", isEqualTo: true)
          .get();

      _favoriteEvents = query.docs
          .map((doc) =>
              EventModel.fromFireStore(doc.data() as Map<String, dynamic>))
          .toList();
      notifyListeners();
    } catch (e) {
      log("Error fetching favorite events: $e");
    }
  }

  // Delete an event
  Future<void> deleteEvent(String eventId) async {
    try {
      await FirebaseFirestore.instance
          .collection(EventModel.collectionName)
          .doc(eventId)
          .delete();
      _events.removeWhere((event) => event.id == eventId);
      _favoriteEvents.removeWhere((event) => event.id == eventId);
      notifyListeners();
      log("Event deleted successfully!");
    } catch (e) {
      log("Error deleting event: $e");
    }
  }

  // Toggle favorite status and update Firestore
  Future<void> updateFavoriteStatus(EventModel event) async {
    try {
      bool newFavStatus = !event.isFav;
      await FirebaseFirestore.instance
          .collection(EventModel.collectionName)
          .doc(event.id)
          .update({'isFav': newFavStatus});

      // Update local lists
      event.isFav = newFavStatus;
      if (newFavStatus) {
        _favoriteEvents.add(event);
      } else {
        _favoriteEvents.removeWhere((e) => e.id == event.id);
      }

      notifyListeners();
      log("Favorite status updated successfully!");
    } catch (e) {
      log("Error updating favorite status: $e");
    }
  }

  Future<void> addEvent(EventModel event) async {
    try {
      await FirebaseUtils.addEventsToFirebase(event);
      _events.add(event); 
      log("Event added successfully");
    } catch (e) {
      log("Error adding event: $e");
    }
  }
  
}
