
import 'package:care_bookie/models/favorite.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<Favorite> getFavoriteDataByUserIdFirebase(String userId) async {

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Favorite favorite = Favorite(id: "",);

  await fireStore.collection("favorites").doc(userId).get()
  .then((value) {

    if(value.exists) {
      favorite = Favorite.fromJson(value.data()!);
    }

  });

  List<DoctorFavorite> doctors = [];

  List<HospitalFavorite> hospitals = [];

  if(favorite.id.isNotEmpty) {

    await fireStore.collection("favorites").doc(userId).collection("doctors").get()
    .then((value) {

      for (var element in value.docs) {
        doctors.add(DoctorFavorite.fromJson(element.data()));
      }

    });

    favorite.setDoctors(doctors);

    await fireStore.collection("favorites").doc(userId).collection("hospitals").get()
        .then((value) {

      for (var element in value.docs) {
        hospitals.add(HospitalFavorite.fromJson(element.data()));
      }

    });

    favorite.setHospitals(hospitals);


  }

  return favorite;

}