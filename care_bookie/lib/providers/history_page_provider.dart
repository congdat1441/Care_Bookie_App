
import 'package:care_bookie/firebases/firebase_history_data.dart';
import 'package:care_bookie/models/history.dart';
import 'package:flutter/cupertino.dart';

class HistoryPageProvider extends ChangeNotifier {

  Future<List<History>> getAllHistoryByUserId(String userId) async{

    return await getAllHistoryByUserIdFirebase(userId);

  }

  List<History> histories = [];

  Future<void> getAllHospital(String userId) async {
    histories = await getAllHistoryByUserId(userId);
    notifyListeners();
  }


}