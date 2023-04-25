import 'package:care_bookie/view/pages/login_signup_page/login_signup_widget/email_Id.dart';
import 'package:care_bookie/view/pages/login_signup_page/reset_password.dart';
import 'package:care_bookie/view/pages/login_signup_page/sign_up.dart';
import 'package:flutter/material.dart';
import 'login_signup_widget/account.dart';
import 'login_signup_widget/another_login.dart';
import '../layouts_page/navbar_layout.dart';
import 'login_signup_widget/password.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              customTopCircle(),
              contentLoginAndSignup()
            ],
          ),
        ),
      ),
    );
  }

  Widget customTopCircle(){
    return Expanded(
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
    );
  }

  Widget contentLoginAndSignup(){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 260,
      child: Container(
        //color: Colors.greenAccent,
        width: 380,
        height: 580,
        padding: const EdgeInsets.fromLTRB(20, 50, 0, 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  const Text(
                    "Login",
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Signup()));
                    },
                    child: const Text(
                      "Sign up",
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
            const EmailId(),
            const AddPassword(),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
              child: TextButton(
                child: const Text(
                  "Forgot password",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFF168AD8)),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const ResetPassword()));
                },
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NavbarLayout(index: 0,)));
              },
              child: Container(
                width: 330,
                padding: const EdgeInsets.fromLTRB(0, 20, 30, 0),
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 20)),
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
                            "Log in",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
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
            Container(
              width: 330,
              padding: const EdgeInsets.fromLTRB(0, 30, 30, 20),
              child: const Text(
                textAlign: TextAlign.center,
                "OR",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Golos",
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
            ),
            const AnotherLogin()
          ],
        ),
      ),
    );
  }
}
