
import 'package:care_bookie/firebases/firebase_schedule_data.dart';
import 'package:care_bookie/models/schedule.dart';
import 'package:flutter/cupertino.dart';

class ScheduleDetailPageProvider extends ChangeNotifier {

  Schedule? scheduleDetail;

  void setScheduleDetail(Schedule schedule) {
    scheduleDetail = schedule;
  }

  Future<bool> deleteScheduleById(String scheduleId) async{

    return await deleteScheduleByIdFirebase(scheduleId);

  }
}