
import 'package:care_bookie/firebases/firebase_favorite_data.dart';
import 'package:care_bookie/models/favorite.dart';
import 'package:flutter/cupertino.dart';

class FavoriteHospitalDataProvider extends ChangeNotifier {

  Future<bool> createHospitalFavorite(HospitalFavorite hospitalFavorite,String userId) async {

    return await createHospitalFavoriteFirebase(hospitalFavorite, userId);

  }

  Future<bool> deleteHospitalFavoriteById(String userId,String hospitalId) async {

    return await deleteHospitalFavoriteByIdFirebase(userId, hospitalId);

  }
}