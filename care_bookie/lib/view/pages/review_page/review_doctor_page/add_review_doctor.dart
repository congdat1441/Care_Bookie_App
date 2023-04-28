import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../res/constants/colors.dart';

class AddReviewDoctor extends StatefulWidget {
  const AddReviewDoctor({Key? key}) : super(key: key);

  @override
  State<AddReviewDoctor> createState() => _AddReviewDoctorState();
}

class _AddReviewDoctorState extends State<AddReviewDoctor> {
  final TextEditingController _controllerTextWord = TextEditingController();
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
        title: const Text(
          "Thêm đánh giá bác sỹ ",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 19,
            fontFamily: 'Poppins',
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            IconlyBroken.arrowLeft,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottomOpacity: 0,
        elevation: 0,
      ),
      body: addYourComment(),
      bottomNavigationBar: bottomNavigatorBar(),
    );
  }

  Widget addYourComment() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Center(
              child: Text(
                "Bao nhiêu sao nhỉ?",
                style: TextStyle(
                    fontSize: 18,
                    color: ColorConstant.BLueText,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins'),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...[1, 2, 3, 4, 5].map((e) => const Icon(
                      IconlyBold.star,
                      size: 50,
                      color: Colors.amber,
                    )),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Nhận xét của bạn',
                  style: TextStyle(
                      fontSize: 20,
                      color: ColorConstant.BLueText,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins'),
                ),
              ),
            ),
            Container(
              height: 450,
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              decoration: BoxDecoration(
                color: ColorConstant.Grey00.withOpacity(0.25),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextFormField(
                controller: _controllerTextWord,
                maxLines: 100,
                //inputFormatters: [WhitelistingTextInputFormatter(RegExp("[a-zA-ZÀ-ỹ ]"))],
                //maxLength: 350,
                decoration: InputDecoration(
                    hintText: 'Thêm nhận xét của bạn...',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: ColorConstant.Grey00.withOpacity(0.9))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomNavigatorBar() {
    return Container(
      height: 80,
      color: Colors.white,
      child: Column(
        children: [Submit()],
      ),
    );
  }

  Widget Submit() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Container(
          width: double.maxFinite,
          height: 70,
          decoration: BoxDecoration(
              color: ColorConstant.BackGroundColor,
              borderRadius: BorderRadius.circular(10)),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 5,
                backgroundColor: ColorConstant.BLueText,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: Text(
                  "Gửi nhận xét",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                ),
              )),
        ));
  }
}
