import 'package:care_bookie/models/hospital.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../../../models/history_checkbox.dart';
import '../../../../providers/doctor_detail_page_provider.dart';
import '../../../../providers/history_page_provider.dart';
import '../../../../providers/schedule_data_provider.dart';
import '../../../../providers/user_login_provider.dart';
import '../../../../res/constants/colors.dart';
import '../../review_page/review_doctor_page/review_doctor.dart';
import '../main_page_widget/order_widget/order_sumary.dart';
import '../main_page_widget/order_widget/select_day_order.dart';

class OrderDetailDoctor extends StatefulWidget {
  const OrderDetailDoctor({Key? key}) : super(key: key);

  @override
  State<OrderDetailDoctor> createState() => _OrderDetailDoctorState();
}

class _OrderDetailDoctorState extends State<OrderDetailDoctor> {
  bool _isAppBarCollapsed = false;
  int _selectedIndex = -1;
  bool _isExpanded = false;
  int _selectedTime = -1;
  late ScrollController _scrollController;
  final TextEditingController _controllerTextWord = TextEditingController();
  final List<String> _timeList = [
    "08:00 AM",
    "09:00 AM",
    "10:00 AM",
    "11:00 AM",
    "1:30 PM",
    "2:00 PM",
    "3:00 PM",
    "4:00 PM",
    "5:00 PM"
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > 100 &&
          !_scrollController.position.outOfRange) {
        setState(() {
          _isAppBarCollapsed = true;
        });
      } else {
        setState(() {
          _isAppBarCollapsed = false;
        });
      }
    });
    var loadHistory = Provider.of<HistoryPageProvider>(context, listen: false);


    if(loadHistory.histories.isNotEmpty){
      listHistoryCheckBox = loadHistory.histories.map((e) => HistoryCheckBox(historyCheck: e)).toList();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<HistoryCheckBox> listHistoryCheckBox = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.BackGroundColor,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          sliverAppbar(),
          infoBasicDoctor(),
          selectDay(),
          selectTime(),
          describeProblem(),
          shareHistory()
        ],
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget sliverAppbar() {
    final doctorDetailProvider =
        Provider.of<DoctorDetailPageProvider>(context, listen: false);

    var scheduleDataProvider = Provider.of<ScheduleDataProvider>(context,listen: false);

    return SliverAppBar(
      title: Text(
        'Dr. ${doctorDetailProvider.doctorDetail!.fullName}',
        style: TextStyle(
            color: _isAppBarCollapsed ? Colors.black : Colors.white,
            overflow: TextOverflow.ellipsis,
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500),
      ),
      shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0))),
      backgroundColor: _isAppBarCollapsed ? Colors.white : Colors.transparent,
      leading: IconButton(
        icon: _isAppBarCollapsed
            ? const Icon(
                IconlyLight.arrowLeft,
                color: Colors.black,
                size: 30,
              )
            : const Icon(IconlyLight.arrowLeft, size: 30, color: Colors.white),
        onPressed: () {

          scheduleDataProvider.resetData();

          Navigator.pop(context);
        },
      ),

      expandedHeight: 280,
      //collapsedHeight: 70,
      //floating: true,

      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0)),
              child: Image.network(
                doctorDetailProvider.doctorDetail!.image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
                child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.center,
                      colors: [Colors.black87, Colors.transparent])),
            ))
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  //bottomRight: Radius.circular(10),
                  // bottomLeft: Radius.circular(10)
                )),
            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            //padding: const EdgeInsets.only(),
            width: double.maxFinite,
            height: 90,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 210,
                    child: Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      "Dr. ${doctorDetailProvider.doctorDetail!.fullName}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 21,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget infoBasicDoctor() {
    final doctorDetailProvider =
        Provider.of<DoctorDetailPageProvider>(context, listen: false);

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 7,
                  offset: const Offset(0, 10))
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Chuyên khoa :",
                          style: TextStyle(
                              height: 0.9,
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Merriweather Sans')),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                        child: Text(doctorDetailProvider.doctorDetail!.fields,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                height: 0.9,
                                fontSize: 16,
                                color: ColorConstant.Grey01,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Merriweather Sans')),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Bệnh viện :",
                          style: TextStyle(
                              height: 0.9,
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Merriweather Sans')),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                          child: Text(doctorDetailProvider.doctorDetail!.hospitalName,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  height: 0.9,
                                  fontSize: 16,
                                  color: ColorConstant.Grey01,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Merriweather Sans')),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(5, 0, 0, 0.0),
                        child: Icon(
                          FontAwesomeIcons.stethoscope,
                          size: 20,
                          color: Colors.amber,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(30, 5, 5, 5),
                        child: Text(
                            "${doctorDetailProvider.doctorDetail!.experience} năm kinh nghiệm",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                height: 0.9,
                                fontSize: 16,
                                color: ColorConstant.Grey01,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Merriweather Sans')),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ...[1].map((e) => Container(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: const Icon(
                                  IconlyBold.star,
                                  size: 25,
                                  color: Colors.amber,
                                ),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Text("${doctorDetailProvider.doctorDetail!.star}",
                              style: const TextStyle(
                                  height: 1.5,
                                  fontSize: 20,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Merriweather Sans')),
                        ],
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ReviewDoctor()));
                          },
                          child: const Text("Xem đánh giá",
                              style: TextStyle(
                                  height: 1.5,
                                  fontSize: 16,
                                  color: Colors.amber,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Merriweather Sans')))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget selectDay() {
    return SliverToBoxAdapter(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Container(
        width: double.maxFinite,
        height: 220,
        decoration: const BoxDecoration(
            // color: Colors.amber
            ),
        child: const SelectDay(),
      ),
    ));
  }

  Widget selectTime() {

    var scheduleDataProvider = Provider.of<ScheduleDataProvider>(context,listen: false);


    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      sliver: SliverToBoxAdapter(
        child: SizedBox(
          height: 380,
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 20, 0),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Thời gian ',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                      ),
                    ),
                  )),
              GridView.count(
                //padding: const EdgeInsets.symmetric(horizontal: 8.0),
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: (1 / .4),
                children: List.generate(
                  _timeList.length,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedTime = index;
                          scheduleDataProvider.setScheduleTime(_timeList[index]);
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 5.0),
                        decoration: BoxDecoration(
                          color: _selectedTime == index
                              ? ColorConstant.BLue02
                              : const Color(0xFFf6f6f6),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Center(
                          child: Text(
                            _timeList[index],
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              color: _selectedTime == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget describeProblem() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 10, 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: ExpansionTile(
            title: const Text(
              'Triệu chứng của bạn',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
              ),
            ),
            onExpansionChanged: (isExpanded) {
              setState(() {
                _isExpanded = isExpanded;
              });
            },
            initiallyExpanded: _isExpanded,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, right: 0),
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    border: Border.all(width: 0.5, color: Colors.grey)),
                child: TextFormField(
                  controller: _controllerTextWord,
                  maxLines: 10,
                  maxLength: 350,
                  decoration: const InputDecoration(
                    hintText: 'Triệu chứng của bạn',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget shareHistory() {

    var scheduleDataProvider = Provider.of<ScheduleDataProvider>(context,listen: false);

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 10, 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: ExpansionTile(
            title: const Text(
              'Chia sẻ lịch sử khám chữa bệnh',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
              ),
            ),
            onExpansionChanged: (isExpanded) {
              setState(() {
                _isExpanded = isExpanded;
              });
            },
            initiallyExpanded: _isExpanded,
            children: [

              listHistoryCheckBox.isNotEmpty ? Column(
                children: [
                  ...listHistoryCheckBox.map((e) => Container(
                      margin: const EdgeInsets.only(left: 10, right: 0),
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(width: 0.5, color: Colors.transparent)),
                      child: Container(
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
                                          e.historyCheck.hospital.image,
                                          fit: BoxFit.fill,
                                          width: 100,
                                          height: 100,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                                width: 190,
                                                child: Text(e.historyCheck.hospital.hospitalName,
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        color: Color(0xff1c335b),
                                                        fontWeight: FontWeight.w600,
                                                        fontFamily: 'Merriweather Sans '))),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: SizedBox(
                                                  width: 190,
                                                  child: Text(e.historyCheck.diagnosis,
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          height: 1,
                                                          fontSize: 15,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.w600,
                                                          fontFamily: 'Merriweather Sans'))),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: SizedBox(
                                                  width: 190,
                                                  child: Text(e.historyCheck.appointment,
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.black,
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
                                  value: e.checked,
                                  onChanged: (newValue) {
                                    setState(() {
                                      e.checked = newValue!;

                                      scheduleDataProvider.shareHistory = [];

                                      for(int i = 0; i < listHistoryCheckBox.length ; i++) {
                                        if(listHistoryCheckBox[i].checked) {
                                          scheduleDataProvider.shareHistory.add(listHistoryCheckBox[i].historyCheck);
                                        }
                                      }

                                    });
                                  },
                                )
                              ],
                            ),
                          ))
                  ))
                ],
              ) : const Text("Không có lịch sử")
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomNavigationBar() {
    return Container(
      height: 80,
      color: Colors.transparent,
      child: Column(
        children: [continuous()],
      ),
    );
  }

  Widget continuous() {

    var scheduleDataProvider = Provider.of<ScheduleDataProvider>(context,listen: false);

    var userLoginProvider = Provider.of<UserLoginProvider>(context,listen: false);

    var doctorDetailPageProvider = Provider.of<DoctorDetailPageProvider>(context,listen: false);

    return Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: Container(
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () {
                bool success = true;

                DoctorHospital doctor = DoctorHospital(
                    id: doctorDetailPageProvider.doctorDetail!.id,
                    fullName: doctorDetailPageProvider.doctorDetail!.fullName,
                    image: doctorDetailPageProvider.doctorDetail!.image,
                    fields: doctorDetailPageProvider.doctorDetail!.fields
                );

                scheduleDataProvider.setSymptom(_controllerTextWord.text);

                scheduleDataProvider.setUser(userLoginProvider.userLogin);

                scheduleDataProvider.setScheduleDoctor(doctor);


                if(scheduleDataProvider.symptom!.isEmpty ||
                    scheduleDataProvider.scheduleDoctor == null ||
                    scheduleDataProvider.scheduleTime == null) {
                  Fluttertoast.showToast(
                      msg: "Vui Lòng Cung Cấp Đầy Đủ Thông Tin",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );

                  success = false;

                } else if(scheduleDataProvider.scheduleDay == null) {
                  Fluttertoast.showToast(
                      msg: "Vui Lòng Đặt Lịch Sau Ngày Hôm Nay Để Phòng Khám Có Thể Phục Vụ",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );

                  success = false;
                }

                if(success) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrderSummary()));
                }
              },
              child: const Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: Text(
                  "Tiếp Tục",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                ),
              )),
        ));
  }
}
