
import 'package:flutter/cupertino.dart';

import '../firebases/firebase_doctor_data.dart';
import '../models/doctor.dart';

class DoctorDetailProvider extends ChangeNotifier {

  Doctor? doctorDetail;

  bool isDoctorWithHospital = false;

  String? idDoctorWithHospital;

  void setDoctorDetail(Doctor doctor) {
    doctorDetail = doctor;
  }

  void setIsDoctorWithHospital(bool value) {
    isDoctorWithHospital = value;
  }

  void setIdDoctorWithHospital(String id) {
    idDoctorWithHospital = id;
  }

  Future<Doctor> getDoctorById() async {

    return await getDoctorByIdFirebase(idDoctorWithHospital!);

  }

}