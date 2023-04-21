
import 'package:flutter/cupertino.dart';

import '../models/doctor.dart';

class DoctorDetailProvider extends ChangeNotifier {

  Doctor? doctorDetail;

  void setDoctorDetail(Doctor doctor) {
    doctorDetail = doctor;
  }

}