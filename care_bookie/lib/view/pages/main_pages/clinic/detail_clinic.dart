import 'package:care_bookie/providers/doctor_detail_page_provider.dart';
import 'package:care_bookie/providers/schedule_data_provider.dart';
import 'package:care_bookie/view/pages/schedule/schedule_detail_pending.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import '../../../../../res/constants/colors.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';
import '../../../../providers/hospital_detail_page_provider.dart';
import '../../../../providers/schedule_detail_page_provider.dart';
import '../../review_page/review_clinic_page/review_clinic.dart';
import '../../schedule/schedule_detail_accept.dart';
import '../doctor/detail_doctor.dart';
import 'order_detail_clinic.dart';

class DetailClinic extends StatefulWidget {
  const DetailClinic({Key? key}) : super(key: key);

  @override
  State<DetailClinic> createState() => _DetailClinicState();
}

class _DetailClinicState extends State<DetailClinic>
    with TickerProviderStateMixin {
  bool isExpanded = false;
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.BackGroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          sliverAppBar(),
          addressAndReview(),
          doctorAndWard(),
          infoClinic(),
          certification(),
          orderSchedule(context)
        ],
      ),
    );
  }


  Widget sliverAppBar() {
    return Consumer2<HospitalDetailPageProvider,ScheduleDataProvider>(
      builder: (context, hospitalDetailPageProvider,scheduleDataProvider, child) => SliverAppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Text(
            hospitalDetailPageProvider.hospitalDetails!.hospitalName,
            style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500),
          ),
        ),
        shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
        collapsedHeight: 80,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            hospitalDetailPageProvider.scheduleWithHospital = null;
            scheduleDataProvider.resetData();
            Navigator.pop(context);
          },
          icon: const Icon(
            IconlyLight.arrowLeft,
            size: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              IconlyLight.heart,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              IconlyLight.upload,
              size: 30,
            ),
          ),
        ],
        expandedHeight: 350,
        flexibleSpace: FlexibleSpaceBar(
          background: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(34),
                    bottomRight: Radius.circular(34)),
                child: Image.network(
                  hospitalDetailPageProvider.hospitalDetails!.image,
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
          stretchModes: const <StretchMode>[
            StretchMode.zoomBackground,
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  )),
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              //padding: const EdgeInsets.only(),
              width: double.maxFinite,
              height: 90,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    SizedBox(
                      width: 210,
                      child: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        hospitalDetailPageProvider.hospitalDetails!.hospitalName,
                        style:
                        const TextStyle(fontWeight: FontWeight.w500, fontSize: 21),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: Text(hospitalDetailPageProvider.hospitalDetails!.fee,
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              height: 0,
                              fontWeight: FontWeight.w500,
                              color: Color(0xfffcb13d),
                              fontSize: 20)),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Widget addressAndReview() {
    return  Consumer<HospitalDetailPageProvider>(
        builder: (context, hospitalDetailPageProvider, child) => SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Container(
              height: 230,
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 215,
                          padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                          child: Text(hospitalDetailPageProvider.hospitalDetails!.address,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  height: 1,
                                  fontSize: 13,
                                  color: ColorConstant.Grey01,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Merriweather Sans')),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                          child: Text("LH: ${hospitalDetailPageProvider.hospitalDetails!.phone}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  height: 1,
                                  fontSize: 13,
                                  color: ColorConstant.Grey01,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Merriweather Sans')),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ...[1, 2, 3, 4, 5].map((e) {
                                if(e <= hospitalDetailPageProvider.hospitalDetails!.star) {
                                  return const Icon(
                                    IconlyBold.star,
                                    size: 25,
                                    color: Colors.amber,
                                  );
                                }

                                return const Icon(
                                  IconlyBold.star,
                                  size: 25,
                                  color: Colors.black12,
                                );
                              }),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                  "${hospitalDetailPageProvider.hospitalDetails!.star}",
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
                                        const ReviewClinic()));
                              },
                              child: const Text("Xem đánh giá",
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 18,
                                      color: Colors.amber,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Merriweather Sans')))
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 15, 0, 10),
                          width: 350,
                          child: const Text("Dịch vụ khám",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  height: 0.9,
                                  fontSize: 19,
                                  //color: ColorConstant.Grey01,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Merriweather Sans')),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...hospitalDetailPageProvider.hospitalDetails!.services.map((e) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorConstant.BLue05),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("#$e",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: ColorConstant.BLue05,
                                      height: 0.9,
                                      fontSize: 15,
                                      //color: ColorConstant.Grey01,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Merriweather Sans')),
                            ),
                          ))
                        ],
                      ),
                    ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 15, 0, 10),
                          child: const Text("Giờ làm việc: ",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  height: 1,
                                  fontSize: 15,
                                  //color: ColorConstant.Grey01,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Merriweather Sans')),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 15, 0, 10),
                          child: Text(hospitalDetailPageProvider.hospitalDetails!.workingHours,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  height: 1,
                                  fontSize: 14,
                                  color: ColorConstant.Grey01,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Merriweather Sans')),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }

  Widget doctorAndWard() {
    return  SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            child: Container(
              height: 285,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  SizedBox(
                    //padding: const EdgeInsets.symmetric(horizontal: 40),
                    height: 40,
                    child: TabBar(
                      controller: _tabController,
                      tabs: const [
                        Tab(
                          child: Text(
                            "Bác Sỹ",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Tab(
                          child: Text("Khoa", style: TextStyle(fontSize: 20)),
                        ),
                      ],
                      indicatorWeight: 2,
                      indicatorPadding: const EdgeInsets.symmetric(horizontal: 30),
                      labelColor: Colors.blue,
                      unselectedLabelColor: ColorConstant.Grey01,
                    ),
                  ),
                  Expanded(
                    child: TabBarView(controller: _tabController, children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [listDoctor(context)],
                        ),
                      ),
                      Padding(padding: const EdgeInsets.all(10),
                        child: listWard(context),
                      )
                    ]),
                  ),
                ],
              ),
            ),
          ),
        );
  }

  Widget infoClinic() {

    return Consumer<HospitalDetailPageProvider>(
        builder: (context, hospitalDetailPageProvider, child) => SliverToBoxAdapter(
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [

                    const Padding(
                      padding: EdgeInsets.only(top:10.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Thông tin phòng khám',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: ExpandableText(
                        hospitalDetailPageProvider.hospitalDetails!.information,
                        trimType: TrimType.lines,
                        trim: 8,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          height: 1.4,
                          fontSize: 16,
                        ),
                        readMoreText: 'Xem thêm',
                        readLessText: 'Thu gọn',
                        linkTextStyle: const TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }

  Widget certification() {
    return Consumer<HospitalDetailPageProvider>(
        builder: (context, hospitalDetailPageProvider, child) => SliverToBoxAdapter(
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
                  'Chứng nhận đi kèm',
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
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...hospitalDetailPageProvider.hospitalDetails!.certifications.map((e) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                e,
                                maxLines: 2,
                                style: const TextStyle(
                                    overflow: TextOverflow.fade,
                                    height: 1.4,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 20),
                              child: const Icon(Icons.ac_unit),
                            )
                          ],
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }

  Widget orderSchedule(BuildContext context) {

    var hospitalDetailPageProvider = Provider.of<HospitalDetailPageProvider>(context,listen: false);

    var scheduleDetailPageProvider = Provider.of<ScheduleDetailPageProvider>(context,listen: false);

    return SliverToBoxAdapter(
      child: hospitalDetailPageProvider.scheduleWithHospital == null ?  Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Container(
            height: 70,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    isDismissible: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    builder: (context) {
                      return const FractionallySizedBox(
                        heightFactor: 0.93,
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                            child: OrderDetailClinic()),
                      );
                    },
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  child: Text(
                    "Đặt lịch khám",
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                  ),
                )),
          )) :
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Container(
            height: 70,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () {

                  scheduleDetailPageProvider.setScheduleDetail(hospitalDetailPageProvider.scheduleWithHospital!);

                  if(hospitalDetailPageProvider.scheduleWithHospital!.accept) {

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ScheduleDetailAccept()));

                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ScheduleDetailPending()));
                  }


                },
                child: const Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  child: Text(
                    "Xem Lịch Khám",
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                  ),
                )),
          )),
    );
  }

  Widget listDoctor(BuildContext context) {

    return Consumer<HospitalDetailPageProvider>(
        builder: (context, hospitalDetailPageProvider, child) => Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: SizedBox(
            height: 225,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(
                  width: 35,
                ),
                ...hospitalDetailPageProvider.hospitalDetails!.doctors.map((e) => Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.only(right: 15),
                    height: 200,
                    width: 155,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(27),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.15),
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: const Offset(0, 3))
                      ],
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 7),
                              height: 135,
                              width: 140,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 15,
                                      offset: const Offset(0, 20))
                                ],
                              ),
                              child: Ink(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: InkWell(
                                  onTap: () {

                                    final doctorDetailProvider = Provider.of<DoctorDetailPageProvider>(context,listen: false);

                                    doctorDetailProvider.setIsDoctorWithHospital(true);
                                    doctorDetailProvider.setIdDoctorWithHospital(e.id);

                                    if(hospitalDetailPageProvider.scheduleWithHospital != null) {

                                      doctorDetailProvider.setScheduleWithHospital(hospitalDetailPageProvider.scheduleWithHospital!);

                                      if(hospitalDetailPageProvider.scheduleWithHospital!.doctor.id == e.id) {
                                        doctorDetailProvider.setScheduleWithDoctor(hospitalDetailPageProvider.scheduleWithHospital!);
                                      }

                                    }

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const DetailDoctor()));
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      e.image,
                                      fit: BoxFit.fill,

                                      //scale: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Container(
                            //   margin: const EdgeInsets.fromLTRB(105, 10, 0, 0),
                            //   height: 28,
                            //   width: 28,
                            //   child: FloatingActionButton(
                            //       backgroundColor: Colors.white,
                            //       child: const Icon(
                            //         IconlyBroken.heart,
                            //         color: Color(0xffee5353),
                            //         size: 20,
                            //       ),
                            //       onPressed: () {}),
                            // ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
                          child: Column(
                            children: [
                              SizedBox(
                                  width: 130,
                                  height: 20,
                                  //color: Colors.grey,
                                  child: Text(e.fullName,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          //overflow: TextOverflow.ellipsis,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Merriweather Sans'))),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(e.fields,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: ColorConstant.Grey01,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Merriweather Sans')),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )),
              ],
            ),
          ),
        )
    );

  }

  Widget listWard(BuildContext context) {

    return Consumer<HospitalDetailPageProvider>(
        builder: (context, hospitalDetailPageProvider, child) => Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...hospitalDetailPageProvider.hospitalDetails!.wards.map(
                    (e) => Container(
                  margin: const EdgeInsets.fromLTRB(10, 5, 5, 10),
                  height: 80,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      //end: Alignment.centerRight,
                      end: Alignment(0.9, 0.2),
                      colors: <Color>[
                        Color(0xFF237be5),
                        Color(0xFF1e81e7),
                        Color(0xFF1885ea),
                        Color(0xFF1589ec),
                        Color(0xFF118dee),
                        Color(0xFF0e8eef),
                        Color(0xFF0994f1),
                        Color(0xFF0697f3),
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/ward.png",
                              scale: 5,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 80,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  e.wardsName,
                                  style: const TextStyle(
                                      height: 1.1,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                      color: Colors.white,
                                      fontFamily: 'Poppins'),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                        width: 130,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...e.doctors.map(
                                  (e) => Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  "Dr. $e",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.white,
                                      fontFamily: 'Poppins'),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );

  }

}
