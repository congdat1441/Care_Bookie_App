

import 'hospital.dart';

class Doctor {

  final String id;
  final String fullName;
  final String image;
  final String hospitalName;
  final String hospitalId;
  final num star;
  final int experience;
  final String information;
  final List knowledges;
  final String fields;
  late final List<Review> reviews;

  Doctor({
    required this.id,
    required this.fullName,
    required this.image,
    required this.hospitalName,
    required this.hospitalId,
    required this.star,
    required this.experience,
    required this.information,
    required this.knowledges,
    required this.fields,
  });

  void setReviews(List<Review> list) {
    reviews = list;
  }

  factory Doctor.fromJson(Map<String,dynamic> json) {

    return Doctor(
      id: json['id'],
      fullName: json['full_name'],
      image: json['image'],
      hospitalName: json['hospital_name'],
      hospitalId: json['hospital_id'],
      star: json['star'],
      experience: json['experience'],
      information: json['information'],
      knowledges: json['knowledges'],
      fields: json['fields'],
    );

  }

  Map<String,dynamic> toJson() => {
    'id' : id,
    'full_name' : fullName,
    'image' : image,
    'hospital_name' : hospitalName,
    'hospital_id' : hospitalId,
    'star' : star,
    'experience' : experience,
    'information' : information,
    'knowledges' : knowledges,
    'fields' : fields,
  };


}

class ReviewResponseData {

  final String reviewDocId;
  final num starUser;
  final int reviewLength;
  final num starTotal;

  ReviewResponseData({
    required this.reviewDocId,
    required this.starUser,
    required this.reviewLength,
    required this.starTotal
  });

}