import 'package:care_bookie/firebases/firebase_history_data.dart';
import 'package:care_bookie/models/history.dart';
import 'package:care_bookie/providers/history_page_provider.dart';
import 'package:care_bookie/providers/user_login_provider.dart';
import 'package:care_bookie/view/pages/history_page/history_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/history_detail_page_provider.dart';
import '../../../res/constants/colors.dart';
import '../schedule/schedule_detail_finish.dart';
class HistoryListsClinics extends StatefulWidget {
  const HistoryListsClinics({Key? key}) : super(key: key);

  @override
  State<HistoryListsClinics> createState() => _HistoryListsClinicsState();
}

class _HistoryListsClinicsState extends State<HistoryListsClinics> {
  
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryPageProvider>(
      builder: (context, historyPageProvider, child) => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: historyPageProvider.histories.isEmpty? const Center(
          child: CircularProgressIndicator(),
        ) :  Expanded(
          child: ListView.builder(
            itemCount: historyPageProvider.histories.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 0, 10),
              child: Container(
                  margin: const EdgeInsets.only(right: 5),
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 7,
                          offset: const Offset(0, 10))
                    ],
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    onPressed: () {

                      var historyDetailPageProvider = Provider.of<HistoryDetailPageProvider>(context,listen: false);

                      historyDetailPageProvider.setHistoryDetail(historyPageProvider.histories[index]);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HistoryDetail()));
                    },
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network(
                                  historyPageProvider.histories[index].hospital.image,
                                  width: 130,
                                  height: 130,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                        width: 190,
                                        //height: 40,
                                        //color: Colors.grey,
                                        child: Text(historyPageProvider.histories[index].hospital.hospitalName,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 15
                                                ,
                                                color: Color(0xff1c335b),
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Merriweather Sans '))),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                          width: 190,
                                          //height: 40,
                                          //color: Colors.grey,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Tên bệnh",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black26,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(historyPageProvider.histories[index].diagnosis,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      height: 1,
                                                      fontSize: 15,
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w600,
                                                      fontFamily: 'Merriweather Sans')),
                                            ],
                                          )),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 0),
                                        width: 210,
                                        //color: Colors.black,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          //textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            RichText(
                                                text: TextSpan(children: [
                                                  WidgetSpan(
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 15),
                                                        child: Text(historyPageProvider.histories[index].appointment,
                                                            style: const TextStyle(
                                                                letterSpacing: 0.2,
                                                                fontSize: 15,
                                                                color: ColorConstant.Grey01,
                                                                fontWeight: FontWeight.w500,
                                                                fontFamily: 'Merriweather Sans')),
                                                      )),
                                                ])),
                                            // const Text("See Details",
                                            //     style: TextStyle(
                                            //         fontSize: 13,
                                            //         letterSpacing: 0.1,
                                            //         color: ColorConstant.BLueText,
                                            //         fontWeight: FontWeight.w500,
                                            //         fontFamily: 'Merriweather Sans'))
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }

  Widget listsHistories() {
    return Container(
        margin: const EdgeInsets.only(right: 5),
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(27),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 7,
                offset: const Offset(0, 10))
          ],
        ),
        child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HistoryDetail()));
          },
          child: Stack(
            children: [
              contentHistory(),
              tagStatusFinish(),
            ],
          ),
        ));
  }

  Widget tagStatusFinish() {
    return Positioned(
        top: 110,
        left: 285,
        right: 15,
        bottom: 0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Text(
            "Finish",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ));
  }

  Widget contentHistory() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
                'https://www.stanleywellnesscentre.com/images/blogs/142/FREE_CLINIC_thumbnail_ok.png',
                fit: BoxFit.cover,
                scale: 2),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
            child: Column(
              children: [
                const SizedBox(
                    width: 190,
                    //height: 40,
                    //color: Colors.grey,
                    child: Text("Supporting the CIS",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff1c335b),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Merriweather Sans '))),
                const SizedBox(
                  height: 3,
                ),
                const Expanded(
                  flex: 1,
                  child: SizedBox(
                      width: 190,
                      //height: 40,
                      //color: Colors.grey,
                      child: Text("Restore Medical Clinic CIS",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              height: 1,
                              fontSize: 15,
                              color: ColorConstant.Grey01,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Merriweather Sans'))),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    width: 210,
                    //color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      //textBaseline: TextBaseline.alphabetic,
                      children: [
                        const Icon(
                          Icons.star,
                          size: 19,
                          color: Colors.amber,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text("4.5",
                            style: TextStyle(
                                height: 0.9,
                                fontSize: 15,
                                color: ColorConstant.Grey01,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Merriweather Sans')),
                        RichText(
                            text: const TextSpan(children: [
                              WidgetSpan(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Text("10.00 AM ",
                                        style: TextStyle(
                                            letterSpacing: 0.2,
                                            fontSize: 15,
                                            color: ColorConstant.Grey01,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Merriweather Sans')),
                                  )),
                            ])),
                        const Text("| ",
                            style: TextStyle(
                                height: 0.8,
                                fontSize: 18,
                                letterSpacing: 0.1,
                                color: ColorConstant.Grey01,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Merriweather Sans')),
                        const Text("See Details",
                            style: TextStyle(
                                fontSize: 13,
                                letterSpacing: 0.1,
                                color: ColorConstant.BLueText,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Merriweather Sans'))
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
