import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../res/constants/colors.dart';
import '../main_pages/main_page_widget/order_widget/describe_problem.dart';
import '../history_page/note_from_doctor.dart';
import '../main_pages/main_page_widget/order_widget/info_order_detail.dart';
import '../main_pages/main_page_widget/order_widget/price_order.dart';
import '../review_page/review_doctor_page/add_review_doctor.dart';

class HistoryDetail extends StatefulWidget {
  const HistoryDetail({Key? key}) : super(key: key);

  @override
  State<HistoryDetail> createState() => _HistoryDetailState();
}

class _HistoryDetailState extends State<HistoryDetail> {
  bool _isExpanded = false;
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
            children:  const [
              InfoOrderSchedule(),
              InfoDescribeProblem(),

              NoteFromDoctor(),
              Price(),
              //certification(),
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

  Widget certification() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 10))
            ],
          ),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(horizontal: 20.0),
            title: const Text(
              'Chứng nhận/ Bằng cấp',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
              ),
            ),
            trailing: const Icon(Icons.keyboard_arrow_down),
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [

                  ],
                ),
              )
            ],
          ),
        ),
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
