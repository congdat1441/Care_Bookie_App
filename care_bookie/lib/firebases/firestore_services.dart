import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';

class FirestoreServices {
  static saveUser(
      String dob, email, full_name, gender, id, image, phone) async {
    await FirebaseFirestore.instance.collection('users').doc(id).set({
      'email': email,
      'full_name': full_name,
      'uid': id,
      'dob': dob,
      'gender': gender,
      'image': image,
      'phone': phone,
    });
  }

  static saveUserGoogle(String dob, String email, String full_name, String gender,
      String id, String image, String phone) async {
    await FirebaseFirestore.instance.collection('users').doc(id).set({
      'dob': dob,
      'email': email,
      'full_name': full_name,
      'gender': gender,
      'image': image,
      'phone': phone,
      'uid': id,
    });
  }
}
