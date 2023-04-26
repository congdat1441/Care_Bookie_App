import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/doctor.dart';
import '../models/hospital.dart';


Future<List<Doctor>> getAllDoctorFirebase() async {

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  List<Doctor> doctors = [];

  List<String> listDoctorId = [];

  await fireStore.collection("doctors").where("fields", isEqualTo: "Chuyên Khoa Mắt").get()
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

Future<bool> createReviewDoctor(Review review,String doctorId) async{

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  var response = await fireStore.collection("doctors").doc(doctorId).collection("reviews").add(
    review.toJson()
  ).then((value) {
    return true;
  })
  .catchError((e){
    return false;
  });
  
  return response;

}

