import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heath_care/view/pages/schedule/schedules_clinic.dart';
import 'package:heath_care/view/widgets/main_page_widget/AppbarCustom.dart';
import '../../../../res/constants/colors.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      right: true,
      left: true,
      child: Scaffold(
        backgroundColor: ColorConstant.BackGroundColor,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const AppbarCustom(),
                scheduleTitle(),
                const ScheduleClinics(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget scheduleTitle() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(35, 20, 0, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          //textBaseline: TextBaseline.alphabetic,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              //color: Colors.grey,
              width: 200,
              height: 80,
              child: RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    text: "Your",
                    style: TextStyle(
                        height: 1,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                        fontSize: 35,
                        //textBaseline: TextBaseline.alphabetic,
                        color: Color(0xff4fa2e7),
                        letterSpacing: 1.5,
                        fontFamily: 'Poppins'),
                  ),
                  WidgetSpan(
                      child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
                    child: Text(
                      "Schedule",
                      style: TextStyle(
                          height: 0.8,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                          fontSize: 32,
                          //textBaseline: TextBaseline.alphabetic,
                          color: Colors.green,
                          //letterSpacing: 1.5,
                          fontFamily: 'Poppins'),
                    ),
                  )),
                ]),
                //textScaleFactor: 0.8,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0.0),
              child: SvgPicture.asset(
                'assets/images/schedule.svg',
                width: 80,
                height: 80,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ));
  }
}
