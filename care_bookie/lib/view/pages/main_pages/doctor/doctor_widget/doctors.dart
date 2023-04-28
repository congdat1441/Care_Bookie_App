import 'package:care_bookie/providers/favorite_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import '../../../../../providers/doctor_detail_page_provider.dart';
import '../../../../../providers/home_page_provider.dart';
import '../../../../../providers/schedule_page_provider.dart';
import '../../../../../res/constants/colors.dart';
import '../detail_doctor.dart';

class Doctors extends StatefulWidget {
  const Doctors({Key? key}) : super(key: key);

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  @override
  Widget build(BuildContext context) {
    return Consumer3<HomePageProvider,DoctorDetailPageProvider,SchedulePageProvider>(
      builder: (context, homePageProvider,doctorDetailProvider,schedulePageProvider, child) => ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: homePageProvider.listDoctor.length,
        itemBuilder: (context, index) => Container(
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
                        onTap: () {

                          doctorDetailProvider.setIsDoctorWithHospital(false);
                          doctorDetailProvider.setDoctorDetail(homePageProvider.listDoctor[index]);

                          for (var element in schedulePageProvider.schedules) {
                            if(element.doctor.id == homePageProvider.listDoctor[index].id) {
                              doctorDetailProvider.setScheduleWithDoctor(element);
                            }
                            if(element.hospital.id == homePageProvider.listDoctor[index].hospitalId){
                              doctorDetailProvider.setScheduleWithHospital(element);
                            }
                          }

                          var favoritePageProvider = Provider.of<FavoritePageProvider>(context,listen: false);


                          if(favoritePageProvider.favorite!.doctors.isNotEmpty)  {
                            for(var element in favoritePageProvider.favorite!.doctors) {
                              if(element.id == homePageProvider.listDoctor[index].id) {
                                doctorDetailProvider.setIsFavorite(true);
                                doctorDetailProvider.setDoctorFavorite(element);
                              }
                            }
                          }

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DetailDoctor()));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            homePageProvider.listDoctor[index].image,
                            fit: BoxFit.fill,
                            width: 100,
                            height: 100,
                            //scale: 30,
                          ),
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
                        child: Text(
                            "Dr. ${homePageProvider.listDoctor[index].fullName}",
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
                          child: Text(homePageProvider.listDoctor[index].fields,
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
      ),
    );
  }
}
