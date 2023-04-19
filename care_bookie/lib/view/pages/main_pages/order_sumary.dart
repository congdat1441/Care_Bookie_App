import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:heath_care/res/constants/colors.dart';
import 'package:heath_care/view/pages/main_pages/order_success.dart';
import 'package:heath_care/view/widgets/main_page_widget/order_widget/info_order_detail.dart';
import 'package:heath_care/view/widgets/main_page_widget/order_widget/price_order.dart';

import '../../widgets/main_page_widget/order_widget/describe_problem.dart';

class OrderSumary extends StatefulWidget {
  const OrderSumary({Key? key}) : super(key: key);

  @override
  State<OrderSumary> createState() => _OrderSumaryState();
}

class _OrderSumaryState extends State<OrderSumary> {
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
              children: const [
                InfoOrderSchedule(),
                InfoDescribeProblem(),
                Price()
              ],
            )),
        bottomNavigationBar: bottomNavigatorBar());
  }




  Widget bottomNavigatorBar() {
    return Container(
      height: 160,
      color: Colors.white,
      child: Column(
        children: [
          dieuKhoanVaChinhSach(),
          xacNhanHoanTat()
        ],
      ),
    );
  }

  Widget dieuKhoanVaChinhSach(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(
            IconlyBroken.tickSquare,
            size: 35,
            color: Colors.grey,
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

  Widget xacNhanHoanTat(){
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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OrderSuccess()));
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
