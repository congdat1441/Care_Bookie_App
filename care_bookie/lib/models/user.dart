
class User {

  final String id;
  final String fullName;
  final String email;
  final String phone;
  final bool gender;
  final String dob;
  final String image;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.gender,
    required this.dob,
    required this.image
  });

  factory User.fromJson(Map<String,dynamic> json) {
    return User(
        id: json['id'],
        fullName: json['full_name'],
        email: json['email'],
        phone: json['phone'],
        gender: json['gender'],
        dob: json['dob'],
        image: json['image']
    );
  }



  Map<String,dynamic> toJson() => {
    'id' : id,
    'full_name' : fullName,
    'email' : email,
    'phone' : phone,
    'gender' : gender,
    'dob' : dob,
    'image' : image
  };
}