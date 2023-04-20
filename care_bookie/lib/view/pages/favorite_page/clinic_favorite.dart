import 'package:flutter/material.dart';

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
    return Column(
      children: [
        ...[1,2,3,4,5,6,7,8].map((e) => Padding(
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DetailClinic()));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                          'assets/images/cisdemo.png',
                          fit: BoxFit.cover,
                          scale: 4),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                    child: Column(
                      children: [
                        const SizedBox(
                            width: 190,
                            //height: 40,
                            //color: Colors.grey,
                            child: Text("Restore Medical Clinic CISa",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff1c335b),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Merriweather Sans '))),
                        const SizedBox(
                          height: 3,
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: const [
                              Text("Thứ 2 - Thứ 6 ",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      height: 0.9,
                                      fontSize: 15,
                                      color: ColorConstant.Grey01,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Merriweather Sans')),
                              Text("8AM - 17PM",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      height: 0.9,
                                      fontSize: 15,
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
                                const Text("4.5",
                                    style: TextStyle(
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
                  )
                ],
              ),
            ),
          ),
        ))
      ],
    );
  }
}
