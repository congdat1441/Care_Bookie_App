import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../res/constants/colors.dart';
import '../../widgets/main_page_widget/order_widget/describe_problem.dart';
import '../../widgets/main_page_widget/order_widget/info_order_detail.dart';
import '../../widgets/main_page_widget/order_widget/price_order.dart';

class ScheduleDetailAccept extends StatelessWidget {
  const ScheduleDetailAccept({Key? key}) : super(key: key);

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
              children: const [
                InfoOrderSchedule(),
                InfoDescribeProblem(),
                Price(),
                SizedBox(
                  height: 100,
                )
              ],
            )),
        );
  }

}
