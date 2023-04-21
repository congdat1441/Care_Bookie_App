
import 'package:flutter/cupertino.dart';

import '../firebases/firebase_doctor_data.dart';
import '../firebases/firebase_hopital_data.dart';
import '../models/doctor.dart';
import '../models/hospital.dart';

class HomePageProvider extends ChangeNotifier {


  Future<List<Hospital>> getAllHospital() async{
    return await getAllHospitalFirebase();
  }

  Future <List<Doctor>> getAllDoctor() async {

    return await getAllDoctorFirebase();

  }

}