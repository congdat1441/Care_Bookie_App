import 'package:care_bookie/providers/history_detail_page_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
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
            "Lịch sử khám bệnh",
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
          child: Consumer<HistoryDetailPageProvider>(
            builder: (context, historyDetailPageProvider, child) => Column(
              children: [
                Padding(
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
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(historyDetailPageProvider.historyDetail!.hospital.hospitalName,
                                    maxLines: 2,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black54,
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis)),
                              ),
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
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(historyDetailPageProvider.historyDetail!.doctor.fullName,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54,
                                      fontSize: 15,
                                      overflow: TextOverflow.ellipsis)),
                              ),
                            )
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
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(historyDetailPageProvider.historyDetail!.appointment,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54,
                                      fontSize: 15,
                                      overflow: TextOverflow.ellipsis)),
                              )
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
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(historyDetailPageProvider.historyDetail!.user.fullName,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54,
                                      fontSize: 15,
                                      overflow: TextOverflow.ellipsis)),
                              )
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
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(historyDetailPageProvider.historyDetail!.doctor.fields,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54,
                                      fontSize: 15,
                                      overflow: TextOverflow.ellipsis)),
                              )
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
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(historyDetailPageProvider.historyDetail!.shareHistory ? "Có" : "Không",
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54,
                                      fontSize: 15,
                                      overflow: TextOverflow.ellipsis)),
                              )
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
                ),
                Column(
                  children: [
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text("Chẩn đoán từ bác sĩ",
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
                              historyDetailPageProvider.historyDetail!.diagnosis,
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
                ),
                Column(
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
                              historyDetailPageProvider.historyDetail!.symptom,
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
                ),
                Column(
                  children: [
                    const Divider(
                      height: 20,
                      color: Colors.transparent,
                      thickness: 0.25,
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text("Dặn dò từ Bác sỹ",
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
                              historyDetailPageProvider.historyDetail!.note,
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
                      color: Colors.transparent,
                      thickness: 0.25,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text("Tổng chi phí",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  overflow: TextOverflow.visible)),
                        ),
                        Container(
                          width: 200,
                          margin: const EdgeInsets.only(right: 10),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(historyDetailPageProvider.historyDetail!.totalCost.total,
                                maxLines: 2,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.amber,
                                    fontSize: 15,
                                    overflow: TextOverflow.ellipsis)),
                          ),
                        ),
                      ],
                    ),
                    ...historyDetailPageProvider.historyDetail!.totalCost.details.map((e) => Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(left: 20,right: 20,top: 10),
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            e.serviceName,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          Text(
                            e.price,
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ))
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          )
      ),
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
