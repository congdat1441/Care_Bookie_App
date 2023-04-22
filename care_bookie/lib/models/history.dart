
class History {

  final String id;
  final HospitalHistory hospital;
  final DoctorHistory doctor;
  final String appointment;
  final String userId;
  final UserHistory user;
  final bool shareHistory;
  final String symptom;
  final String note;
  final String diagnosis;
  final TotalCost totalCost;

  History({
    required this.id,
    required this.hospital,
    required this.doctor,
    required this.appointment,
    required this.userId,
    required this.user,
    required this.shareHistory,
    required this.symptom,
    required this.note,
    required this.diagnosis,
    required this.totalCost
  });

  factory History.fromJson(Map<String,dynamic> json) {

    HospitalHistory hospital = HospitalHistory.fromJson(json['hospital']);

    DoctorHistory doctor = DoctorHistory.fromJson(json['doctor']);

    UserHistory user = UserHistory.fromJson(json['user']);

    var totalCostJson = json['total_cost'];

    TotalCost totalCost = TotalCost.fromJson(totalCostJson);

    return History(
        id: json['id'],
        hospital: hospital,
        doctor: doctor,
        appointment: json['appointment'],
        userId: json['userId'],
        user: user,
        shareHistory: json['share_history'],
        symptom: json['symptom'],
        note: json['note'],
        diagnosis: json['diagnosis'],
        totalCost : totalCost
    );

  }

  Map<String,dynamic> toJson() => {

    'id' : id,
    'hospital' : hospital.toJson(),
    'doctor' : doctor.toJson(),
    'appointment' : appointment,
    'userId' : userId,
    'user' : user.toJson(),
    'share_history' : shareHistory,
    'symptom' : symptom,
    'note' : note,
    'diagnosis' : diagnosis,
    'total_cost' : totalCost.toJson()
  };


}

class UserHistory {

  final String id;
  final String email;
  final String image;
  final String phone;

  UserHistory({
    required this.id,
    required this.email,
    required this.image,
    required this.phone
  });

  factory UserHistory.fromJson(Map<String,dynamic> json) {

    return UserHistory(
        id: json['id'],
        email: json['email'],
        image: json['image'],
        phone: json['phone']
    );

  }


  Map<String,dynamic> toJson() => {
    'id' : id,
    'email' : email,
    'image' : image,
    'phone' : phone
  };

}

class HospitalHistory {

  final String id;
  final String address;
  final String hospitalName;
  final String image;
  final String phone;

  HospitalHistory({
    required this.id,
    required this.address,
    required this.hospitalName,
    required this.image,
    required this.phone
  });

  factory HospitalHistory.fromJson(Map<String,dynamic> json) {

    return HospitalHistory(
        id: json['id'],
        address: json['address'],
        hospitalName: json['hospital_name'],
        image: json['image'],
        phone: json['phone']
    );

  }

  Map<String,dynamic> toJson() => {
    'id' : id,
    'address' : address,
    'hospital_name' : hospitalName,
    'image' : image,
    'phone' : phone
  };

}

class DoctorHistory {

  final String id;
  final String fullName;
  final String image;

  DoctorHistory({
    required this.id,
    required this.fullName,
    required this.image
  });

  factory DoctorHistory.fromJson(Map<String,dynamic> json) {

    return DoctorHistory(
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

class TotalCost {

  final String total;
  final List<DetailService> details;

  TotalCost({
    required this.total,
    required this.details
  });

  factory TotalCost.fromJson(Map<String,dynamic> json) {

    List list = json['details'];

    List<DetailService> details = list.map((e) => DetailService.fromJson(e)).toList();

    return TotalCost(
        total: json['total'],
        details: details
    );

  }

  Map<String,dynamic> toJson() {

    var detailsJson = details.map((e) => e.toJson());

    return {'total': total, 'details' : detailsJson};

  }

}

class DetailService {

  final String serviceName;
  final String price;

  DetailService({
    required this.serviceName,
    required this.price
  });


  factory DetailService.fromJson(Map<String,dynamic> json) {

    return DetailService(
        serviceName: json['service_name'],
        price: json['price']
    );

  }

  Map<String,dynamic> toJson() => {
    'service_name' : serviceName,
    'price' : price
  };

}