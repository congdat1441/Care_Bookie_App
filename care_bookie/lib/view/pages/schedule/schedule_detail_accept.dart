import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:care_bookie/providers/doctor_detail_page_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../providers/hospital_detail_page_provider.dart';
import '../../../providers/schedule_detail_page_provider.dart';
import '../../../providers/schedule_page_provider.dart';
import '../../../res/constants/colors.dart';
import '../layouts_page/navbar_layout.dart';


class ScheduleDetailAccept extends StatefulWidget {
  const ScheduleDetailAccept({Key? key}) : super(key: key);

  @override
  State<ScheduleDetailAccept> createState() => _ScheduleDetailAcceptState();
}

class _ScheduleDetailAcceptState extends State<ScheduleDetailAccept> {

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
        backgroundColor: Colors.green,
        title: const Center(
          child: Text(
            "Thông tin đặt lịch",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 22,

            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            IconlyBroken.arrowLeft,
            color: Colors.white,
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
              infoOrderScheduleAccept(context),
              infoDescribeProblemAccept(context),
              medicalExaminationFeeAccept(context),
              deleteOrder(),
              const SizedBox(
                height: 100,
              )
            ],
          )),
    );
  }

  Widget infoOrderScheduleAccept(BuildContext context) {

    var scheduleDetailPageProvider = Provider.of<ScheduleDetailPageProvider>(context,listen: false);

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
                  child: Text(scheduleDetailPageProvider.scheduleDetail!.hospital.hospitalName,
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
                  child: Text(scheduleDetailPageProvider.scheduleDetail!.doctor.fullName,
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
              const Text("Thời gian",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      overflow: TextOverflow.visible)),
              SizedBox(
                width: 140,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(scheduleDetailPageProvider.scheduleDetail!.time,
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
                  child: Text(scheduleDetailPageProvider.scheduleDetail!.user.fullName,
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
                  child: Text(scheduleDetailPageProvider.scheduleDetail!.doctor.fields,
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
                  child: Text(scheduleDetailPageProvider.scheduleDetail!.shareHistory.isNotEmpty ? "Có" : "Không",
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

  Widget infoDescribeProblemAccept(BuildContext context) {

    var scheduleDetailPageProvider = Provider.of<ScheduleDetailPageProvider>(context,listen: false);

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
                  scheduleDetailPageProvider.scheduleDetail!.symptom,
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

  Widget medicalExaminationFeeAccept(BuildContext context) {

    var scheduleDetailPageProvider = Provider.of<ScheduleDetailPageProvider>(context,listen: false);

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
            child: Text(scheduleDetailPageProvider.scheduleDetail!.fee,
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

  void showDialog() {

    var scheduleDetailPageProvider = Provider.of<ScheduleDetailPageProvider>(context,listen: false);

    var schedulePageProvider = Provider.of<SchedulePageProvider>(context,listen: false);

    var hospitalDetailPageProvider = Provider.of<HospitalDetailPageProvider>(context,listen: false);

    var doctorDetailPageProvider = Provider.of<DoctorDetailPageProvider>(context,listen: false);

    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.SCALE,
      title: 'Hủy Lịch Khám Bệnh',
      desc: 'Bạn Có Chắc Chắn Muốn Hủy Lịch Khám Không?',
      btnOkOnPress: () async{



        String scheduleId = scheduleDetailPageProvider.scheduleDetail!.id;

        bool isSuccess = await scheduleDetailPageProvider.deleteScheduleById(scheduleId);

        if(isSuccess) {

          hospitalDetailPageProvider.scheduleWithHospital = null;

          doctorDetailPageProvider.scheduleWithDoctor = null;

          schedulePageProvider.schedules = [];

          Fluttertoast.showToast(
              msg: "Hủy Lịch Thành Công",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0
          );

          // ignore: use_build_context_synchronously
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NavbarLayout(index: 0,)));
        } else {
          Fluttertoast.showToast(
              msg: "Hủy Lịch Không Thành Công",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }


      },
      btnCancelOnPress: () {
        print("CANCEL");
      } ,
    ).show();
  }

  Widget deleteOrder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 10, 15),
          height: 50,
          width: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: Colors.grey)),
          child: TextButton(
            onPressed: () {
              showDialog();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text("Hủy Lịch",
                    style: TextStyle(fontSize: 17, color: Colors.grey, fontWeight: FontWeight.bold)),
                Icon(Icons.delete, color: Colors.grey,)
              ],
            ),
          ),
        ),
      ],
    );
  }

}

