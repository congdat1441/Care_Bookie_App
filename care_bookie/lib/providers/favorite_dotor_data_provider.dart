
import 'package:care_bookie/firebases/firebase_favorite_data.dart';
import 'package:care_bookie/models/favorite.dart';
import 'package:flutter/foundation.dart';

class FavoriteDoctorDataProvider extends ChangeNotifier {



  Future<bool> createDoctorFavorite(DoctorFavorite doctorFavorite,String userId) async {

    return await createDoctorFavoriteFirebase(doctorFavorite, userId);

  }

  Future<bool> deleteDoctorFavoriteById(String userId,String doctorId) async {

    return await deleteDoctorFavoriteByIdFirebase(userId, doctorId);

  }

}