
import 'package:care_bookie/models/schedule.dart';
import 'package:flutter/cupertino.dart';

class ScheduleDetailPageProvider extends ChangeNotifier {

  Schedule? scheduleDetail;

  void setScheduleDetail(Schedule schedule) {
    scheduleDetail = schedule;
  }
}