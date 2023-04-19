import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WardClinic extends StatefulWidget {
  const WardClinic({Key? key}) : super(key: key);

  @override
  State<WardClinic> createState() => _WardClinicState();
}

class _WardClinicState extends State<WardClinic> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...[1, 2, 3, 4, 5, 6, 7].map(
            (e) => Container(
              margin: const EdgeInsets.fromLTRB(10, 5, 5, 10),
              height: 80,
              width: 300,
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
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/ward.png",
                          scale: 5,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          width: 80,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Khoa tai mũi họng",
                              style: TextStyle(
                                height: 1.1,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                    width: 130,
                    child: Column(
                      children: [
                        ...[1, 2, 3, 4].map(
                          (e) => const Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                              "Dr. Nguyễn Văn A",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
