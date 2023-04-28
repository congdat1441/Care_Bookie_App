
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

Future<bool> createDoctorFavoriteFirebase(DoctorFavorite doctorFavorite,String userId) async {

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  bool check = await userFavoriteExists(userId);

  if(check == false) {
    fireStore.collection("favorites").doc(userId).set(
      Favorite(id: userId).toJson()
    );
  }
  
  var response = await fireStore.collection("favorites")
      .doc(userId).collection("doctors")
      .doc(doctorFavorite.id).set(doctorFavorite.toJson())
  .then((value) {
    return true;
  })
  .catchError((e) {
    return false;
  });

  return response;
  
}

Future<bool> userFavoriteExists(String userId) async {

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  var response = await fireStore.collection("favorites").doc(userId).get()
  .then((value){

    if(value.exists) {
      return true;
    }
    return false;
  })
  .catchError((e) {
    return false;
  });

  return response;

}

Future<bool> deleteDoctorFavoriteByIdFirebase(String userId, String doctorId) async {

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  var response = fireStore.collection("favorites")
  .doc(userId).collection("doctors")
  .doc(doctorId)
  .delete()
  .then((value) {
    return true;
  })
  .catchError((e) {
    return false;
  });

  return response;

}

Future<bool> createHospitalFavoriteFirebase(HospitalFavorite hospitalFavorite,String userId) async {

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  bool check = await userFavoriteExists(userId);

  if(check == false) {
    fireStore.collection("favorites").doc(userId).set(
        Favorite(id: userId).toJson()
    );
  }

  var response = await fireStore.collection("favorites")
  .doc(userId).collection("hospitals")
  .doc(hospitalFavorite.id).set(hospitalFavorite.toJson())
  .then((value) {
    return true;
  })
  .catchError((e) {
    return false;
  });

  return response;

}

Future<bool> deleteHospitalFavoriteByIdFirebase(String userId, String hospitalId) {

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  var response = fireStore.collection("favorites")
      .doc(userId).collection("hospitals")
      .doc(hospitalId)
      .delete()
      .then((value) {
    return true;
  })
      .catchError((e) {
    return false;
  });

  return response;


}