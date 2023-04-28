import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../models/user.dart';
import '../../../res/constants/colors.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
   UserData _userData = UserData();

  @override
  void initState(){
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async{
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User? user = _auth.currentUser;
    if(user != null) {
      final DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      setState(() {
        _userData = UserData.fromJson(snapshot.data()!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if(_userData == null ){
      return const Center(child: CircularProgressIndicator(),);
    }
    return Scaffold(
        backgroundColor: ColorConstant.BackGroundColor,
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10),
            ),
          ),
          backgroundColor: ColorConstant.BackGroundColor,
          title: const Center(
            child: Text(
              "Thông tin cá nhân",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 18,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              IconlyBroken.arrowLeft,
              color: Colors.black,
              size: 25,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          //backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical, child: content(context)));
  }

  Widget content(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 30, 8.0),
      child: Column(
        children: [
          nameAndAva(),
          email(),
          numberPhone(),
          gender(),
          dateOfBirth(),
          changePassword(),
          deleteAccount(),

        ],
      ),
    );
  }

  Widget avatarInName() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
        child: Center(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(14),
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(_userData.image ?? " ${FirebaseAuth.instance.currentUser!.displayName}",
                        scale: 2),
                    radius: 70,
                  ),
                ),
              )
,
            ],
          ),
        ));
  }

  Widget nameAndAva() {
    return Column(
      children: [
        avatarInName(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:   [
                const Text(
                  "Tên",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: ColorConstant.Grey01),
                ),
                Text(
                  _userData.fullName ?? "${FirebaseAuth.instance.currentUser!.displayName}",
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  IconlyBold.edit,
                  size: 30,
                  color: ColorConstant.Grey01,
                ))
          ],
        ),
        const Divider(
          height: 30,
          color: Color(0xFFF3EFEF),
          thickness: 1.5,
        ),
      ],
    );
  }

  Widget email() {
     return Column(
       children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children:   [
                 const Text(
                   "Email",
                   style: TextStyle(
                       fontFamily: 'Poppins',
                       fontSize: 15,
                       fontWeight: FontWeight.w500,
                       color: ColorConstant.Grey01),
                 ),
                 Text(
                   _userData.email ?? '${FirebaseAuth.instance.currentUser!.email}',
                   style: const TextStyle(
                       fontFamily: 'Poppins',
                       fontSize: 16,
                       fontWeight: FontWeight.w400,
                       color: Colors.black),
                 ),
               ],
             ),

           ],
         ),
         const Divider(
           height: 30,
           color: Color(0xFFF3EFEF),
           thickness: 1.5,
         ),
       ],
     );
   }

  Widget numberPhone() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const Text(
                  "Số điện thoại",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: ColorConstant.Grey01),
                ),
                Text(
                  _userData.phone ?? "--",
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  IconlyBold.edit,
                  size: 30,
                  color: ColorConstant.Grey01,
                ))
          ],
        ),
        const Divider(
          height: 30,
          color: Color(0xFFF3EFEF),
          thickness: 1.5,
        ),
      ],
    );
  }

  Widget gender() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
               [
                const Text(
                  "Giới tính",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: ColorConstant.Grey01),
                ),
                Text(
                  "${_userData.gender ?? 'Unknown'}",
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  IconlyBold.edit,
                  size: 30,
                  color: ColorConstant.Grey01,
                ))
          ],
        ),
        const Divider(
          height: 30,
          color: Color(0xFFF3EFEF),
          thickness: 1.5,
        ),
      ],
    );
  }

  Widget dateOfBirth() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const Text(
                  "Ngày sinh",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: ColorConstant.Grey01),
                ),
                Text(
                  _userData.phone ?? " abc",
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  IconlyBold.edit,
                  size: 30,
                  color: ColorConstant.Grey01,
                ))
          ],
        ),
        const Divider(
          height: 30,
          color: Color(0xFFF3EFEF),
          thickness: 1.5,
        ),
      ],
    );
  }

  Widget changePassword() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.maxFinite,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: () {},
        child: const Text(
          "Đổi mật khẩu",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
      ),
    );
  }

  Widget deleteAccount() {
    return Container(
      width: double.maxFinite,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: () {},
        child: const Text(
          "Xóa tài khoản",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
      ),
    );
  }

}
