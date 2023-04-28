import 'package:flutter/cupertino.dart';

import '../firebases/firebase_doctor_data.dart';
import '../firebases/firebase_hospital_data.dart';
import '../models/doctor.dart';
import '../models/hospital.dart';

class HomePageProvider extends ChangeNotifier {
  List<Hospital> listHospital = [];

  List<Doctor> listDoctor = [];

  Future<void> getAllHospital() async {
    listHospital = await getAllHospitalFirebase();
    notifyListeners();
  }

  Future<void> getAllDoctor() async {
    listDoctor = await getAllDoctorFirebase();
    notifyListeners();
  }
}
