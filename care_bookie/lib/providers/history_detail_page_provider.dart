
import 'package:care_bookie/models/history.dart';
import 'package:flutter/cupertino.dart';

class HistoryDetailPageProvider extends ChangeNotifier {

  History? historyDetail;

  void setHistoryDetail(History detail) {

    historyDetail = detail;

  }

}