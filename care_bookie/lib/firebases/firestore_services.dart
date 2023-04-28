import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';

class FirestoreServices {
  static Future saveUser(
      String dob,
      String email,
      String fullName,
      bool gender,
      String id,
      String image,
      String phone
      ) async {
    await FirebaseFirestore.instance.collection('users').doc(id).set({
      'email': email,
      'full_name': fullName,
      'id': id,
      'dob': "00/00/0000",
      'gender': true,
      'image': "https://media.istockphoto.com/id/1337144146/vector/default-avatar-profile-icon-vector.jpg?s=612x612&w=0&k=20&c=BIbFwuv7FxTWvh5S3vB6bkT0Qv8Vn8N5Ffseq84ClGI=",
      'phone': "000...",
    });
  }

  static saveUserGoogle(String dob, String email, String fullName, bool gender,
      String id, String image, String phone) async {
    await FirebaseFirestore.instance.collection('users').doc(id).set({
      'dob': dob,
      'email': email,
      'full_name': fullName,
      'gender': gender,
      'image': image,
      'phone': phone,
      'id': id,
    });
  }

}
