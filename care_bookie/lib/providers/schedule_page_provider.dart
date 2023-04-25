
import 'package:care_bookie/firebases/firebase_schedule_data.dart';
import 'package:flutter/cupertino.dart';

import '../models/schedule.dart';

class SchedulePageProvider extends ChangeNotifier {

  List<Schedule> schedules = [];

  Future<void> getAllScheduleByUserId(String userId) async{
    schedules = await getAllScheduleByUserIdFirebase(userId);
    notifyListeners();
  }

}