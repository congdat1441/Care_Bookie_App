
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/hospital.dart';


Future<List<Hospital>> getAllHospitalFirebase() async {

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  List<Hospital> hospitals = [];

  List<String> listHospitalId = [];

  await fireStore.collection("hospitals").get()
      .then((value){
    for (var element in value.docs) {
      hospitals.add(Hospital.fromJson(element.data()));
      listHospitalId.add(element.id);
    }
  });

  for(int i = 0 ; i < listHospitalId.length; i++) {

    List<DoctorHospital> listDoctorHospital = [];

    await fireStore.collection("hospitals").doc(listHospitalId[i]).collection("doctors").get()
        .then((value){

      for (var element in value.docs) {

        listDoctorHospital.add(DoctorHospital.fromJson(element.data()));

      }

    });

    hospitals[i].setDoctors(listDoctorHospital);

  }

  for(int i = 0 ; i < listHospitalId.length; i++) {

    List<Review> reviews = [];

    await fireStore.collection("hospitals").doc(listHospitalId[i]).collection("reviews").get()
        .then((value){

      for (var element in value.docs) {

        reviews.add(Review.fromJson(element.data()));

      }

    });

    hospitals[i].setReviews(reviews);

  }



  return hospitals;

}

Future<Hospital> getHospitalByIdFirebase(String hospitalId) async {

  late Hospital hospital;

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  await fireStore.collection("hospitals").doc(hospitalId).get().then((value) {

    hospital = Hospital.fromJson(value.data()!);

  });

  return hospital;

}

Future<bool> createReviewHospital(Review review,String hospitalId) async{

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  var response = await fireStore.collection("doctors").doc(hospitalId).collection("reviews").add(
      review.toJson()
  ).then((value) {
    return true;
  })
      .catchError((e){
    return false;
  });

  return response;

}
