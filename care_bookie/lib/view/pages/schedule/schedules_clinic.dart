import 'package:care_bookie/models/schedule.dart';
import 'package:care_bookie/providers/schedule_page_provider.dart';
import 'package:care_bookie/view/pages/schedule/schedule_detail_accept.dart';
import 'package:care_bookie/view/pages/schedule/schedule_detail_finish.dart';
import 'package:care_bookie/view/pages/schedule/schedule_detail_pending.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/schedule_detail_page_provider.dart';
import '../../../res/constants/colors.dart';

class ScheduleClinics extends StatefulWidget {
  const ScheduleClinics({Key? key}) : super(key: key);

  @override
  State<ScheduleClinics> createState() => _ScheduleClinicsState();
}

class _ScheduleClinicsState extends State<ScheduleClinics> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<SchedulePageProvider,ScheduleDetailPageProvider>(
      builder: (context, schedulePageProvider,scheduleDetailPageProvider, child) => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: schedulePageProvider.schedules.isEmpty ? const Center(
          child: CircularProgressIndicator(),
        ) :
        Expanded(
          child: ListView.builder(
            itemCount: schedulePageProvider.schedules.length,
            itemBuilder: (context, index) {
              if(schedulePageProvider.schedules[index].accept) {
                return Container(
                    margin: const EdgeInsets.only(right: 5,bottom: 10),
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

                        scheduleDetailPageProvider.setScheduleDetail(schedulePageProvider.schedules[index]);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ScheduleDetailAccept()));
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
                                    schedulePageProvider.schedules[index].hospital.image,
                                    width: 130,
                                    height: 130,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(schedulePageProvider.schedules[index].hospital.hospitalName,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                color: Color(0xff1c335b),
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Merriweather Sans ')),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(top: 20),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                  "Thời gian",
                                                  style: TextStyle(
                                                      height: 1,
                                                      fontSize: 13,
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w600,
                                                      fontFamily: 'Merriweather Sans')
                                              ),
                                              Expanded(
                                                child: Container(
                                                  margin: const EdgeInsets.only(left: 10),
                                                  child: Text(schedulePageProvider.schedules[index].time,
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          height: 1,
                                                          fontSize: 13,
                                                          color: ColorConstant.Grey01,
                                                          fontWeight: FontWeight.w400,
                                                          fontFamily: 'Merriweather Sans')),
                                                ),
                                              )
                                            ],
                                          ),
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
                                                Text("${schedulePageProvider.schedules[index].hospital.star}",
                                                    style: const TextStyle(
                                                        fontSize: 19,
                                                        color: ColorConstant.Grey01,
                                                        fontWeight: FontWeight.w500,
                                                        fontFamily: 'Merriweather Sans')),
                                                Container(
                                                  margin: const EdgeInsets.only(left: 50),
                                                  child: const Text("See Details",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          letterSpacing: 0.1,
                                                          color: ColorConstant.BLueText,
                                                          fontWeight: FontWeight.w500,
                                                          fontFamily: 'Merriweather Sans')),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          tagStatusAccept()
                        ],
                      ),
                    ));
              }

              return Container(
                  margin: const EdgeInsets.only(right: 5,bottom: 10),
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

                      scheduleDetailPageProvider.setScheduleDetail(schedulePageProvider.schedules[index]);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ScheduleDetailPending()));
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
                                    schedulePageProvider.schedules[index].hospital.image,
                                    width: 130,
                                    height: 130,
                                    fit: BoxFit.fill,
                                  ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(schedulePageProvider.schedules[index].hospital.hospitalName,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Color(0xff1c335b),
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Merriweather Sans ')),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Thời gian",
                                              style: TextStyle(
                                                  height: 1,
                                                  fontSize: 13,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Merriweather Sans')
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin: const EdgeInsets.only(left: 10),
                                                child: Text(schedulePageProvider.schedules[index].time,
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        height: 1,
                                                        fontSize: 13,
                                                        color: ColorConstant.Grey01,
                                                        fontWeight: FontWeight.w400,
                                                        fontFamily: 'Merriweather Sans')),
                                              ),
                                            )
                                          ],
                                        ),
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
                                              Text("${schedulePageProvider.schedules[index].hospital.star}",
                                                  style: const TextStyle(
                                                      fontSize: 19,
                                                      color: ColorConstant.Grey01,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: 'Merriweather Sans')),
                                              Container(
                                                margin: const EdgeInsets.only(left: 50),
                                                child: const Text("See Details",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        letterSpacing: 0.1,
                                                        color: ColorConstant.BLueText,
                                                        fontWeight: FontWeight.w500,
                                                        fontFamily: 'Merriweather Sans')),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        tagStatusPending(),
                      ],
                    ),
                  ));
            },
          ),
        ),
      ),
    );
  }

  Widget containerSchedulePending(Schedule schedule) {
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
                    builder: (context) => const ScheduleDetailPending()));
          },
          child: Stack(
            children: [
              contentSchedule(),
              tagStatusPending(),
            ],
          ),
        ));
  }

  Widget containerScheduleAccept() {
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
                    builder: (context) => const ScheduleDetailAccept()));
          },
          child: Stack(
            children: [contentSchedule(), tagStatusAccept()],
          ),
        ));
  }

  Widget containerScheduleFinish() {
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
                    builder: (context) => const ScheduleDetailFinish()));
          },
          child: Stack(
            children: [
              contentSchedule(),
              tagStatusFinish(),
            ],
          ),
        ));
  }

  Widget tagStatusPending() {
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
            "Pending",
            style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
          ),
        ));
  }

  Widget tagStatusAccept() {
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
            "Accept",
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
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

  Widget contentSchedule() {
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
