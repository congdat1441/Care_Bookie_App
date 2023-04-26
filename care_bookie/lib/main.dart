import 'package:care_bookie/providers/bottom_navbar_provider.dart';
import 'package:care_bookie/providers/doctor_detail_page_provider.dart';
import 'package:care_bookie/providers/history_detail_page_provider.dart';
import 'package:care_bookie/providers/history_page_provider.dart';
import 'package:care_bookie/providers/home_page_provider.dart';
import 'package:care_bookie/providers/hospital_detail_page_provider.dart';
import 'package:care_bookie/providers/review_data_provider.dart';
import 'package:care_bookie/providers/schedule_data_provider.dart';
import 'package:care_bookie/providers/schedule_detail_page_provider.dart';
import 'package:care_bookie/providers/schedule_page_provider.dart';
import 'package:care_bookie/providers/user_login_provider.dart';
import 'package:care_bookie/view/pages/layouts_page/navbar_layout.dart';
import 'package:care_bookie/view/pages/login_signup_page/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavBarProvider()),
        ChangeNotifierProvider(create: (context) => HomePageProvider(),),
        ChangeNotifierProvider(create: (context) => HospitalDetailPageProvider(),),
        ChangeNotifierProvider(create: (context) => DoctorDetailPageProvider(),),
        ChangeNotifierProvider(create: (context) => HistoryPageProvider(),),
        ChangeNotifierProvider(create: (context) => UserLoginProvider(),),
        ChangeNotifierProvider(create: (context) => HistoryDetailPageProvider(),),
        ChangeNotifierProvider(create: (context) => ScheduleDataProvider(),),
        ChangeNotifierProvider(create: (context) => SchedulePageProvider(),),
        ChangeNotifierProvider(create: (context) => ScheduleDetailPageProvider(),),
        ChangeNotifierProvider(create: (context) => ReviewDataProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Golos' 'Arimo' 'Poppins',
        ),
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const NavbarLayout(index: 0);
              } else {
                return const LoginForm();
              }
            },
          )
      ),
    );
  }
}
