
import 'package:care_bookie/firebases/firebase_history_data.dart';
import 'package:care_bookie/models/history.dart';
import 'package:flutter/cupertino.dart';

class HistoryPageProvider extends ChangeNotifier {

  Future<List<History>> getAllHistoryByUserId(String userId) async{

    return await getAllHistoryByUserIdFirebase(userId);

  }



}