import 'package:flutter/material.dart';

import '../../../../../res/constants/colors.dart';
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
            const InfoOrderSchedule(),
            const Price()
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigatorBar(),
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
                          MaterialPageRoute(builder: (context) => const MainPage()));
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
