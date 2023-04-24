import 'package:care_bookie/providers/schedule_data_provider.dart';
import 'package:care_bookie/providers/user_login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../res/constants/colors.dart';
import '../../../layouts_page/navbar_layout.dart';
import '../../main_page.dart';
import 'info_order_detail.dart';
import 'price_order.dart';

class OrderSuccess extends StatefulWidget {
  const OrderSuccess({Key? key}) : super(key: key);

  @override
  State<OrderSuccess> createState() => _OrderSuccessState();
}

class _OrderSuccessState extends State<OrderSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            successfulOrderingLogo(),
            infoOrderScheduleSuccess(context),
            medicalExaminationFee(context)
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigatorBar(),
    );
  }

  Widget medicalExaminationFee(BuildContext context) {

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
            child: Text(scheduleDataProvider.hospital!.fee,
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

  Widget infoOrderScheduleSuccess(BuildContext context) {

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
                  child: Text(scheduleDataProvider.hospital!.hospitalName,
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
            children:[
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
            children: const [
              Text("Chia sẻ lịch sử",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      overflow: TextOverflow.visible)),
              SizedBox(
                width: 200,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text("Có",
                      maxLines: 2,
                      style: TextStyle(
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

  Widget successfulOrderingLogo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 100, 0, 10.0),
      child: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/success.png',
              scale: 1.5,
            ),
            const Text(
              "Success!",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  color: ColorConstant.BLue05),
            ),
            const Text(
              "Lịch khám của bạn đã hoàn tất",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ColorConstant.Grey00),
            ),
            const Text(
              "Vui lòng đợi phòng khám xác nhận",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ColorConstant.Grey00),
            )
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
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Container(
                width: double.maxFinite,
                height: 70,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const NavbarLayout(index: 0,)));
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      child: Text(
                        "Trang Chủ",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w600),
                      ),
                    )),
              )),
        ],
      ),
    );
  }
}
