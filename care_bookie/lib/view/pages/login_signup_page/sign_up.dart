import 'package:flutter/material.dart';
import 'package:heath_care/view/widgets/login_signup_widget/password.dart';
import '../../widgets/login_signup_widget/account.dart';
import '../../widgets/login_signup_widget/email_Id.dart';



class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

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
                        top: -280,
                        right: 10,
                        child: Container(
                          width: 500,
                          height: 500,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xFF0675D6)),
                        )),
                    Positioned(
                        top: -320,
                        right: 70,
                        child: Container(
                          width: 500,
                          height: 500,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xFF0768D6)),
                        )),
                    Positioned(
                        top: -360,
                        right: 135,
                        child: Container(
                          width: 500,
                          height: 500,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xFF005DC8)),
                        )),
                    Positioned(
                        top: -330,
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
                height: MediaQuery.of(context).size.height - 230,
                child: Container(
                    //color: Colors.greenAccent,
                    width: 380,
                    height: 660,
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              const Text(
                                "Sign up ",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 45,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF2F3948),
                                ),
                              ),
                              const Text(
                                "/ ",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF2F3948),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Log in",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF168AD8),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        AddAcount(),
                        EmailId(),
                        //Mobileohone(),
                        AddPassword(),
                        GestureDetector(
                          onTap: () {},
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
                                        "SIGN UP",
                                        style: TextStyle(
                                            fontSize: 20,
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
                        // Container(
                        //   width: 330,
                        //   padding: EdgeInsets.fromLTRB(0, 30, 30, 20),
                        //   child: const Text(
                        //     textAlign: TextAlign.center,
                        //     "OR",
                        //     style: TextStyle(
                        //         fontSize: 20,
                        //         fontFamily: "Golos",
                        //         fontWeight: FontWeight.w400,
                        //         color: Colors.grey),
                        //   ),
                        // ),
                        // AnotherLogin()
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
