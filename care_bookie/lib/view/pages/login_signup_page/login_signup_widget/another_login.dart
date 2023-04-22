import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../api_services/firebase_services.dart';
import '../../layouts_page/navbar_layout.dart';

class AnotherLogin extends StatefulWidget {
  const AnotherLogin({Key? key}) : super(key: key);

  @override
  State<AnotherLogin> createState() => _AnotherLoginState();
}

class _AnotherLoginState extends State<AnotherLogin> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0, 0.0),
            child: SvgPicture.asset(
              "assets/images/icons8-facebook.svg",
              width: 35,
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(5, 0.0, 30, 0.0),
            child: Text(
              "Facebook",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: () async {
              await FirebaseServices().signInWithGoogle();
              print('>>done');
              // ignore: use_build_context_synchronously
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NavbarLayout(index: 0,)));
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: SvgPicture.asset(
                    "assets/images/icons8-google.svg",
                    width: 35,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(5, 0.0, 30, 0.0),
                  child: Text(
                    "Google",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
