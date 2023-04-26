import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/home_page_provider.dart';
import '../../../../../providers/hospital_detail_page_provider.dart';
import '../../../../../providers/schedule_page_provider.dart';
import '../../../../../res/constants/colors.dart';
import '../detail_clinic.dart';

class ClinicsNearby extends StatefulWidget {
  const ClinicsNearby({Key? key}) : super(key: key);

  @override
  State<ClinicsNearby> createState() => _ClinicsNearbyState();
}

class _ClinicsNearbyState extends State<ClinicsNearby> {
  @override
  Widget build(BuildContext context) {
    return Consumer3<HomePageProvider, HospitalDetailPageProvider,SchedulePageProvider>(
      builder: (context, homePageProvider, hospitalDetailPageProvider,schedulePageProvider, child) {
        if(homePageProvider.listHospital.isEmpty) {
          return Center(child: CircularProgressIndicator(),);
        } else {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 500,
            child:
            homePageProvider.listHospital.isEmpty
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : Column(
                  children: [
                    Expanded(
              child: ListView.builder(
                    itemCount: homePageProvider.listHospital.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(5, 5, 5, 10),
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
                                onTap: () {
                                  hospitalDetailPageProvider.setHospitalDetails(
                                      homePageProvider.listHospital[index]);

                                  for (var element in schedulePageProvider.schedules) {
                                    if(element.hospital.id == homePageProvider.listHospital[index].id) {
                                      hospitalDetailPageProvider.setScheduleWithHospital(element);
                                    }
                                  }


                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const DetailClinic()));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    homePageProvider.listHospital[index].image,
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          width: 190,
                                          //height: 40,
                                          //color: Colors.grey,
                                          child: Text(
                                              homePageProvider.listHospital[index]
                                                  .hospitalName,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Color(0xff1c335b),
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily:
                                                  'Merriweather Sans '))),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          children: [
                                            Text(
                                                homePageProvider
                                                    .listHospital[index]
                                                    .workingHours,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    height: 0.9,
                                                    fontSize: 13,
                                                    color: ColorConstant.Grey01,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily:
                                                    'Merriweather Sans')),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 0),
                                          width: 210,
                                          //color: Colors.black,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            //textBaseline: TextBaseline.alphabetic,
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                size: 19,
                                                color: Colors.amber,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                  homePageProvider
                                                      .listHospital[index].star
                                                      .toString(),
                                                  style: const TextStyle(
                                                      height: 0.9,
                                                      fontSize: 15,
                                                      color: ColorConstant.Grey01,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily:
                                                      'Merriweather Sans')),
                                              RichText(
                                                  text: const TextSpan(children: [
                                                    WidgetSpan(
                                                        child: Padding(
                                                          padding:
                                                          EdgeInsets.only(left: 15),
                                                          child: Text("1.2 km ",
                                                              style: TextStyle(
                                                                  letterSpacing: 0.2,
                                                                  fontSize: 15,
                                                                  color: ColorConstant
                                                                      .Grey01,
                                                                  fontWeight:
                                                                  FontWeight.w500,
                                                                  fontFamily:
                                                                  'Merriweather Sans')),
                                                        )),
                                                  ])),
                                              const Text("| ",
                                                  style: TextStyle(
                                                      height: 0.8,
                                                      fontSize: 18,
                                                      letterSpacing: 0.1,
                                                      color: ColorConstant.Grey01,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily:
                                                      'Merriweather Sans')),
                                              const Text("See Detail",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      letterSpacing: 0.1,
                                                      color:
                                                      ColorConstant.BLueText,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily:
                                                      'Merriweather Sans'))
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
                    ),
              ),
            ),
                  ],
                ),
          );
        }
      });
  }
}
