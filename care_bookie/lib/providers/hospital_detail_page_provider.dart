
import 'package:flutter/cupertino.dart';

import '../models/hospital.dart';

class HospitalDetailPageProvider extends ChangeNotifier {

  Hospital? hospitalDetails;

  void setHospitalDetails(Hospital hospital) {
    hospitalDetails = hospital;
  }

}