import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../res/constants/colors.dart';
import '../main_pages/main_page_widget/order_widget/describe_problem.dart';
import '../main_pages/main_page_widget/order_widget/info_order_detail.dart';
import '../main_pages/main_page_widget/order_widget/price_order.dart';

class ScheduleDetailPending extends StatefulWidget {
  const ScheduleDetailPending({Key? key}) : super(key: key);

  @override
  State<ScheduleDetailPending> createState() => _ScheduleDetailPendingState();
}

class _ScheduleDetailPendingState extends State<ScheduleDetailPending> {
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
          backgroundColor: Colors.orangeAccent,
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
                const InfoOrderSchedule(),
                const InfoDescribeProblem(),
                const Price(),
                deleteOrder(),
              ],
            )),
        bottomNavigationBar: bottomNavigatorBar());
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
            onPressed: () {},
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

  Widget bottomNavigatorBar() {
    return Container(
      height: 120,
      color: Colors.white,
      child: Column(
        children: [notification(), pending()],
      ),
    );
  }

  Widget notification() {
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
              child: Text(
                  "Thông tin đặt lịch của bạn đã hoàn tất, vui lòng đợi phòng khám xác nhận phản hồi",
                  style: TextStyle(fontSize: 17, color: Colors.grey)),
            ),
          )
        ],
      ),
    );
  }

  Widget pending() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: Container(
          width: double.maxFinite,
          height: 40,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.orange),
              borderRadius: BorderRadius.circular(20)),
          child: const Center(
            child: Text(
              "Chờ Xác Nhận",
              style: TextStyle(
                  fontSize: 21,
                  color: Colors.orange,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ));
  }
}
