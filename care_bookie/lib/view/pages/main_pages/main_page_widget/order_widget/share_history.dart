import 'package:flutter/material.dart';

import '../../../../../res/constants/colors.dart';
import '../../../schedule/schedule_detail_finish.dart';

class ShareHistory extends StatefulWidget {
  const ShareHistory({Key? key}) : super(key: key);

  @override
  State<ShareHistory> createState() => _ShareHistoryState();
}

class _ShareHistoryState extends State<ShareHistory> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [listsHistories()],
    );
  }

  Widget listsHistories() {
    return Container(
        margin: const EdgeInsets.only(right: 0, top: 20, bottom: 10),
        height: 110,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                          'https://www.stanleywellnesscentre.com/images/blogs/142/FREE_CLINIC_thumbnail_ok.png',
                          fit: BoxFit.cover,
                          scale: 4),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                      child: Column(
                        children: const [
                          SizedBox(
                              width: 190,
                              child: Text("Supporting the CIS",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff1c335b),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Merriweather Sans '))),
                          SizedBox(
                            height: 3,
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                                width: 190,
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
                            flex: 1,
                            child: SizedBox(
                                width: 190,
                                child: Text("19 Tháng 4 2023 lúc 11:00AM",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: ColorConstant.Grey01,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Merriweather Sans '))),
                          )
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              Checkbox(
                value: _isChecked,
                onChanged: (bool? newValue) {
                  setState(() {
                    _isChecked = newValue!;
                  });
                },
              )
            ],
          ),
        ));
  }

  Widget contentHistory() {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
                'https://www.stanleywellnesscentre.com/images/blogs/142/FREE_CLINIC_thumbnail_ok.png',
                fit: BoxFit.cover,
                scale: 4),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
            child: Column(
              children: const [
                SizedBox(
                    width: 190,
                    child: Text("Supporting the CIS",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff1c335b),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Merriweather Sans '))),
                SizedBox(
                  height: 3,
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                      width: 190,
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
                  flex: 1,
                  child: SizedBox(
                      width: 190,
                      child: Text("19 Tháng 4 2023 lúc 11:00AM",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 13,
                              color: ColorConstant.Grey01,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Merriweather Sans '))),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
