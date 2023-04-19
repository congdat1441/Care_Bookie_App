import 'package:flutter/material.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heath_care/view/pages/review_page/review_doctor_page/review_doctor.dart';
import '../../../../res/constants/colors.dart';
import 'order_detail_doctor.dart';

class DetailDoctor extends StatefulWidget {
  const DetailDoctor({Key? key}) : super(key: key);

  @override
  State<DetailDoctor> createState() => _DetailDoctorState();
}

class _DetailDoctorState extends State<DetailDoctor>
    with TickerProviderStateMixin {
  final String longText =
      'sit amet saidunt ante. Nullam fringilla, justo nec ultrices euismod, velit ipsum congue arcu, vel gravida eros mauris sit amet lorem. Mauris tincidunt justo sed nunc pretium fermentum. Vivamus vel aliquam enim. Vivamus tincidunt nunc eu orci venenatis, ut bibendum lorem bibendum. Sed feugiat tincidunt ipsum non feugiat. Suspendisse nec bibendum arcu Sed dictum ante eu purus finibus, eu tristique tellus feugiat. Sed faucibus, elit et luctus malesuada, ipsum mauris faucibus odio, eget laoreet ipsum dolor nec nisi. Duis id vestibulum nulla. Nulla at magna vel nulla pharetra fermentum. Sed vitae ante malesuada, malesuada felis vitae, scelerisque arcu. Morbi pellentesque est eu mauris venenatis volutpat. In hac habitasse platea dictumst. Nulla feugiat lectus velit, nec dapibus purus lobortis et. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec eu eros ut orci commodo consequat a quis neque. Sed non justo non quam ultrices tempus sit amet non nulla. Nam vel arcu Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eget convallis tortor. Suspendisse potenti. Sed dictum ante eu purus finibus, eu tristique tellus feugiat. Sed faucibus, elit et luctus malesuada, ipsum mauris faucibus odio, eget laoreet ipsum dolor nec nisi. Duis id vestibulum nulla. Nulla at magna vel nulla pharetra fermentum. Sed vitae ante malesuada, malesuada felis vitae, scelerisque arcu. Morbi pellentesque tellus maximus bibendum .';
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
          infoBasicDoctor(),
          infoDetailDoctor(),
          certification(),
          orderSchedule(context)
        ],
      ),
    );
  }

  Widget sliverAppBar() {
    return SliverAppBar(
      title: const Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Text(
          "Dr. Nguyễn Văn A",
          style: TextStyle(
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
              child: Image.asset(
                "assets/images/doctor03.jpg",
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
                  const SizedBox(
                    width: 210,
                    child: Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      "Dr. Nguyễn Văn A",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 21,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Container(
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
                ],
              ),
            )),
      ),
    );
  }

  Widget infoBasicDoctor() {
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
                children: [
                  Row(
                    children: [
                      const Icon(
                        IconlyLight.location,
                        size: 25,
                        color: Colors.amber,
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                        width: 320,
                        child: const Text("124, Nguyễn Thái Học, Huế",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
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
                      Row(children: [
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
                        const Text("4.5",
                            style: TextStyle(
                                height: 1.5,
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Merriweather Sans')),
                      ],),

                      TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const ReviewDoctor()));
                          },
                          child: const Text("xem đánh giá",
                              style: TextStyle(
                                  height: 1.5,
                                  fontSize: 16,
                                  color: Colors.amber,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Merriweather Sans')))
                    ],
                  ),
                  Row(
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
                        padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                        width: 320,
                        child: const Text("15 năm kinh nghiệm ",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                height: 0.9,
                                fontSize: 16,
                                color: ColorConstant.Grey01,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Merriweather Sans')),
                      ),
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

  Widget infoDetailDoctor() {
    const String longText =
        'sit amet saidunt ante. Nullam fringilla, justo nec ultrices euismod, velit ipsum congue arcu, vel gravida eros mauris sit amet lorem. Mauris tincidunt justo sed nunc pretium fermentum. Vivamus vel aliquam enim. Vivamus tincidunt nunc eu orci venenatis, ut bibendum lorem bibendum. Sed feugiat tincidunt ipsum non feugiat. Suspendisse nec bibendum arcu Sed dictum ante eu purus finibus, eu tristique tellus feugiat. Sed faucibus, elit et luctus malesuada, ipsum mauris faucibus odio, eget laoreet ipsum dolor nec nisi. Duis id vestibulum nulla. Nulla at magna vel nulla pharetra fermentum. Sed vitae ante malesuada, malesuada felis vitae, scelerisque arcu. Morbi pellentesque est eu mauris venenatis volutpat. In hac habitasse platea dictumst. Nulla feugiat lectus velit, nec dapibus purus lobortis et. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec eu eros ut orci commodo consequat a quis neque. Sed non justo non quam ultrices tempus sit amet non nulla. Nam vel arcu Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eget convallis tortor. Suspendisse potenti. Sed dictum ante eu purus finibus, eu tristique tellus feugiat. Sed faucibus, elit et luctus malesuada, ipsum mauris faucibus odio, eget laoreet ipsum dolor nec nisi. Duis id vestibulum nulla. Nulla at magna vel nulla pharetra fermentum. Sed vitae ante malesuada, malesuada felis vitae, scelerisque arcu. Morbi pellentesque tellus maximus bibendum .';
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
              children: const [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Thông tin Bác Sỹ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ExpandableText(
                  longText,
                  trimType: TrimType.lines,
                  trim: 8,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    height: 1.5,
                    fontSize: 16,
                  ),
                  readMoreText: 'Xem thêm',
                  readLessText: 'Thu gọn',
                  linkTextStyle: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
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
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 10),
                          child: const Text(
                            "M.B.S.F.C.P.S. Cardio Specialist",
                            maxLines: 2,
                            style: TextStyle(
                                overflow: TextOverflow.fade,
                                height: 1.4,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Icon(Icons.ac_unit)
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 10),
                          child: const Text(
                            "M.B.S.F.C.P.S. Cardio Specialist",
                            maxLines: 2,
                            style: TextStyle(
                                overflow: TextOverflow.fade,
                                height: 1.4,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Icon(Icons.ac_unit)
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 10),
                          child: const Text(
                            "M.B.S.F.C.P.S. Cardio Specialist",
                            maxLines: 2,
                            style: TextStyle(
                                overflow: TextOverflow.fade,
                                height: 1.4,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Icon(Icons.ac_unit)
                      ],
                    ),
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
    return SliverToBoxAdapter(
      child: Padding(
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
                            child: OrderDetailDoctor()),
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
          )),
    );
  }
}
