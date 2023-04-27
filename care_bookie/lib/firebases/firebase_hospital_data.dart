
import 'package:care_bookie/models/schedule.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/doctor.dart';
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

  List<DoctorHospital> doctors = [];

  List<Review> reviews = [];

  await fireStore.collection("hospitals").doc(hospitalId).get().then((value) {

    hospital = Hospital.fromJson(value.data()!);

  });

  await fireStore.collection("hospitals").doc(hospitalId).collection("doctors").get()
  .then((value) {

    for(var element in value.docs) {
      doctors.add(DoctorHospital.fromJson(element.data()));
    }

    hospital.setDoctors(doctors);

  });

  await fireStore.collection("hospitals").doc(hospitalId).collection("reviews").get()
      .then((value) {

    for(var element in value.docs) {
      reviews.add(Review.fromJson(element.data()));
    }

    hospital.setReviews(reviews);

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

Future<ReviewResponseData> reviewExistsByHospitalIdFirebase(String userId,String hospitalId) async {


  FirebaseFirestore fireStore = FirebaseFirestore.instance;



  late int reviewLength;

  late num star;

  await fireStore.collection("hospitals").doc(hospitalId).collection("reviews").get().then((value) => {
    reviewLength = value.docs.length
  });

  await fireStore.collection("hospitals").doc(hospitalId).get().then((value) => {
    star = value.data()!['star']
  });

  ReviewResponseData data = ReviewResponseData(reviewDocId: "", starUser: 0,reviewLength: reviewLength, starTotal: star);

  await fireStore.collection("hospitals").doc(hospitalId).collection("reviews").where("user_id", isEqualTo: userId).get()
      .then((value){
    if(value.docs.isNotEmpty) {
      data = ReviewResponseData(reviewDocId: value.docs[0].id, starUser: value.docs[0].data()['star'],reviewLength: reviewLength, starTotal: star);
    }
  });

  return data;

}

Future<bool> createReviewHospitalFireBase(Review review,String hospitalId,double starMedium) async{

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  await fireStore.collection("hospitals").doc(hospitalId).collection("reviews").add(
      review.toJson()
  ).catchError((e) {
    // ignore: invalid_return_type_for_catch_error
    return false;
  });

  await fireStore.collection("hospitals").doc(hospitalId).update({
    'star' : starMedium
  }).then((value) {
    return true;
  }).catchError((e) {
    return false;
  });

  Schedule? scheduleResponse;

  HospitalSchedule? hospitalSchedule;

  await fireStore.collection("schedules").where("hospital_id", isEqualTo: hospitalId).get()
  .then((value){
    if(value.docs.isNotEmpty) {
      scheduleResponse = Schedule.fromJson(value.docs[0].data());
      hospitalSchedule = HospitalSchedule(
          id: scheduleResponse!.hospital.id,
          hospitalName: scheduleResponse!.hospital.hospitalName,
          image: scheduleResponse!.hospital.image,
          fee: scheduleResponse!.hospital.fee,
          address: scheduleResponse!.hospital.address,
          star: starMedium
      );
    }

  });

  if(scheduleResponse != null) {
    await fireStore.collection("schedules").doc(scheduleResponse!.id).update({
      'hospital' : hospitalSchedule!.toJson()
    }).then((value) {
      return true;
    }).catchError((e) {
      return false;
    });
  }

  return true;

}

Future<bool> updateReviewByHospitalIdFirebase(Review review,String hospitalId,double starMedium, String reviewId) async {


  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  await fireStore.collection("hospitals").doc(hospitalId).collection("reviews").doc(reviewId).update(
      review.toJson()
  ).catchError((e) {
    // ignore: invalid_return_type_for_catch_error
    return false;
  });

  await fireStore.collection("hospitals").doc(hospitalId).update({
    'star' : starMedium
  }).then((value) {
    return true;
  }).catchError((e) {
    return false;
  });

  Schedule? scheduleResponse;

  HospitalSchedule? hospitalSchedule;

  await fireStore.collection("schedules").where("hospital_id", isEqualTo: hospitalId).get()
      .then((value){
    if(value.docs.isNotEmpty) {
      scheduleResponse = Schedule.fromJson(value.docs[0].data());
      hospitalSchedule = HospitalSchedule(
          id: scheduleResponse!.hospital.id,
          hospitalName: scheduleResponse!.hospital.hospitalName,
          image: scheduleResponse!.hospital.image,
          fee: scheduleResponse!.hospital.fee,
          address: scheduleResponse!.hospital.address,
          star: starMedium
      );
    }

  });

  if(scheduleResponse != null) {
    await fireStore.collection("schedules").doc(scheduleResponse!.id).update({
      'hospital' : hospitalSchedule!.toJson()
    }).then((value) {
      return true;
    }).catchError((e) {
      return false;
    });
  }

  return true;

}
