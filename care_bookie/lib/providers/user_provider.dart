// import 'package:flutter/material.dart';
//
// class UserProvider extends ChangeNotifier{
//
//   Future<void> verifyPhone() async {
//     final PhoneVerificationCompleted verificationCompleted =
//         (AuthCredential phoneAuthCredential) {
//       FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
//     };
//
//     final PhoneVerificationFailed verificationFailed =
//         (FirebaseAuthException authException) {
//       print('Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
//     };
//
//     final PhoneCodeSent codeSent =
//         (String verificationId, [int? forceResendingToken]) async {
//       // lưu verification ID để sử dụng khi người dùng nhập mã xác minh
//       this.verificationId = verificationId;
//     };
//
//     final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
//         (String verificationId) {
//       // tự động xác minh khi hết thời gian chờ
//       this.verificationId = verificationId;
//     };
//
//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: phoneNumberController.text,
//       timeout: const Duration(seconds: 60),
//       verificationCompleted: verificationCompleted,
//       verificationFailed: verificationFailed,
//       codeSent: codeSent,
//       codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
//     );
//   }
//
//   Future<void> signInWithPhoneNumber(String smsCode) async {
//     try {
//       final AuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: verificationId,
//         smsCode: smsCode,
//       );
//
//       await FirebaseAuth.instance.signInWithCredential(credential);
//     } on FirebaseAuthException catch (e) {
//       print('Phone number sign in failed. Code: ${e.code}. Message: ${e.message}');
//     }
//   }
//
//   Future<void> signInWithPhoneNumber(String smsCode) async {
//     try {
//       final AuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: verificationId,
//         smsCode: smsCode,
//       );
//
//       await FirebaseAuth.instance.signInWithCredential(credential);
//     } on FirebaseAuthException catch (e) {
//       print('Phone number sign in failed. Code: ${e.code}. Message: ${e.message}');
//     }
//   }
// }