import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'firestore_services.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static signupUser(String email, String password, String name, String dob,
      String gender, String image, String phone, BuildContext context) async {
    try {
      List<String> providers =
      await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      if (providers.contains('google.com')) {
        throw Exception('This email has already been registered with Google');
      }

      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // Gửi email xác thực đến địa chỉ email đăng ký của người dùng
      await userCredential.user!.sendEmailVerification();

      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      await FirebaseAuth.instance.currentUser!.updateEmail(email);
      await FirestoreServices.saveUser(
          dob, email, name, gender, userCredential.user!.uid, image, phone);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration Successful')));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password Provided is too weak')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email Provided already Exists')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  static signinUser(String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('You are Logged in')));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No user Found with this Email')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password did not match')));
      }
    }
  }

  static logoutUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('You are Logged out')));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);

        final UserCredential authResult =
            await _auth.signInWithCredential(authCredential);
        final User user = authResult.user!;

        final CollectionReference usersCollection =
            firestore.collection('users');
        final DocumentReference newDocument = usersCollection.doc();
        final String newId = newDocument.id;

        if (user != null) {
          final CollectionReference usersCollection = firestore.collection('users');
          final DocumentReference userRef = usersCollection.doc(user.uid);
          final DocumentSnapshot userSnapshot = await userRef.get();

          if (userSnapshot.exists) {
            await _auth.signInWithCredential(authCredential);
          } else {
            await userRef.set({
              'id': newId,
              'dob': '',
              'email': user.email,
              'full_name': user.displayName,
              'gender': '',
              'image': user.photoURL,
              'phone': '',
            });
          }
        }
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  getUserInfo(){
    String id = FirebaseAuth.instance.currentUser!.uid;
    // FirebaseFirestore.instance.collection(('users').doc(uid).snapshots().listen)
  }
}
