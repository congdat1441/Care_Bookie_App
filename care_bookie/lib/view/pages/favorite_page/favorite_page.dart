import 'package:flutter/material.dart';
import '../../../res/constants/colors.dart';
import '../main_pages/main_page_widget/AppbarCustom.dart';
import 'clinic_favorite.dart';
import 'doctor_favorite.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      right: true,
      left: true,
      child: Scaffold(
        backgroundColor: ColorConstant.BackGroundColor,
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: const [
                  AppbarCustom(),
                  DoctorFavorite(),
                  ClinicFavorite()
                ],
              ),
            )),
      ),
    );
  }
}
