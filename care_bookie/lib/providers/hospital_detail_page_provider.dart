
import 'package:care_bookie/models/schedule.dart';
import 'package:flutter/cupertino.dart';

import '../models/favorite.dart';
import '../models/hospital.dart';

class HospitalDetailPageProvider extends ChangeNotifier {

  Hospital? hospitalDetails;

  Schedule? scheduleWithHospital;

  bool isFavorite = false;

  HospitalFavorite? hospitalFavorite;

  bool isHospitalWithFavorite = false;

  void resetData() {
    scheduleWithHospital = null;
    isFavorite = false;
    hospitalFavorite = null;
    isHospitalWithFavorite = false;
  }

  void setIsHospitalWithFavorite(bool value) {
    isHospitalWithFavorite = value;
  }

  void setIsFavorite(bool value) {
    isFavorite = value;
  }

  void setHospitalFavorite(HospitalFavorite hospital) {
    hospitalFavorite = hospital;
  }


  void setHospitalDetails(Hospital hospital) {
    hospitalDetails = hospital;
  }

  void setScheduleWithHospital(Schedule schedule) {
    scheduleWithHospital = schedule;
  }

}