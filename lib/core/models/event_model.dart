
class EventModel {
  static const String collectionName = "Events";

  String id;
  String title;
  String description;
  String dateTime;
  String time;
  bool isFav;
  String eventName;

  EventModel({
    this.id ='',
    required this.title,
    required this.dateTime,
    required this.description,
    required this.time,
    required this.eventName,
    this.isFav =false
  });

  //object to json
  Map<String,dynamic> toFireStore(){
    return {
      'id' :id,
      'title': title,
      'dateTime' :dateTime,
      'description' : description,
      'time' : time,
      'isFav' :isFav,
      'eventName' :eventName
    };
  }

  EventModel.fromFirsStore(Map<String,dynamic> data):this(
    id: data['id'],
    title: data['title'],
    dateTime: data['dateTime'],
    description: data['description'],
    time: data['time'],
    isFav: data['isFav'],
    eventName: data['eventName']
  );

}