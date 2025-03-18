// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tevent/core/models/event_model.dart';

class FirebaseUtils {

  static CollectionReference<EventModel> getEventCollection() {
    return FirebaseFirestore.instance
        .collection(EventModel.collectionName)
        .withConverter<EventModel>(
          fromFirestore: (snapshot, _) =>
              EventModel.fromFirsStore(snapshot.data()!),
          toFirestore: (event, _) => event.toFireStore(),
        );
  }

  static Future<void> addEventsToFirebase(EventModel event) {
    //create collection
    var CollectionRef = getEventCollection();
    //create doc for the collection
    var docRef = CollectionRef.doc();
    //this becouse the collection make autoID
    event.id = docRef.id;

    return docRef.set(event);
  }
}
