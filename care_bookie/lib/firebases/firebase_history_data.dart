import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/history.dart';

Future<List<History>> getAllHistoryByUserIdFirebase(String userId) async {

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  List<History> histories = [];

  await fireStore.collection("histories").where("userId", isEqualTo: userId).get()
      .then((value) {
    for (var element in value.docs) {
      histories.add(History.fromJson(element.data()));
    }
  });

  return histories;

}