import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

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
    return  Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: SizedBox(
        height: 225,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            const SizedBox(
              width: 35,
            ),
            ...[1, 2, 3, 4, 5, 6, 7].map((e) => Container(
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
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const DetailDoctor()));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'assets/images/doctor03.jpg',
                                  fit: BoxFit.fitWidth,

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
                          child: FloatingActionButton(
                              backgroundColor: Colors.white,
                              child: const Icon(
                                IconlyBold.heart,
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
                          const SizedBox(
                              width: 130,
                              height: 20,
                              //color: Colors.grey,
                              child: Text("Dr. Nguyễn Văn A aaaaaaaaaaa",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14,
                                      //overflow: TextOverflow.ellipsis,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Merriweather Sans'))),
                          Row(
                            children: const [
                              Text("Răng hàm mặt",
                                  style: TextStyle(
                                      fontSize: 14,
                                      //overflow: TextOverflow.ellipsis,
                                      color: ColorConstant.Grey01,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Merriweather Sans')),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
