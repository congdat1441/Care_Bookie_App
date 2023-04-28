import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../../../models/doctor.dart';
import '../../../../models/hospital.dart';
import '../../../../providers/history_detail_page_provider.dart';
import '../../../../providers/home_page_provider.dart';
import '../../../../providers/review_data_provider.dart';
import '../../../../providers/schedule_page_provider.dart';
import '../../../../providers/user_login_provider.dart';
import '../../../../res/constants/colors.dart';
import '../../layouts_page/navbar_layout.dart';



class AddReviewClinic extends StatefulWidget {
  const AddReviewClinic({Key? key}) : super(key: key);

  @override
  State<AddReviewClinic> createState() => _AddReviewClinicState();
}

class _AddReviewClinicState extends State<AddReviewClinic> {
  final TextEditingController _controllerTextWord = TextEditingController();

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
        backgroundColor: ColorConstant.BackGroundColor,
        title: const Text(
          "Thêm đánh giá phòng khám",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 19,
            fontFamily: 'Poppins',
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
        bottomOpacity: 0,
        elevation: 0,
      ),
      body: addYourComment(),
      bottomNavigationBar: bottomNavigatorBar(),
    );
  }

  Widget addYourComment() {

    var reviewDataProvider = Provider.of<ReviewDataProvider>(context,listen: false);

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Center(
              child: Text(
                "Bao nhiêu sao nhỉ?",
                style: TextStyle(
                    fontSize: 18,
                    color: ColorConstant.BLueText,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins'),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: RatingBar.builder(
                  initialRating: 3.8,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    reviewDataProvider.setStarDefault(rating);
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Nhận xét của bạn',
                  style: TextStyle(
                      fontSize: 20,
                      color: ColorConstant.BLueText,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins'),
                ),
              ),
            ),
            Container(
              height: 450,
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              decoration: BoxDecoration(
                color: ColorConstant.Grey00.withOpacity(0.25),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextFormField(
                controller: _controllerTextWord,
                maxLines: 100,
                //maxLength: 350,
                decoration: InputDecoration(
                    hintText: 'Thêm nhận xét của bạn...',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: ColorConstant.Grey00.withOpacity(0.9))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomNavigatorBar() {
    return Container(
      height: 80,
      color: Colors.white,
      child: Column(
        children: [submit()],
      ),
    );
  }

  Widget submit() {

    var reviewDataProvider = Provider.of<ReviewDataProvider>(context,listen: false);

    var historyDetailPageProvider = Provider.of<HistoryDetailPageProvider>(context,listen: false);

    var userLoginProvider = Provider.of<UserLoginProvider>(context,listen: false);

    var homePageProvider = Provider.of<HomePageProvider>(context,listen: false);

    var schedulePageProvider = Provider.of<SchedulePageProvider>(context,listen: false);

    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Container(
          width: double.maxFinite,
          height: 70,
          decoration: BoxDecoration(
              color: ColorConstant.BackGroundColor,
              borderRadius: BorderRadius.circular(10)),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 5,
                backgroundColor: ColorConstant.BLueText,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () async{

                if(_controllerTextWord.text.isEmpty) {
                  Fluttertoast.showToast(
                      msg: "Vui Lòng Nhập Đánh Giá Về Bác Sỹ",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                } else {
                  UserReview user = UserReview(
                      id: userLoginProvider.userLogin.id!,
                      fullName: userLoginProvider.userLogin.fullName!,
                      image: userLoginProvider.userLogin.image!
                  );

                  String day = DateTime.now().day.toString();
                  String month = DateTime.now().month.toString();

                  if(DateTime.now().day < 10) {
                    day = '0$day';
                  }

                  if(DateTime.now().month < 10) {
                    month = '0$month';
                  }


                  Review review = Review(
                      content: _controllerTextWord.text,
                      star: reviewDataProvider.starDefault,
                      reviewDay: '$day/$month/${DateTime.now().year}',
                      user: user,
                      userId: user.id
                  );

                  ReviewResponseData reviewData =   await reviewDataProvider.reviewExistsByHospitalId(user.id, historyDetailPageProvider.historyDetail!.hospital.id);

                  print("reviewData");


                  if(reviewData.reviewDocId.isEmpty) {

                    var starTotal = (reviewData.starTotal * reviewData.reviewLength).round();

                    var starMedium = (starTotal + reviewDataProvider.starDefault) / (reviewData.reviewLength + 1);

                    var staMediumAsFixed = starMedium.toStringAsFixed(1);

                    bool isSuccess =  await reviewDataProvider.createReviewHospital(
                      review,
                      historyDetailPageProvider.historyDetail!.hospital.id,
                      double.parse(staMediumAsFixed),
                    );

                    if(isSuccess){
                      homePageProvider.listHospital = [];
                      schedulePageProvider.schedules = [];
                      Fluttertoast.showToast(
                          msg: "Đánh Giá Phòng Khám Thành Công",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NavbarLayout(index: 0,),
                          )
                      );
                    } else {
                      Fluttertoast.showToast(
                          msg: "Không Thể Đánh Giá Phòng Khám",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }

                  } else {

                    var totalStar = (reviewData.starTotal * reviewData.reviewLength).round();

                    var starChange = totalStar - reviewData.starUser;

                    var star = ((starChange + reviewDataProvider.starDefault) / reviewData.reviewLength).toStringAsFixed(1);

                    bool isSuccess =  await reviewDataProvider.updateReviewByHospitalId(
                        review,
                        historyDetailPageProvider.historyDetail!.hospital.id,
                        double.parse(star),
                        reviewData.reviewDocId
                    );

                    if(isSuccess){

                      homePageProvider.listHospital = [];
                      schedulePageProvider.schedules = [];

                      Fluttertoast.showToast(
                          msg: "Cập Nhập Đánh Giá Phòng Khám Thành Công",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NavbarLayout(index: 0,),
                          )
                      );
                    } else {
                      Fluttertoast.showToast(
                          msg: "Không Thể Đánh Giá Phòng Khám",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }

                  }

                }

                reviewDataProvider.setStarDefault(4);


              },
              child: const Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: Text(
                  "Gửi nhận xét",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                ),
              )),
        ));
  }
}
