
import 'package:care_bookie/models/favorite.dart';
import 'package:flutter/material.dart';

import '../firebases/firebase_favorite_data.dart';

class FavoritePageProvider extends ChangeNotifier {

  Favorite? favorite;

  Future<void> getFavoriteDataByUserId(String userId) async {
    favorite = await getFavoriteDataByUserIdFirebase(userId);
    notifyListeners();
  }

}