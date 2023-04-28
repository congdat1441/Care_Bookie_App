import 'dart:async';
import 'package:care_bookie/view/pages/layouts_page/navbar_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../firebases/firebase_auth_function.dart';
import 'login_page.dart';

class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  late Timer _timer;
  final _formKey = GlobalKey<FormState>();
  bool login = true;
  String email = '';
  String password = '';
  String name = '';
  String dob = '';
  bool gender = false;
  String image = '';
  String phone = '';

  @override
  void initState() {
    super.initState();
    checkVerified();
  }

  void checkVerified() async {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        print("hahaa");
        timer.cancel();
        if(!mounted) return;
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const NavbarLayout(index: 0),));
      } else {
        if(!mounted) return;
        return AuthServices.saveUser(
          email,
          password,
          name,
          dob,
          gender,
          image,
          phone,
          context,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Please verify your email to login ",
            style: TextStyle(fontSize: 20),),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: CircularProgressIndicator(),
            ),
            backToLoginPage()

          ],
        ),
      ),
    );
  }

  Widget loginButton() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              login
                  ? AuthServices.signinUser(email, password, context)
                  : AuthServices.signupUser(email, password, name,
                  dob, gender, image, phone, context);
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                IconlyLight.login,
                size: 30,
                color: Colors.white,
              ),
              SizedBox(width: 10,),
              Text(
                "LOGIN",
                style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 1.3,
                    fontFamily: 'Poppins',
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget backToLoginPage() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20,0,20,0),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          onPressed: () async {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoginForm()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                IconlyLight.arrowLeft,
                size: 30,
                color: Colors.white,
              ),
              SizedBox(width: 10,),
              Text(
                "Back To Login Page",
                style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 1.3,
                    fontFamily: 'Poppins',
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}