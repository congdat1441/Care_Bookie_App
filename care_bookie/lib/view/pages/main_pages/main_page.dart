import 'package:care_bookie/providers/home_page_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../res/constants/colors.dart';
import '../../../firebases/firebase_auth_function.dart';
import '../login_signup_page/login_page.dart';
import '../search_page/search_button.dart';
import 'clinic/clinic_widget/clinics_nearby.dart';
import 'doctor/doctor_widget/doctors.dart';
import 'main_page_widget/AppbarCustom.dart';
import 'main_page_widget/favorite_infos.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var loadHospitalAndDoctor = Provider.of<HomePageProvider>(context, listen: false);
    if(loadHospitalAndDoctor.listHospital.isEmpty){
      loadHospitalAndDoctor.getAllHospital();
    }
    if(loadHospitalAndDoctor.listDoctor.isEmpty){
      loadHospitalAndDoctor.getAllDoctor();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.BackGroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        //controller: value.scrollController,
        child: Column(
          children: [
            const AppbarCustom(),
            //logout(),
            hiPatient(),
            const SearchButton(),
            const FavoriteInfos(),
            doctorTitle(),
            const SizedBox(height: 200, child: Doctors()),
            clinicsNearbyTitles(),
            const ClinicsNearby(),
          ],
        ),
      ),
    );
  }

  Widget logout() {
    return Column(children: [
      TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        onPressed: () async {
          await AuthServices().signOut();
          // ignore: use_build_context_synchronously
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const LoginForm()));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  IconlyLight.logout,
                  size: 30,
                  color: CupertinoColors.systemGrey3,
                ),
                Text(
                  "Đăng xuất",
                  style: TextStyle(
                      fontSize: 17,
                      letterSpacing: 1.3,
                      fontFamily: 'Poppins',
                      color: Colors.black),
                )
              ],
            ),
          ],
        ),
      ),
      const Divider(
        height: 30,
        color: Color(0xFFF3EFEF),
        thickness: 2.3,
      ),
    ]);
  }

  Widget hiPatient() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 45, 35, 0),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Hi Cong Dat",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 30,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 10),
          Image.asset('assets/images/wavinghand.png',
              width: 30, height: 30, fit: BoxFit.cover),
        ],
      ),
    );
  }

  Widget kindNeedings() {
    return Column(
      children: [
        const Padding(
            padding: EdgeInsets.fromLTRB(35, 20, 0, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'What do you need ?',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black87,
                    fontFamily: 'Poppins'),
              ),
            )),
        Padding(
            padding: const EdgeInsets.fromLTRB(35, 20, 35, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      //end: Alignment.centerRight,
                      end: Alignment(0.9, 0.2),
                      colors: <Color>[
                        Color(0xFF237be5),
                        Color(0xFF1e81e7),
                        Color(0xFF1885ea),
                        Color(0xFF1589ec),
                        Color(0xFF118dee),
                        Color(0xFF0e8eef),
                        Color(0xFF0994f1),
                        Color(0xFF0697f3),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xFF0e8eef).withOpacity(0.5),
                          spreadRadius: 0,
                          blurRadius: 15,
                          offset: const Offset(0, 5))
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/syringe.svg",
                        color: Colors.white,
                        width: 35,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Vaccines",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.white,
                            fontFamily: 'Poppins'),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: const Offset(0, 3))
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/clinics.svg",
                        color: ColorConstant.BLue05,
                        width: 35,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Clinics",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.black87,
                            fontFamily: 'Poppins'),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: const Offset(0, 3))
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/doctor.svg",
                        color: ColorConstant.BLue05,
                        width: 35,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Doctors",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.black87,
                            fontFamily: 'Poppins'),
                      )
                    ],
                  ),
                ),
              ],
            )),
        Padding(
            padding: const EdgeInsets.fromLTRB(35, 20, 35, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: const Offset(0, 3))
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/pharmacy.svg",
                        color: ColorConstant.BLue05,
                        width: 35,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Pharmacy",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.black87,
                            fontFamily: 'Poppins'),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: const Offset(0, 3))
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/drugs.svg",
                        color: ColorConstant.BLue05,
                        width: 35,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Drugs",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.black87,
                            fontFamily: 'Poppins'),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: const Offset(0, 3))
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/ambulance.svg",
                        color: ColorConstant.BLue05,
                        width: 35,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Ambulance",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.black87,
                            fontFamily: 'Poppins'),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }

  Widget doctorTitle() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(35, 40, 0, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0.0),
              child: Image.asset(
                'assets/images/doctor02.png',
                scale: 6,
              ),
            ),
            const Text(
              'DOCTORS',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                  fontSize: 32,
                  //textBaseline: TextBaseline.alphabetic,
                  color: Colors.black87,
                  letterSpacing: 1.5,
                  fontFamily: 'Poppins'),
            ),
          ],
        ));
  }

  Widget clinicsNearbyTitles() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(35, 30, 0, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          //textBaseline: TextBaseline.alphabetic,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0.0),
              child: Image.asset(
                'assets/images/clinic.png',
                scale: 4,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              //color: Colors.grey,
              width: 200,
              height: 80,
              child: RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    text: "CLINICS",
                    style: TextStyle(
                        height: 1,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                        fontSize: 35,
                        //textBaseline: TextBaseline.alphabetic,
                        color: Color(0xff4fa2e7),
                        letterSpacing: 1.5,
                        fontFamily: 'Poppins'),
                  ),
                  WidgetSpan(
                      child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 3.0, horizontal: 25.0),
                    child: Text(
                      "NEARBY",
                      style: TextStyle(
                          height: 1,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                          fontSize: 32,
                          //textBaseline: TextBaseline.alphabetic,
                          color: Colors.green,
                          //letterSpacing: 1.5,
                          fontFamily: 'Poppins'),
                    ),
                  )),
                ]),
                //textScaleFactor: 0.8,
              ),
            )
          ],
        ));
  }
}
