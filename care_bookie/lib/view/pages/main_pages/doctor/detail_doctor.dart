import 'package:care_bookie/models/doctor.dart';
import 'package:care_bookie/models/favorite.dart';
import 'package:care_bookie/models/hospital.dart';
import 'package:care_bookie/providers/favorite_page_provider.dart';
import 'package:care_bookie/providers/hospital_detail_page_provider.dart';
import 'package:care_bookie/providers/user_login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../../../providers/doctor_detail_page_provider.dart';
import '../../../../providers/doctor_detail_page_provider.dart';
import '../../../../providers/favorite_dotor_data_provider.dart';
import '../../../../providers/schedule_data_provider.dart';
import '../../../../providers/schedule_detail_page_provider.dart';
import '../../../../res/constants/colors.dart';
import '../../review_page/review_doctor_page/review_doctor.dart';
import '../../schedule/schedule_detail_accept.dart';
import '../../schedule/schedule_detail_pending.dart';
import 'order_detail_doctor.dart';

class DetailDoctor extends StatefulWidget {
  const DetailDoctor({Key? key}) : super(key: key);

  @override
  State<DetailDoctor> createState() => _DetailDoctorState();
}

class _DetailDoctorState extends State<DetailDoctor>
    with TickerProviderStateMixin {
  bool isLoading = false;
  bool isExpanded = false;
  late TabController _tabControl;

  @override
  void initState() {
    super.initState();

    final doctorDetailProvider =
        Provider.of<DoctorDetailPageProvider>(context, listen: false);

    var scheduleDataProvider = Provider.of<ScheduleDataProvider>(context,listen: false);

    var hospitalDetailPageProvider = Provider.of<HospitalDetailPageProvider>(context,listen: false);

    if (doctorDetailProvider.isDoctorWithHospital) {
      (() async {
        Doctor doctor = await doctorDetailProvider.getDoctorById();

        doctorDetailProvider.setDoctorDetail(doctor);

        scheduleDataProvider.setHospital(hospitalDetailPageProvider.hospitalDetails!);

        setState(() {
          isLoading = true;
        });
      })();
    } else {

      var doctorDetailProvider = Provider.of<DoctorDetailPageProvider>(context,listen: false);

      var scheduleDataProvider = Provider.of<ScheduleDataProvider>(context,listen: false);

      (() async {

        String hospitalId = doctorDetailProvider.doctorDetail!.hospitalId;

        Hospital hospital = await doctorDetailProvider.getHospitalById(hospitalId);

        scheduleDataProvider.setHospital(hospital);

        setState(() {
          isLoading = true;
        });
      })();
    }

    _tabControl = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? CustomScrollView(
              slivers: [
                sliverAppBar(context),
                infoBasicDoctor(context),
                infoDetailDoctor(context),
                certification(context),
                orderSchedule(context)
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  SliverAppBar sliverAppBar(BuildContext context) {
    final doctorDetailProvider =
        Provider.of<DoctorDetailPageProvider>(context, listen: false);

    var scheduleDataProvider = Provider.of<ScheduleDataProvider>(context,listen: false);

    var hospitalDetailPageProvider = Provider.of<HospitalDetailPageProvider>(context,listen: false);

    var favoriteDoctorDataProvider = Provider.of<FavoriteDoctorDataProvider>(context,listen: false);

    var userLoginProvider = Provider.of<UserLoginProvider>(context,listen: false);

    return SliverAppBar(
      title: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Text(
          "Dr. ${doctorDetailProvider.doctorDetail!.fullName}",
          style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              //letterSpacing: 2,
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

          doctorDetailProvider.resetData();
          scheduleDataProvider.resetData();

          hospitalDetailPageProvider.scheduleWithHospital = null;

          Navigator.pop(context);
        },
        icon: const Icon(
          IconlyLight.arrowLeft,
          size: 30,
        ),
      ),
      actions: [
        doctorDetailProvider.isDoctorWithFavorite ? Container() : IconButton(
          onPressed: () async{

            var favoritePageProvider = Provider.of<FavoritePageProvider>(context,listen: false);

            doctorDetailProvider.setIsFavorite(!doctorDetailProvider.isFavorite);

            if(doctorDetailProvider.isFavorite) {

              DoctorFavorite doctorFavorite = DoctorFavorite(
                  id: doctorDetailProvider.doctorDetail!.id,
                  fullName: doctorDetailProvider.doctorDetail!.fullName,
                  fields: doctorDetailProvider.doctorDetail!.fields,
                  image: doctorDetailProvider.doctorDetail!.image,
                  hospitalId: doctorDetailProvider.doctorDetail!.hospitalId
              );

              await favoriteDoctorDataProvider.createDoctorFavorite(doctorFavorite, userLoginProvider.userLogin.id!);

              await favoritePageProvider.getFavoriteDataByUserId(userLoginProvider.userLogin.id!);


            } else {

              bool isSuccess = await favoriteDoctorDataProvider.deleteDoctorFavoriteById(userLoginProvider.userLogin.id!,doctorDetailProvider.doctorDetail!.id);

              if(isSuccess) {

                await favoritePageProvider.getFavoriteDataByUserId(userLoginProvider.userLogin.id!);

              }
            }

            setState(() {

            });
          },
          icon: doctorDetailProvider.isFavorite  ?  const Icon(
            IconlyBold.heart,
            size: 30,
            color: Colors.redAccent,
          ) : const Icon(
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
                doctorDetailProvider.doctorDetail!.image,
                width: double.infinity,
                fit: BoxFit.fill,
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
        preferredSize: const Size.fromHeight(30),
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
                  doctorDetailProvider.scheduleWithDoctor == null ? Container(
                    width: 120,
                    height: 50,
                    decoration: BoxDecoration(
                        color: ColorConstant.BLue05,
                        borderRadius: BorderRadius.circular(30)),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ColorConstant.BLue05,
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () {
                        if(doctorDetailProvider.scheduleWithHospital != null) {

                          Fluttertoast.showToast(
                              msg: "Bạn Đã Đặt Lịch Khám Ở Phòng Khám Này",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );

                        } else {

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
                                    child: OrderDetailDoctor()),
                              );
                            },
                          );

                        }
                      },
                      child: const Text(
                        "Đặt lịch",
                        style: TextStyle(
                            fontFamily: 'Merriweather Sans',
                            fontSize: 17,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  )
                      : Container()
                ],
              ),
            )),
      ),
    );
  }

  Widget infoBasicDoctor(BuildContext context) {
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

  Widget infoDetailDoctor(BuildContext context) {
    final doctorDetailProvider =
        Provider.of<DoctorDetailPageProvider>(context, listen: false);

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Thông tin Bác Sỹ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ExpandableText(
                  doctorDetailProvider.doctorDetail!.information,
                  trimType: TrimType.lines,
                  trim: 8,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    height: 1.5,
                    fontSize: 16,
                  ),
                  readMoreText: 'Xem thêm',
                  readLessText: 'Thu gọn',
                  linkTextStyle:
                      const TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget certification(BuildContext context) {
    final doctorDetailProvider =
        Provider.of<DoctorDetailPageProvider>(context, listen: false);

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
                  children: [
                    ...doctorDetailProvider.doctorDetail!.knowledges
                        .map((e) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text(
                                    "$e",
                                    maxLines: 2,
                                    style: const TextStyle(
                                        overflow: TextOverflow.fade,
                                        height: 1.4,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(right: 20),
                                    child: const Icon(Icons.ac_unit))
                              ],
                            ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget orderSchedule(BuildContext context) {

    var doctorDetailPageProvider = Provider.of<DoctorDetailPageProvider>(context,listen: false);

    var scheduleDetailPageProvider = Provider.of<ScheduleDetailPageProvider>(context,listen: false);

    return SliverToBoxAdapter(
      child: doctorDetailPageProvider.scheduleWithDoctor == null ?  Padding(
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

                  if(doctorDetailPageProvider.scheduleWithHospital != null) {

                    Fluttertoast.showToast(
                        msg: "Bạn Đã Đặt Lịch Khám Ở Phòng Khám Này",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );

                  } else {

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
                              child: OrderDetailDoctor()),
                        );
                      },
                    );

                  }

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

                  scheduleDetailPageProvider.setScheduleDetail(doctorDetailPageProvider.scheduleWithDoctor!);

                  if(doctorDetailPageProvider.scheduleWithDoctor!.accept) {

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
}
