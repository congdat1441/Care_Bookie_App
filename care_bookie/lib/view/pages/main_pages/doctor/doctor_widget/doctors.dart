import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../../../../../models/doctor.dart';
import '../../../../../providers/home_page_provider.dart';
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
    final value = Provider.of<HomePageProvider>(context , listen: false);
    return FutureBuilder<List<Doctor>>(
      future: value.getAllDoctor(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else {
          List<Doctor>? doctors = snapshot.data;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>Container(
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const DetailDoctor()));
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      doctors![index].image,
                                      fit: BoxFit.fitWidth,
                                      //scale: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.fromLTRB(105, 10, 0, 0),
                              height: 28,
                              width: 28,
                              child: FloatingActionButton(
                                  backgroundColor: Colors.white,
                                  child: const Icon(
                                    IconlyBroken.heart,
                                    color: Color(0xffee5353),
                                    size: 20,
                                  ),
                                  onPressed: () {}),
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
                                  child: Text("Dr. ${doctors[index].fullName}",
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          //overflow: TextOverflow.ellipsis,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontFamily:
                                              'Merriweather Sans'))),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(doctors[index].fields,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            //overflow: TextOverflow.ellipsis,
                                            color: ColorConstant.Grey01,
                                            fontWeight: FontWeight.w400,
                                            fontFamily:
                                                'Merriweather Sans')),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
            itemCount: snapshot.data!.length,
          );
        }
      },
    );
  }
}
