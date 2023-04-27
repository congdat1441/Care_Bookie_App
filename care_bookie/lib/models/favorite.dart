class Favorite {

  final String id;
  late final List<HospitalFavorite> hospitals;
  late final List<DoctorFavorite> doctors;

  Favorite({
    required this.id,
  });

  factory Favorite.fromJson(Map<String,dynamic> json) {
    return Favorite(id: json['id']);
  }

  Map<String,dynamic> toJson(){
    return {
      'id': id,
    };
  }

  void setHospitals(List<HospitalFavorite> listData) {
    hospitals = listData;
  }

  void setDoctors(List<DoctorFavorite> listData) {
    doctors = listData;
  }

}

class DoctorFavorite {

  final String id;
  final String fullName;
  final String fields;
  final String image;
  final String hospitalId;

  DoctorFavorite({
    required this.id,
    required this.fullName,
    required this.fields,
    required this.image,
    required this.hospitalId
  });

  factory DoctorFavorite.fromJson(Map<String,dynamic> json) {

    return DoctorFavorite(
        id: json['id'],
        fullName: json['full_name'],
        fields: json['fields'],
        image: json['image'],
        hospitalId : json['hospital_id']
    );

  }

  Map<String,dynamic> toJson(){
    return {
      'id': id,
      'full_name' : fullName,
      'fields' : fields,
      'image' : image,
      'hospital_id' : hospitalId
    };
  }

}

class HospitalFavorite {

  final String id;
  final String image;
  final String hospitalName;
  final String workingHours;
  final num star;

  HospitalFavorite({
    required this.id,
    required this.image,
    required this.hospitalName,
    required this.workingHours,
    required this.star
  });

  factory HospitalFavorite.fromJson(Map<String,dynamic> json) {

    return HospitalFavorite(
        id: json['id'],
        image: json['image'],
        hospitalName: json['hospital_name'],
        workingHours: json['working_hours'],
        star: json['star']
    );

  }


  Map<String,dynamic> toJson(){
    return {
      'id': id,
      'image' : image,
      'hospital_name' : hospitalName,
      'working_hours' : workingHours,
      'star' : star
    };
  }

}