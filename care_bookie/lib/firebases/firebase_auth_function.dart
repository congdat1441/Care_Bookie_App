import 'package:care_bookie/view/pages/login_signup_page/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

// import 'package:care_bookie/models/user.dart';
import '../models/user.dart';
import '../view/pages/layouts_page/navbar_layout.dart';
import 'firestore_services.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();
  final _db = FirebaseFirestore.instance;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<bool> signupUser(
      String email,
      String password,
      String name,
      String dob,
      bool gender,
      String image,
      String phone,
      BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      await FirebaseAuth.instance.currentUser!.updateEmail(email);

      // Gửi email xác thực đến địa chỉ email đăng ký của người dùng
      await userCredential.user!.sendEmailVerification();
      await userCredential.user!.reload();
      await FirestoreServices.saveUser(
          dob, email, name, gender, userCredential.user!.uid, image, phone);

      if (userCredential.user!.emailVerified) {
        return true;
      } else {
        return false;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password Provided is too weak')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email Provided already Exists')));
      }
      return false;
    } catch (e) {
      return true;
    }
  }

  static saveUser(String email, String password, String name, String dob,
      bool gender, String image, String phone, BuildContext context) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    await FirestoreServices.saveUser(
        dob, email, name, gender, userCredential.user!.uid, image, phone);
  }

  static signinUser(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // Kiểm tra xem email đã được xác minh hay chưa
      if (userCredential.user!.emailVerified) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const NavbarLayout(index: 0)),
        );
      } else {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginForm()),
        );
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please verify your email to login'),
          ),
        );
      }
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
          final CollectionReference usersCollection =
              firestore.collection('users');
          final DocumentReference userRef = usersCollection.doc(user.uid);
          final DocumentSnapshot userSnapshot = await userRef.get();

          if (userSnapshot.exists) {
            await _auth.signInWithCredential(authCredential);
          } else {
            await userRef.set({
              'id': newId,
              'dob': '---',
              'email': user.email,
              'full_name': user.displayName,
              'gender': '---',
              'image': user.photoURL,
              'phone': '---',
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
}
