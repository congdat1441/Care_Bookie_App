class UserData {
  String? id;
  String? fullName;
  String? email;
  String? phone;
  bool? gender;
  String? dob;
  String? image;

  UserData(
      {this.id,
      this.fullName,
      this.email,
      this.phone,
      this.gender,
      this.dob,
      this.image});

  factory UserData.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return UserData(
          id: json['id'],
          fullName: json['full_name'],
          email: json['email'],
          phone: json['phone'],
          gender: json['gender'],
          dob: json['dob'],
          image: json['image']);
    } else {
      throw ArgumentError('Invalid argument for UserData.fromJson(): $json');
    }
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'full_name': fullName,
        'email': email,
        'phone': phone,
        'gender': gender,
        'dob': dob,
        'image': image
      };
}
