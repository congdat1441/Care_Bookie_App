
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../res/constants/colors.dart';

class PersonalInfomation extends StatefulWidget {
  const PersonalInfomation({Key? key}) : super(key: key);

  @override
  State<PersonalInfomation> createState() => _PersonalInfomationState();
}

class _PersonalInfomationState extends State<PersonalInfomation> {
  @override
  Widget build(BuildContext context) {
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
            scrollDirection: Axis.vertical, child: content()));
  }

  Widget content() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 30, 8.0),
      child: Column(
        children: [
          name(),
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

  Widget avatar() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
        child: Center(
          child: Stack(
            children: [
              Container(
                width: 135,
                height: 135,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 0.1,
                        blurRadius: 2,
                        offset: const Offset(0, 5))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(13),
                child: Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 5))
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.network(FirebaseAuth.instance.currentUser!.photoURL!,
                        width: 60, height: 60, fit: BoxFit.cover),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget name() {
    return Column(
      children: [
        avatar(),
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
                  "${FirebaseAuth.instance.currentUser!.displayName}",
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
                  "${FirebaseAuth.instance.currentUser!.phoneNumber}",
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
                  "Địa chỉ Email",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: ColorConstant.Grey01),
                ),
                Text(
                  "${FirebaseAuth.instance.currentUser!.email}",
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

  Widget gender() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Giới tính",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: ColorConstant.Grey01),
                ),
                Text(
                  "-Chọn-",
                  style: TextStyle(
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
              children: const [
                Text(
                  "Ngày sinh",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: ColorConstant.Grey01),
                ),
                Text(
                  "DD/MM/YYYY",
                  style: TextStyle(
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

  // Widget job() {
  //   return Column(
  //     children: [
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: const [
  //               Text(
  //                 "Nghề nghiệp",
  //                 style: TextStyle(
  //                     fontFamily: 'Poppins',
  //                     fontSize: 15,
  //                     fontWeight: FontWeight.w500,
  //                     color: ColorConstant.Grey01),
  //               ),
  //               Text(
  //                 "-Chọn-",
  //                 style: TextStyle(
  //                     fontFamily: 'Poppins',
  //                     fontSize: 16,
  //                     fontWeight: FontWeight.w400,
  //                     color: Colors.black),
  //               ),
  //             ],
  //           ),
  //           IconButton(
  //               onPressed: () {},
  //               icon: const Icon(
  //                 IconlyBold.edit,
  //                 size: 30,
  //                 color: ColorConstant.Grey01,
  //               ))
  //         ],
  //       ),
  //       const Divider(
  //         height: 30,
  //         color: Color(0xFFF3EFEF),
  //         thickness: 1.5,
  //       ),
  //     ],
  //   );
  // }

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
