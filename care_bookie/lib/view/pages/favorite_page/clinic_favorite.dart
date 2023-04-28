import 'package:care_bookie/providers/doctor_detail_page_provider.dart';
import 'package:care_bookie/providers/favorite_hospital_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../../../models/hospital.dart';
import '../../../providers/favorite_page_provider.dart';
import '../../../providers/home_page_provider.dart';
import '../../../providers/hospital_detail_page_provider.dart';
import '../../../providers/schedule_page_provider.dart';
import '../../../providers/user_login_provider.dart';
import '../../../res/constants/colors.dart';
import '../main_pages/clinic/detail_clinic.dart';

class ClinicFavorite extends StatefulWidget {
  const ClinicFavorite({Key? key}) : super(key: key);

  @override
  State<ClinicFavorite> createState() => _ClinicFavoriteState();
}

class _ClinicFavoriteState extends State<ClinicFavorite> {
  @override
  Widget build(BuildContext context) {
    return Consumer4<FavoritePageProvider,HospitalDetailPageProvider,SchedulePageProvider,HomePageProvider>(
      builder: (context, favoritePageProvider,hospitalDetailPageProvider,schedulePageProvider,homePageProvider, child) => Column(
        children: [

          favoritePageProvider.favorite!.id.isEmpty ? Container() :
          SizedBox(
            height: 400,
            child: ListView.builder(
              itemCount: favoritePageProvider.favorite!.hospitals.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.fromLTRB(30, 15, 10, 0),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 15),
                      height: 120,
                      //width: 155,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(27),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 0,
                              blurRadius: 7,
                              offset: const Offset(0, 10))
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () async{

                                final doctorDetailPageProvider = Provider.of<DoctorDetailPageProvider>(context,listen: false);


                                Hospital hospital = await doctorDetailPageProvider.getHospitalById(favoritePageProvider.favorite!.hospitals[index].id);

                                hospitalDetailPageProvider.setHospitalDetails(hospital);


                                for (var element in schedulePageProvider.schedules) {
                                  if(element.hospital.id == hospital.id) {
                                    hospitalDetailPageProvider.setScheduleWithHospital(element);
                                  }
                                }

                                hospitalDetailPageProvider.setIsHospitalWithFavorite(true);



                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const DetailClinic()));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network(
                                  favoritePageProvider.favorite!.hospitals[index].image,
                                  fit: BoxFit.fill,
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                        width: 190,
                                        //height: 40,
                                        //color: Colors.grey,
                                        child: Text(favoritePageProvider.favorite!.hospitals[index].hospitalName,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                color: Color(0xff1c335b),
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Merriweather Sans '))),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                          favoritePageProvider.favorite!.hospitals[index].workingHours,
                                          style: const TextStyle(
                                              fontSize: 11,
                                              color: Color(0xff1c335b),
                                              fontFamily: 'Merriweather Sans ')
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding:
                                        const EdgeInsets.symmetric(horizontal: 0),
                                        width: 210,
                                        //color: Colors.black,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          //textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              size: 15,
                                              color: Colors.amber,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                                favoritePageProvider.favorite!.hospitals[index].star.toString(),
                                                style: const TextStyle(
                                                    height: 0.9,
                                                    fontSize: 15,
                                                    color: ColorConstant.Grey01,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Merriweather Sans')),
                                            Container(
                                              margin: const EdgeInsets.only(left: 30),
                                              child: const Text("See Detail",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      letterSpacing: 0.1,
                                                      color: ColorConstant.BLueText,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: 'Merriweather Sans')),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 4,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: GestureDetector(
                          onTap: () async{

                            final favoriteHospitalDataProvider = Provider.of<FavoriteHospitalDataProvider>(context,listen: false);

                            final userLoginProvider = Provider.of<UserLoginProvider>(context,listen: false);

                            bool isSuccess = await favoriteHospitalDataProvider.deleteHospitalFavoriteById(userLoginProvider.userLogin.id, favoritePageProvider.favorite!.hospitals[index].id);

                            if(isSuccess) {

                              favoritePageProvider.favorite!.hospitals.remove(favoritePageProvider.favorite!.hospitals[index]);

                              setState(() {

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
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
