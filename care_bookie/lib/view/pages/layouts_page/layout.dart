// import 'package:flutter/material.dart';
// import 'package:heath_care/pages/main_pages/main_page.dart';
// import 'package:heath_care/pages/medical_treatment_page/medical_treatment_now.dart';
//
// import '../../icons/my_flutter_app_icons.dart';
//
// class Layout extends StatefulWidget {
//   final Widget child;
//
//   const Layout({Key? key, required this.child}) : super(key: key);
//
//   @override
//   State<Layout> createState() => _LayoutState();
// }
//
// class _LayoutState extends State<Layout> {
//   int pageIndex = 1;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             child: widget.child,
//             // decoration: const BoxDecoration(
//             //     gradient: LinearGradient(
//             //       begin: Alignment.topCenter,
//             //       end: Alignment.bottomCenter,
//             //       colors: [
//             //         Colors.white,
//             //         Color(0xFFF6F6F6)
//             //       ],
//             //     )
//             // ),
//           ),
//           Positioned(
//               bottom: 0,
//               right: 0,
//               left: 0,
//               child: Container(
//                 height: 70,
//                 padding: const EdgeInsets.fromLTRB(0, 10, 0, 4),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF10142D),
//                   border: Border.all(width: 5, color: const Color(0xFF10142D)),
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(15),
//                     topRight: Radius.circular(15),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           pageIndex = 1;
//                           if (pageIndex != 1) {
//                             Navigator.pop(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => const MainPage()));
//                           }
//                         });
//                       },
//                       child: Center(
//                         child: Column(
//                           children: [
//                             // Padding(
//                             //   padding: const EdgeInsets.fromLTRB(2,0,0,5),
//                             //   child: Container(
//                             //     width: 5,
//                             //     height: 5,
//                             //     decoration: BoxDecoration(
//                             //         color: Colors.white,
//                             //         borderRadius: BorderRadius.circular(8)),
//                             //   ),
//                             // ),
//                             Icon(
//                               MyFlutterApp.clinic_medical,
//                               color:
//                                   pageIndex == 1 ? Colors.white : Colors.grey,
//                               size: 20,
//                             ),
//                             SizedBox(height: 5),
//                             Text(
//                               "Trang chủ",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w300,
//                                   fontFamily: "Exo",
//                                   color: pageIndex == 1
//                                       ? Colors.white
//                                       : Colors.grey,
//                                   fontSize: 13),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           if (pageIndex == 2) {
//                             Navigator.pop(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         const MedicalTreatmentNow()));
//                           }
//                         });
//                       },
//                       child: Column(
//                         children: [
//                           Icon(
//                             MyFlutterApp.first_aid,
//                             color: pageIndex == 2 ? Colors.white : Colors.grey,
//                             size: 20,
//                           ),
//                           SizedBox(height: 5),
//                           Text(
//                             "Khám chữa bệnh",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w300,
//                                 fontFamily: "Exo",
//                                 color:
//                                     pageIndex == 2 ? Colors.white : Colors.grey,
//                                 fontSize: 13),
//                           )
//                         ],
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           pageIndex = 3;
//                         });
//                       },
//                       child: Column(
//                         children: [
//                           Icon(
//                             MyFlutterApp.notes_medical,
//                             color: pageIndex == 3 ? Colors.white : Colors.grey,
//                             size: 20,
//                           ),
//                           SizedBox(height: 5),
//                           Text(
//                             "Lịch sử",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w300,
//                                 fontFamily: "Exo",
//                                 color:
//                                     pageIndex == 3 ? Colors.white : Colors.grey,
//                                 fontSize: 13),
//                           )
//                         ],
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           pageIndex = 4;
//                         });
//                       },
//                       child: Column(
//                         children: [
//                           Icon(
//                             MyFlutterApp.user,
//                             color: pageIndex == 4 ? Colors.white : Colors.grey,
//                             size: 20,
//                           ),
//                           SizedBox(height: 5),
//                           Text(
//                             "Tài khoản",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w300,
//                                 fontFamily: "Exo",
//                                 color:
//                                     pageIndex == 4 ? Colors.white : Colors.grey,
//                                 fontSize: 13),
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
// }
