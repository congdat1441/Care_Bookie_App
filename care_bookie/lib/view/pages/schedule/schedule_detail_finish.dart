import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../res/constants/colors.dart';
import '../../widgets/main_page_widget/order_widget/describe_problem.dart';
import '../../widgets/main_page_widget/order_widget/info_order_detail.dart';
import '../../widgets/main_page_widget/order_widget/price_order.dart';
import '../history_page/note_from_doctor.dart';
import '../review_page/review_doctor_page/add_review_doctor.dart';

class ScheduleDetailFinish extends StatefulWidget {
  const ScheduleDetailFinish({Key? key}) : super(key: key);

  @override
  State<ScheduleDetailFinish> createState() => _ScheduleDetailFinishState();
}

class _ScheduleDetailFinishState extends State<ScheduleDetailFinish> {
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
        backgroundColor: Colors.grey,
        title: const Center(
          child: Text(
            "Thông tin đặt lịch",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 22,
              //fontFamily: 'Poppins',
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
            children: const [
              InfoOrderSchedule(),
              InfoDescribeProblem(),
              Price(),
              NoteFromDoctor(),
              SizedBox(
                height: 50,
              )
            ],
          )),
      bottomNavigationBar: bottomNavigatorBar(),
    );
  }

  Widget bottomNavigatorBar() {
    return Container(
      height: 120,
      color: Colors.white,
      child: Column(
        children: [notifyReview(), addReview()],
      ),
    );
  }

  Widget notifyReview() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 20, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: SizedBox(
              height: 50,
              width: 320,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                    "Vui lòng thêm nhận xét của bạn về bác sỹ tại phòng khám",
                    style: TextStyle(fontSize: 17, color: Colors.grey)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget addReview() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddReviewDoctor()));
          },
          child: Container(
            width: double.maxFinite,
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.amber),
                borderRadius: BorderRadius.circular(20)),
            child: const Center(
              child: Text(
                "Thêm nhận xét",
                style: TextStyle(
                    fontSize: 21,
                    color: Colors.amber,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ));
  }
}
