// class User {
//   String uid;
//   String phoneNumber;
//   String name;
//   String email;
//   String photoUrl;
//
//   User({
//     required this.uid,
//     required this.phoneNumber,
//     required this.name,
//     required this.email,
//     required this.photoUrl,
//   });
//
//   factory User.fromFirebaseUser(FirebaseUser firebaseUser) {
//     return User(
//       uid: firebaseUser.uid,
//       phoneNumber: firebaseUser.phoneNumber,
//       name: firebaseUser.displayName,
//       email: firebaseUser.email,
//       photoUrl: firebaseUser.photoUrl,
//     );
//   }
//
//   Map<String, dynamic> toMap() {
//     return {
//       'uid': uid,
//       'phoneNumber': phoneNumber,
//       'name': name,
//       'email': email,
//       'photoUrl': photoUrl,
//     };
//   }
//
//   factory User.fromMap(Map<String, dynamic> map) {
//     return User(
//       uid: map['uid'],
//       phoneNumber: map['phoneNumber'],
//       name: map['name'],
//       email: map['email'],
//       photoUrl: map['photoUrl'],
//     );
//   }
// }
//
