

import 'package:care_bookie/models/hospital.dart';
import 'package:care_bookie/models/user.dart';

import 'history.dart';

class Schedule {

  final String id;
  final HospitalSchedule hospital;
  final DoctorHospital doctor;
  final String time;
  final String symptom;
  final String userId;
  final User user;
  final String fee;
  final bool accept;
  final List<HistorySchedule> shareHistory;

  Schedule({
    required this.id,
    required this.hospital,
    required this.doctor,
    required this.time,
    required this.symptom,
    required this.userId,
    required this.user,
    required this.fee,
    required this.accept,
    required this.shareHistory
  });

  Map<String,dynamic> toJson() {

    dynamic shareHistoryJson;

    if(shareHistory.isNotEmpty) {
      shareHistoryJson = shareHistory.map((e) => e.toJson());
    } else {
      shareHistoryJson = "";
    }

    return {
      'id' : id,
      'hospital' : hospital.toJson(),
      'doctor' : doctor.toJson(),
      'time' : time,
      'symptom' : symptom,
      'user_id' : userId,
      'user' : user.toJson(),
      'fee' : fee,
      'accept' : accept,
      'share_history' : shareHistoryJson
    };

  }

  factory Schedule.fromJson(Map<String,dynamic> json) {

    var listJson = json['share_history'];

    List<HistorySchedule> shareHistory;

    if(listJson == "") {
      shareHistory = [];
    } else {

      List data = json['share_history'];

      shareHistory = data.map((e) => HistorySchedule.fromJson(e)).toList();
    }

    return Schedule(
        id: json['id'],
        hospital: HospitalSchedule.fromJson(json['hospital']),
        doctor: DoctorHospital.fromJson(json['doctor']),
        time: json['time'],
        symptom: json['symptom'],
        userId: json['user_id'],
        user: User.fromJson(json['user']),
        fee: json['fee'],
        accept: json['accept'],
        shareHistory: shareHistory
    );

  }


}

class HistorySchedule {

  final String hospitalName;
  final String diagnosis;
  final String appointment;

  HistorySchedule({
    required this.hospitalName,
    required this.diagnosis,
    required this.appointment
  });

  factory HistorySchedule.fromJson(Map<String,dynamic> json) {

    return HistorySchedule(
        hospitalName: json['hospital_name'],
        diagnosis: json['diagnosis'],
        appointment: json['appointment']
    );

  }

  Map<String,dynamic> toJson() {

    return {
     'hospital_name' : hospitalName,
      'diagnosis' : diagnosis,
      'appointment' : appointment
    };

  }

}

class HospitalSchedule {

  final String hospitalName;
  final String image;
  final String id;
  final String fee;
  final num star;
  final String address;

  HospitalSchedule({
    required this.id,
    required this.hospitalName,
    required this.image,
    required this.fee,
    required this.address,
    required this.star
  });

  factory HospitalSchedule.fromJson(Map<String,dynamic> json) {

    return HospitalSchedule(
        id: json['id'],
        hospitalName: json['hospital_name'],
        image: json['image'],
        fee: json['fee'],
        address: json['address'],
        star: json['star']
    );

  }


  Map<String,dynamic> toJson() {

    return {
      'id' : id,
      'hospital_name' : hospitalName,
      'image' : image,
      'fee' : fee,
      'address' : address,
      'star' : star
    };

  }

}