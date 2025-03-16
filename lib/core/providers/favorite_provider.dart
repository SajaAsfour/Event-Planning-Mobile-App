import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  final List<dynamic> _favoriteEvents = [];

  List<dynamic> get favoriteEvents => _favoriteEvents;

  void toggleFavorite(dynamic event) {
    if (_favoriteEvents.contains(event)) {
      _favoriteEvents.remove(event);
    } else {
      _favoriteEvents.add(event);
    }
    notifyListeners(); 
  }

  bool isFavorite(dynamic event) {
    return _favoriteEvents.contains(event);
  }
}
