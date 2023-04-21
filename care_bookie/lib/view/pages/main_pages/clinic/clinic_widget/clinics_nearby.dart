import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../models/hospital.dart';
import '../../../../../providers/home_page_provider.dart';
import '../../../../../providers/hospital_detail_page_provider.dart';
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
    return Consumer2<HomePageProvider,HospitalDetailPageProvider>(
      builder: (context, homePageProvider,hospitalDetailPageProvider, child) => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 500,
        child: FutureBuilder<List<Hospital>>(
          future: homePageProvider.getAllHospital(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(),);
            } else if (snapshot.hasError) {
              return Center(child:  Text(snapshot.error.toString()),);
            } else {
              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.fromLTRB(30, 15, 10, 0),
                    child: Container(
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
                              onTap: () {

                                hospitalDetailPageProvider.setHospitalDetails(snapshot.data![index]);

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const DetailClinic()));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network(
                                    snapshot.data![index].image,
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
                                        child: Text(snapshot.data![index].hospitalName,
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
                                      child: Row(
                                        children: [
                                          Text(snapshot.data![index].workingHours,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  height: 0.9,
                                                  fontSize: 13,
                                                  color: ColorConstant.Grey01,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Merriweather Sans')),
                                        ],
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
                                              size: 19,
                                              color: Colors.amber,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(snapshot.data![index].star.toString(),
                                                style: const TextStyle(
                                                    height: 0.9,
                                                    fontSize: 15,
                                                    color: ColorConstant.Grey01,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Merriweather Sans')),
                                            RichText(
                                                text: const TextSpan(children: [
                                                  WidgetSpan(
                                                      child: Padding(
                                                        padding: EdgeInsets.only(left: 15),
                                                        child: Text("1.2 km ",
                                                            style: TextStyle(
                                                                letterSpacing: 0.2,
                                                                fontSize: 15,
                                                                color: ColorConstant.Grey01,
                                                                fontWeight: FontWeight.w500,
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
                                                    fontFamily: 'Merriweather Sans')),
                                            const Text("See Detail",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    letterSpacing: 0.1,
                                                    color: ColorConstant.BLueText,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Merriweather Sans'))
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
              );
            }
          },
        ),
      ),
    );
  }
}