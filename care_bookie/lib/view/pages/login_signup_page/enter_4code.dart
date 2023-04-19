import 'package:flutter/material.dart';

import 'login_signup_widget/otp_input.dart';

class EnterCodeOTP extends StatefulWidget {
  const EnterCodeOTP({Key? key}) : super(key: key);

  @override
  State<EnterCodeOTP> createState() => _EnterCodeOTPState();
}

class _EnterCodeOTPState extends State<EnterCodeOTP> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                        top: -240,
                        right: 10,
                        child: Container(
                          width: 500,
                          height: 500,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xFF0675D6)),
                        )),
                    Positioned(
                        top: -280,
                        right: 70,
                        child: Container(
                          width: 500,
                          height: 500,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xFF0768D6)),
                        )),
                    Positioned(
                        top: -325,
                        right: 135,
                        child: Container(
                          width: 500,
                          height: 500,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xFF005DC8)),
                        )),
                    Positioned(
                        top: -310,
                        right: 200,
                        child: Container(
                          width: 400,
                          height: 400,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xFF0057B9)),
                        )),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 280,
                child: Container(
                  width: 380,
                  height: 600,
                  padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Text(
                          "CODE OTP",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 35,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF2F3948),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(12, 10, 20, 0),
                        child: const Text(
                          "An OTP has been sent to your phone, please enter:",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF2F3948),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 15, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: OtpInput(_fieldOne, true, false),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: OtpInput(_fieldTwo, false, false),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: OtpInput(_fieldThree, false, false),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: OtpInput(_fieldFour, false, true),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 200,
                          padding: const EdgeInsets.fromLTRB(10, 20, 30, 0),
                          child: Column(
                            children: [
                              const Padding(padding: EdgeInsets.only(top: 20)),
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(0xFF000000),
                                        Color(0xFF0E0303),
                                      ]),
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0xFF574E4E),
                                      offset: Offset(0.0, 2),
                                      blurRadius: 5,
                                      spreadRadius:
                                          0.1, // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      "Send Code Again",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Exo'),
                                    ),
                                  ),
                                ),
                              ),
                              // RecentlyViewed()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
