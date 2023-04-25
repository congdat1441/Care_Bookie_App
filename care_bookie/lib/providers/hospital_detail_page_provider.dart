
import 'package:care_bookie/models/schedule.dart';
import 'package:flutter/cupertino.dart';

import '../models/hospital.dart';

class HospitalDetailPageProvider extends ChangeNotifier {

  Hospital? hospitalDetails;

  Schedule? scheduleWithHospital;

  void setHospitalDetails(Hospital hospital) {
    hospitalDetails = hospital;
  }

  void setScheduleWithHospital(Schedule schedule) {
    scheduleWithHospital = schedule;
  }

}