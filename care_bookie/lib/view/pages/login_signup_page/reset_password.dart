import 'package:flutter/material.dart';

import '../../widgets/login_signup_widget/mobilephone.dart';
import 'enter_4code.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

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
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          children: const [
                            Text(
                              "Forgot Password",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 35,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF2F3948),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(12, 10, 20, 0),
                        child: const Text(
                            "Please enter your registered phone number and we will send you a verification code."
                                "We'll send a verification code in a text message. This helps us eliminate spam - we won't give out your number to any third parties"),
                      ),
                      Mobileohone(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const EnterCodeOTP()));
                        },
                        child: Container(
                          width: 330,
                          padding: EdgeInsets.fromLTRB(0, 20, 30, 0),
                          child: Column(
                            children: [
                              Padding(padding: EdgeInsets.only(top: 20)),
                              Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(0xFF391BEA),
                                        Color(0xFF0675D6),
                                      ]),
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0xFF0675D6),
                                      offset: Offset(2.0, 8.0),
                                      blurRadius: 18,
                                      spreadRadius:
                                          0.1, // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      "Next",
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Poppins'),
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
