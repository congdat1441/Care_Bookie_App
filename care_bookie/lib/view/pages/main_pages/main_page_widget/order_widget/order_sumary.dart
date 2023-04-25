

import 'package:care_bookie/providers/hospital_detail_page_provider.dart';
import 'package:care_bookie/providers/schedule_data_provider.dart';
import 'package:care_bookie/providers/user_login_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../../../../res/constants/colors.dart';
import 'order_success.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {


  bool check = false;

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
          backgroundColor: Colors.white,
          title: const Center(
            child: Text(
              "Order Summary",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 22,
                fontFamily: 'Poppins',
              ),
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
          shadowColor: Colors.white,
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                infoOrderSchedule(context),
                infoDescribeProblem(context),
                medicalExaminationFee()
              ],
            )),
        bottomNavigationBar: bottomNavigatorBar());
  }

  Widget infoDescribeProblem(BuildContext context) {

    var scheduleDataProvider = Provider.of<ScheduleDataProvider>(context,listen: false);

    return Column(
      children: [
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text("Mô tả triệu chứng",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      overflow: TextOverflow.visible)),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          width: double.maxFinite,
          decoration: BoxDecoration(
            //color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border:
              Border.all(color: CupertinoColors.systemGrey3, width: 0.5)),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  scheduleDataProvider.symptom!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                    height: 1.4,
                    fontSize: 15,
                  )),
            ),
          ),
        ),
        const Divider(
          height: 30,
          color: Colors.grey,
          thickness: 0.25,
        ),
      ],
    );

  }
  Widget infoOrderSchedule(BuildContext context) {

    var hospitalDetailPageProvider = Provider.of<HospitalDetailPageProvider>(context,listen: false);

    var scheduleDataProvider = Provider.of<ScheduleDataProvider>(context,listen: false);

    var userLoginProvider = Provider.of<UserLoginProvider>(context,listen: false);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Trung tâm khám bệnh",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      overflow: TextOverflow.visible)),
              SizedBox(
                width: 150,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(hospitalDetailPageProvider.hospitalDetails != null ? hospitalDetailPageProvider.hospitalDetails!.hospitalName : scheduleDataProvider.hospital!.hospitalName,
                      maxLines: 2,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          fontSize: 15,
                          overflow: TextOverflow.ellipsis)),
                ),
              ),
            ],
          ),
          const Divider(
            height: 30,
            color: Colors.grey,
            thickness: 0.25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Bác sỹ điều trị",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      overflow: TextOverflow.visible)),
              SizedBox(
                width: 200,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(scheduleDataProvider.scheduleDoctor!.fullName,
                      maxLines: 2,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          fontSize: 15,
                          overflow: TextOverflow.ellipsis)),
                ),
              ),
            ],
          ),
          const Divider(
            height: 30,
            color: Colors.grey,
            thickness: 0.25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Thời gian",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      overflow: TextOverflow.visible)),
              SizedBox(
                width: 140,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('${scheduleDataProvider.scheduleTime} ${scheduleDataProvider.scheduleDay}',
                      maxLines: 2,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          fontSize: 15,
                          overflow: TextOverflow.ellipsis)),
                ),
              ),
            ],
          ),
          const Divider(
            height: 30,
            color: Colors.grey,
            thickness: 0.25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Bệnh nhân điều trị",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      overflow: TextOverflow.visible)),
              SizedBox(
                width: 200,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(userLoginProvider.userLogin.fullName,
                      maxLines: 2,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          fontSize: 15,
                          overflow: TextOverflow.ellipsis)),
                ),
              ),
            ],
          ),
          const Divider(
            height: 30,
            color: Colors.grey,
            thickness: 0.25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Chuyên khoa bác sĩ",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      overflow: TextOverflow.visible)),
              SizedBox(
                width: 200,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(scheduleDataProvider.scheduleDoctor!.fields,
                      maxLines: 2,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          fontSize: 15,
                          overflow: TextOverflow.ellipsis)),
                ),
              ),
            ],
          ),
          const Divider(
            height: 30,
            color: Colors.grey,
            thickness: 0.25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Chia sẻ lịch sử",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      overflow: TextOverflow.visible)),
              SizedBox(
                width: 200,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(scheduleDataProvider.shareHistory.isEmpty ? "Không" : "Có",
                      maxLines: 2,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          fontSize: 15,
                          overflow: TextOverflow.ellipsis)),
                ),
              ),
            ],
          ),
          const Divider(
            height: 30,
            color: Colors.grey,
            thickness: 0.25,
          ),
        ],
      ),
    );

  }

  Widget medicalExaminationFee() {

    var hospitalDetailPageProvider = Provider.of<HospitalDetailPageProvider>(context,listen: false);

    var scheduleDataProvider = Provider.of<ScheduleDataProvider>(context,listen: false);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text("Phí dịch vụ khám",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  overflow: TextOverflow.visible)),
        ),
        SizedBox(
          width: 200,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(hospitalDetailPageProvider.hospitalDetails != null ?  hospitalDetailPageProvider.hospitalDetails!.fee : scheduleDataProvider.hospital!.fee,
                maxLines: 2,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.amber,
                    fontSize: 15,
                    overflow: TextOverflow.ellipsis)),
          ),
        ),
      ],
    );

  }


  Widget bottomNavigatorBar() {
    return Container(
      height: 160,
      color: Colors.white,
      child: Column(
        children: [
          termsAndPolicies(),
          confirmation()
        ],
      ),
    );
  }

  Widget termsAndPolicies(){

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                check = !check;
              });
            },
            child: Icon(
              check ?  IconlyBold.tickSquare : FontAwesomeIcons.square,
              size:  35,
              color: check ? Colors.lightBlueAccent : Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: SizedBox(
              height: 50,
              width: 300,
              child: RichText(
                text: const TextSpan(children: [
                  TextSpan(
                      text: "Tôi đồng ý với các ",
                      style: TextStyle(fontSize: 17, color: Colors.grey)),
                  TextSpan(
                      text: "điều khoản sử dụng",
                      style: TextStyle(
                          fontSize: 17,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  TextSpan(
                      text: " và các ",
                      style: TextStyle(fontSize: 17, color: Colors.grey)),
                  TextSpan(
                      text: "chính sách về quyền riêng tư",
                      style: TextStyle(
                          fontSize: 17,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          color: Colors.black))
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget confirmation(){

    var scheduleDataProvider = Provider.of<ScheduleDataProvider>(context,listen: false);

    return Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: Container(
          width: double.maxFinite,
          height: 70,
          decoration:
          BoxDecoration(
              color: ColorConstant.BackGroundColor,
              borderRadius: BorderRadius.circular(20)),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(

                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () async{

                if(check) {

                    bool isSuccess = await scheduleDataProvider.createSchedule();

                    if(isSuccess) {

                      Fluttertoast.showToast(
                          msg: "Tạo Lịch Thành Công",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );

                      // ignore: use_build_context_synchronously
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OrderSuccess()));
                    } else {

                      Fluttertoast.showToast(
                          msg: "Tạo Lịch Không Thành Công",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );

                    }



                } else {
                  Fluttertoast.showToast(
                      msg: "Vui Lòng Đồng Ý Với Các Điều Khoản Và Chính Sách",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }

              },
              child: const Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: Text(
                  "Xác nhận hoàn tất",
                  style: TextStyle(
                      fontSize: 21, fontWeight: FontWeight.w600),
                ),
              )),
        ));
  }


}
