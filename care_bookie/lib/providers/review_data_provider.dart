
import 'package:care_bookie/firebases/firebase_doctor_data.dart';
import 'package:care_bookie/firebases/firebase_hospital_data.dart';
import 'package:care_bookie/models/hospital.dart';
import 'package:flutter/cupertino.dart';

import '../models/doctor.dart';

class ReviewDataProvider extends ChangeNotifier {

  double starDefault = 4;

  void setStarDefault(double star) {
    starDefault = star;
  }

  Future<bool> createReviewDoctor(Review review,String doctorId,double starMedium) async {

    return createReviewDoctorFireBase(review, doctorId, starMedium);

  }

  Future<bool> updateReviewByUserId(Review review,String doctorId,double starMedium,String reviewId) async {

    return await updateReviewByUserIdFirebase(review, doctorId, starMedium, reviewId);

  }

  Future<ReviewResponseData> reviewExistsByUserId(String userId,String doctorId) async {

    return await reviewExistsByUserIdFirebase(userId, doctorId);

  }

  Future<ReviewResponseData> reviewExistsByHospitalId(String userId,String hospitalId) async{

    return await reviewExistsByHospitalIdFirebase(userId, hospitalId);

  }

  Future<bool> createReviewHospital(Review review,String hospitalId,double  starMedium) async {

    return await createReviewHospitalFireBase(review, hospitalId, starMedium);

  }

  Future<bool> updateReviewByHospitalId(Review review,String hospitalId,double starMedium,String reviewId) async {

    return await updateReviewByHospitalIdFirebase(review, hospitalId, starMedium, reviewId);

  }


}