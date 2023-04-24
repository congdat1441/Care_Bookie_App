
import 'package:care_bookie/models/schedule.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> createScheduleFirebase(Schedule schedule) async{

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  await fireStore.collection("schedules").doc(schedule.id).set(
    schedule.toJson()
  );
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