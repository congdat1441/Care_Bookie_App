import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/doctor.dart';
import '../models/hospital.dart';


Future<List<Doctor>> getAllDoctorFirebase() async {

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  List<Doctor> doctors = [];

  List<String> listDoctorId = [];

  await fireStore.collection("doctors").get()
      .then((value){
    for (var element in value.docs) {
      doctors.add(Doctor.fromJson(element.data()));
      listDoctorId.add(element.id);
    }
  });


  for(int i = 0 ; i < listDoctorId.length; i++) {

    List<Review> reviews = [];

    await fireStore.collection("doctors").doc(listDoctorId[i]).collection("reviews").get()
        .then((value){

      for (var element in value.docs) {

        reviews.add(Review.fromJson(element.data()));

      }

    });

    doctors[i].setReviews(reviews);

  }


  return doctors;

}

Future<Doctor> getDoctorByIdFirebase(String id) async{

  late Doctor doctor;

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  await fireStore.collection("doctors").doc(id).get().then((value) {

    doctor = Doctor.fromJson(value.data()!);

  });

  await fireStore.collection("doctors").doc(id).collection("reviews").get().then((value) {

    List<Review> reviews = [];

    for (var element in value.docs) {

      reviews.add(Review.fromJson(element.data()));

    }

    doctor.setReviews(reviews);

  });

  return doctor;

}


Future<ReviewResponseData> reviewExistsByUserIdFirebase(String userId,String doctorId) async {


  FirebaseFirestore fireStore = FirebaseFirestore.instance;



  late int reviewLength;

  late num star;

  await fireStore.collection("doctors").doc(doctorId).collection("reviews").get().then((value) => {
    reviewLength = value.docs.length
  });

  await fireStore.collection("doctors").doc(doctorId).get().then((value) => {
    star = value.data()!['star']
  });

  ReviewResponseData data = ReviewResponseData(reviewDocId: "", starUser: 0,reviewLength: reviewLength, starTotal: star);

  await fireStore.collection("doctors").doc(doctorId).collection("reviews").where("user_id", isEqualTo: userId).get()
      .then((value){
    if(value.docs.isNotEmpty) {
      data = ReviewResponseData(reviewDocId: value.docs[0].id, starUser: value.docs[0].data()['star'],reviewLength: reviewLength, starTotal: star);
    }
  });

  return data;

}

Future<bool> createReviewDoctorFireBase(Review review,String doctorId,double starMedium) async{

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  await fireStore.collection("doctors").doc(doctorId).collection("reviews").add(
      review.toJson()
  ).catchError((e) {
    // ignore: invalid_return_type_for_catch_error
    return false;
  });

  await fireStore.collection("doctors").doc(doctorId).update({
    'star' : starMedium
  }).then((value) {
    return true;
  }).catchError((e) {
    return false;
  });

  return true;

}

Future<bool> updateReviewByUserIdFirebase(Review review,String doctorId,double starMedium, String reviewId) async {


  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  await fireStore.collection("doctors").doc(doctorId).collection("reviews").doc(reviewId).update(
      review.toJson()
  ).catchError((e) {
    // ignore: invalid_return_type_for_catch_error
    return false;
  });

  await fireStore.collection("doctors").doc(doctorId).update({
    'star' : starMedium
  }).then((value) {
    return true;
  }).catchError((e) {
    return false;
  });

  return true;


}

