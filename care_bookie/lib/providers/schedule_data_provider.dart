
import 'package:care_bookie/firebases/firebase_schedule_data.dart';
import 'package:care_bookie/models/hospital.dart';
import 'package:care_bookie/models/schedule.dart';
import 'package:care_bookie/models/user.dart';
import 'package:flutter/foundation.dart';

import '../models/history.dart';
import '../view/pages/utils/generate_random_string_util.dart';

class ScheduleDataProvider extends ChangeNotifier{

  DoctorHospital? scheduleDoctor;

  String? scheduleDay;

  String? scheduleTime;

  String? symptom;

  List<History> shareHistory = [];

  Hospital? hospital;

  UserData? user;


  void setScheduleDoctor(DoctorHospital doctor) {
    scheduleDoctor = doctor;
  }

  void setScheduleDay(String day) {
    scheduleDay = day;
  }

  void setScheduleTime(String time) {
    scheduleTime = time;
  }

  void setSymptom(String symptom) {
    this.symptom = symptom;
  }

  void setHospital(Hospital hospital) {
    this.hospital = hospital;
  }

  void setUser(UserData user) {
    this.user = user;
  }

  void resetData() {
    scheduleDoctor = null;
    scheduleDay = null;
    scheduleTime = null;
    symptom = null;
    shareHistory = [];
    hospital = null;
    user = null;
  }

  Future<bool> createSchedule() async{

    List<HistorySchedule> historySchedule = [];

    String id = generateRandomString();

    String time =  '$scheduleTime $scheduleDay';

    historySchedule = shareHistory.map((e) => HistorySchedule(
        hospitalName: e.hospital.hospitalName,
        diagnosis: e.diagnosis,
        appointment: e.appointment)
    ).toList();

    HospitalSchedule hospitalSchedule = HospitalSchedule(
        id: hospital!.id,
        hospitalName: hospital!.hospitalName,
        image: hospital!.image,
        fee: hospital!.fee,
        address: hospital!.address,
        star: hospital!.star
    );

    Schedule schedule = Schedule(
        id: id,
        hospital: hospitalSchedule,
        doctor: scheduleDoctor!,
        time: time,
        symptom: symptom!,
        fee: hospital!.fee,
        accept: false,
        shareHistory: historySchedule,
        userId: user!.id!,
        user: user!,
    );

    return await createScheduleFirebase(schedule);
  }

}