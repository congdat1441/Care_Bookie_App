import 'package:care_bookie/models/hospital.dart';
import 'package:care_bookie/providers/favorite_page_provider.dart';
import 'package:care_bookie/providers/user_login_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../../../providers/doctor_detail_page_provider.dart';
import '../../../providers/favorite_dotor_data_provider.dart';
import '../../../providers/home_page_provider.dart';
import '../../../providers/hospital_detail_page_provider.dart';
import '../../../providers/schedule_page_provider.dart';
import '../../../res/constants/colors.dart';
import '../main_pages/doctor/detail_doctor.dart';

class DoctorFavorite extends StatefulWidget {
  const DoctorFavorite({Key? key}) : super(key: key);

  @override
  State<DoctorFavorite> createState() => _DoctorFavoriteState();
}

class _DoctorFavoriteState extends State<DoctorFavorite> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<FavoritePageProvider,HospitalDetailPageProvider>(
      builder: (context, favoritePageProvider,hospitalDetailPageProvider, child) => Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: SizedBox(
          height: 225,
          child: favoritePageProvider.favorite!.id.isEmpty ? Container() : Column(
            children: [
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: favoritePageProvider.favorite!.doctors.length,
                    itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: const EdgeInsets.only(right: 15),
                        height: 200,
                        width: 155,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(27),
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
                          children: [
                            Stack(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(top: 7),
                                  height: 135,
                                  width: 140,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 1,
                                          blurRadius: 15,
                                          offset: const Offset(0, 20))
                                    ],
                                  ),
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: InkWell(
                                      onTap: () async{


                                        final doctorDetailProvider = Provider.of<DoctorDetailPageProvider>(context,listen: false);

                                        final homePageProvider = Provider.of<HomePageProvider>(context,listen: false);

                                        final schedulePageProvider = Provider.of<SchedulePageProvider>(context,listen: false);

                                        doctorDetailProvider.setIsDoctorWithHospital(true);
                                        doctorDetailProvider.setIdDoctorWithHospital(favoritePageProvider.favorite!.doctors[index].id);

                                        Hospital hospital = await doctorDetailProvider.getHospitalById(favoritePageProvider.favorite!.doctors[index].hospitalId);

                                        hospitalDetailPageProvider.setHospitalDetails(hospital);

                                        for (var element in schedulePageProvider.schedules) {
                                          if(element.hospital.id == hospital.id) {
                                            hospitalDetailPageProvider.setScheduleWithHospital(element);
                                          }
                                        }

                                        if(hospitalDetailPageProvider.scheduleWithHospital != null) {

                                          doctorDetailProvider.setScheduleWithHospital(hospitalDetailPageProvider.scheduleWithHospital!);

                                          if(hospitalDetailPageProvider.scheduleWithHospital!.doctor.id == favoritePageProvider.favorite!.doctors[index].id) {
                                            doctorDetailProvider.setScheduleWithDoctor(hospitalDetailPageProvider.scheduleWithHospital!);
                                          }

                                        }

                                        doctorDetailProvider.setIsDoctorWithFavorite(true);


                                        // ignore: use_build_context_synchronously
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                const DetailDoctor()));
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          favoritePageProvider.favorite!.doctors[index].image,
                                          fit: BoxFit.fill,
                                          width: 135,
                                          height: 135,
                                          //scale: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(105, 10, 0, 0),
                                  height: 28,
                                  width: 28,
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.white70,
                                        borderRadius: BorderRadius.circular(30)
                                    ),
                                    child: GestureDetector(
                                      onTap: () async{

                                        final favoriteDoctorDataProvider = Provider.of<FavoriteDoctorDataProvider>(context,listen: false);

                                        final userLoginProvider = Provider.of<UserLoginProvider>(context,listen: false);

                                        bool isSuccess = await favoriteDoctorDataProvider.deleteDoctorFavoriteById(userLoginProvider.userLogin.id!, favoritePageProvider.favorite!.doctors[index].id);

                                        if(isSuccess) {
                                          setState(() {
                                            favoritePageProvider.favorite!.doctors.remove(favoritePageProvider.favorite!.doctors[index]);
                                          });
                                        }

                                      },
                                      child: const Icon(
                                        IconlyBold.closeSquare,
                                        color: Color(0xffee5353),
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
                              child: Column(
                                children: [
                                  SizedBox(
                                      width: 130,
                                      height: 20,
                                      //color: Colors.grey,
                                      child: Text("Dr. ${favoritePageProvider.favorite!.doctors[index].fullName}",
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              //overflow: TextOverflow.ellipsis,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Merriweather Sans'))),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(favoritePageProvider.favorite!.doctors[index].fields,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                //overflow: TextOverflow.ellipsis,
                                                color: ColorConstant.Grey01,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Merriweather Sans')),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
