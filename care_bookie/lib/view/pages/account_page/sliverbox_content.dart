import 'package:care_bookie/firebases/firebase_auth_function.dart';
import 'package:care_bookie/view/pages/account_page/personal_informarion.dart';
import 'package:care_bookie/view/pages/login_signup_page/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../firebases/firebase_auth_services.dart';
import '../login_signup_page/login.dart';

class SliverToBoxAdapterContent extends StatefulWidget {
  const SliverToBoxAdapterContent({Key? key}) : super(key: key);

  @override
  State<SliverToBoxAdapterContent> createState() => _SliverToBoxAdapterContentState();
}

class _SliverToBoxAdapterContentState extends State<SliverToBoxAdapterContent> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[infoPerson(), notification(), setting(), logout()],
      ),
    );
  }

  Widget infoPerson() {
    return Column(children: [
      TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const PersonalInfomation()));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  IconlyLight.profile,
                  size: 30,
                  color: CupertinoColors.systemGrey3,
                ),
                Text(
                  "Thông tin cá nhân",
                  style: TextStyle(
                      fontSize: 17,
                      letterSpacing: 1.3,
                      fontFamily: 'Poppins',
                      color: Colors.black),
                )
              ],
            ),
            const Icon(
              IconlyLight.arrowRight2,
              size: 30,
              color: Colors.black87,
            )
          ],
        ),
      ),
      const Divider(
        height: 30,
        color: Color(0xFFF3EFEF),
        thickness: 2.3,
      ),
    ]);
  }

  Widget notification() {
    return Column(children: [
      TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  IconlyLight.notification,
                  size: 30,
                  color: CupertinoColors.systemGrey3,
                ),
                Text(
                  "Thông Báo",
                  style: TextStyle(
                      fontSize: 17,
                      letterSpacing: 1.3,
                      fontFamily: 'Poppins',
                      color: Colors.black),
                )
              ],
            ),
            const Icon(
              IconlyLight.arrowRight2,
              size: 30,
              color: Colors.black87,
            )
          ],
        ),
      ),
      const Divider(
        height: 30,
        color: Color(0xFFF3EFEF),
        thickness: 2.3,
      ),
    ]);
  }

  Widget setting() {
    return Column(children: [
      TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  IconlyLight.setting,
                  size: 30,
                  color: CupertinoColors.systemGrey3,
                ),
                Text(
                  "Cài đặt",
                  style: TextStyle(
                      fontSize: 17,
                      letterSpacing: 1.3,
                      fontFamily: 'Poppins',
                      color: Colors.black),
                )
              ],
            ),
            const Icon(
              IconlyLight.arrowRight2,
              size: 30,
              color: Colors.black87,
            )
          ],
        ),
      ),
      const Divider(
        height: 30,
        color: Color(0xFFF3EFEF),
        thickness: 2.3,
      ),
    ]);
  }

  Widget logout() {
    return Column(children: [
      TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        onPressed: () async {
          await AuthServices().signOut();
          // ignore: use_build_context_synchronously
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const LoginForm()));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  IconlyLight.logout,
                  size: 30,
                  color: CupertinoColors.systemGrey3,
                ),
                Text(
                  "Đăng xuất",
                  style: TextStyle(
                      fontSize: 17,
                      letterSpacing: 1.3,
                      fontFamily: 'Poppins',
                      color: Colors.black),
                )
              ],
            ),
          ],
        ),
      ),
      const Divider(
        height: 30,
        color: Color(0xFFF3EFEF),
        thickness: 2.3,
      ),
    ]);
  }
}
