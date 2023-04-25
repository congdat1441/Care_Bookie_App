
import 'package:care_bookie/models/schedule.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> createScheduleFirebase(Schedule schedule) async{

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  final response = await fireStore.collection("schedules").doc(schedule.id).set(
    schedule.toJson()
  ).then((value) {
    return true;
  }).catchError((e){
    return false;
  });

  return response;
}

Future<List<Schedule>> getAllScheduleByUserIdFirebase(String userId) async{

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  List<Schedule>  schedules = [];

  await fireStore.collection("schedules").where("user_id", isEqualTo: userId).get()
      .then((value) {
    for (var element in value.docs) {
      schedules.add(Schedule.fromJson(element.data()));
    }
  });

  return schedules;
}

Future<bool> deleteScheduleByIdFirebase(String scheduleId) async{

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  final response = await fireStore.collection("schedules").doc(scheduleId).delete()
  .then((value) {
    return true;
  }).catchError((e) {
    return false;
  });

  return response;

}