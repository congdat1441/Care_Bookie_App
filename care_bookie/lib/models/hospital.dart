
class Hospital {

  final String id;
  final String hospitalName;
  final String image;
  final String fee;
  final String address;
  final String phone;
  final int star;
  final List services;
  final String workingHours;
  final String information;
  final List certifications;
  final List wards;
  late final List<DoctorHospital> doctors;
  late final List<Review> reviews;

  Hospital({
    required this.id,
    required this.hospitalName,
    required this.image,
    required this.fee,
    required this.address,
    required this.phone,
    required this.star,
    required this.services,
    required this.workingHours,
    required this.information,
    required this.certifications,
    required this.wards
  });


  void setDoctors(List<DoctorHospital> doctors) {
    this.doctors = doctors;
  }

  void setReviews(List<Review> reviews) {
    this.reviews = reviews;
  }

  factory Hospital.fromJson(Map<String,dynamic> json) {

    List wardsJson = json['wards'];

    List<Wards> listWards = wardsJson.map((e) => Wards.fromJson(e)).toList();

    return Hospital(
        id: json['id'],
        hospitalName: json['hospital_name'],
        image: json['image'],
        fee: json['fee'],
        address: json['address'],
        phone: json['phone'],
        star: json['star'],
        services: json['services'],
        workingHours: json['working_hours'],
        information: json['information'],
        certifications: json['certifications'],
        wards: listWards
    );

  }

  Map<String,dynamic> toJson() => {
    'id' : id,
    'hospital_name' : hospitalName,
    'image' : image,
    'fee' : fee,
    'address' : address,
    'phone' : phone,
    'star' : star,
    'services' : services,
    'working_hours' : workingHours,
    'information' : information,
    'certifications' : certifications,
    'wards' : wards
  };

}

class DoctorHospital {

  final String fields;
  final String fullName;
  final String id;
  final String image;

  DoctorHospital({
    required this.id,
    required this.fullName,
    required this.image,
    required this.fields
  });

  factory DoctorHospital.fromJson(Map<String,dynamic> json) {

    return DoctorHospital(
        id: json['id'],
        fullName: json['full_name'],
        image: json['image'],
        fields: json['fields']
    );

  }

  Map<String,dynamic> toJson() {

    return {
      'id' : id,
      'full_name' : fullName,
      'image' : image,
      'fields' : fields
    };

  }

}

class Review {

  final String content;
  final String reviewDay;
  final int star;
  final UserReview user;

  Review({
    required this.content,
    required this.star,
    required this.reviewDay,
    required this.user
  });

  factory Review.fromJson(Map<String,dynamic> json) {

    var userReviewJson = json['user'];

    UserReview userReview = UserReview.fromJson(userReviewJson);

    return Review(
        content: json['content'],
        star: json['star'],
        reviewDay: json['review_day'],
        user: userReview
    );
  }

  Map<String,dynamic> toJson() {

    return {
      'content' : content,
      'review_day' : reviewDay,
      'user' : user.toJson()
    };

  }

}

class UserReview {

  final String id;
  final String fullName;
  final String image;

  UserReview({
    required this.id,
    required this.fullName,
    required this.image
  });

  factory UserReview.fromJson(Map<String,dynamic> json) {

    return UserReview(
        id: json['id'],
        fullName: json['full_name'],
        image: json['image']
    );

  }

  Map<String,dynamic> toJson() => {
    'id' : id,
    'full_name' : fullName,
    'image' : image
  };



}

class Wards {

  final List doctors;
  final String wardsName;

  Wards({
    required this.doctors,
    required this.wardsName
  });

  factory Wards.fromJson(Map<String,dynamic> json) {
    return Wards(doctors: json['doctors'], wardsName: json['wards_name']);
  }

}