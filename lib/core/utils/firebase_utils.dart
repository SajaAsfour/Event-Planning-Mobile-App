import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tevent/core/models/event_model.dart';
class FirebaseUtils {
  static void addEventsToFirebase(){
    var events = FirebaseFirestore.instance.collection(EventModel.collectionName);
  }
}