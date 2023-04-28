
import 'package:care_bookie/models/favorite.dart';
import 'package:flutter/cupertino.dart';

import '../firebases/firebase_doctor_data.dart';
import '../firebases/firebase_hospital_data.dart';
import '../models/doctor.dart';
import '../models/hospital.dart';
import '../models/schedule.dart';

class DoctorDetailPageProvider extends ChangeNotifier {

  Doctor? doctorDetail;

  bool isDoctorWithHospital = false;

  bool isDoctorWithFavorite = false;

  String? idDoctorWithHospital;

  Schedule? scheduleWithDoctor;

  Schedule? scheduleWithHospital;

  bool isFavorite = false;

  DoctorFavorite? doctorFavorite;

  void setIsFavorite(bool value) {
    isFavorite = value;
  }

  void setDoctorFavorite(DoctorFavorite doctor) {
    doctorFavorite = doctor;
  }

  void setIsDoctorWithFavorite(bool value) {
    isDoctorWithFavorite = value;
  }

  void resetData() {
    scheduleWithDoctor = null;
    scheduleWithHospital = null;
    isFavorite = false;
    doctorFavorite = null;
    isDoctorWithFavorite = false;
  }

  void setDoctorDetail(Doctor doctor) {
    doctorDetail = doctor;
  }

  void setIsDoctorWithHospital(bool value) {
    isDoctorWithHospital = value;
  }

  void setIdDoctorWithHospital(String id) {
    idDoctorWithHospital = id;
  }

  void setScheduleWithDoctor(Schedule schedule) {
    scheduleWithDoctor = schedule;
  }

  void setScheduleWithHospital(Schedule schedule) {
    scheduleWithHospital = schedule;
  }

  Future<Doctor> getDoctorById() async {

    return await getDoctorByIdFirebase(idDoctorWithHospital!);

  }

  Future<Hospital> getHospitalById(String hospitalId) async{

    return await getHospitalByIdFirebase(hospitalId);

  }

}