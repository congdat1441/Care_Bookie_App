import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../layouts_page/navbar_layout.dart';

class AppbarCustom extends StatefulWidget {
  const AppbarCustom({Key? key}) : super(key: key);

  @override
  State<AppbarCustom> createState() => _AppbarCustomState();
}

class _AppbarCustomState extends State<AppbarCustom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 10, 35, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 0.1,
                              blurRadius: 2,
                              offset: const Offset(0, 5))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(7.5),
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: const Offset(0, 5))
                          ],
                        ),
                        child: Container(
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: const Offset(0, 5))
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> const NavbarLayout(index: 4)));

                              },
                              child: Image.network('https://media.vogue.co.uk/photos/5d54522184bc2a0008c6484e/2:3/w_1600,c_limit/original',
                                  width: 60, height: 60, fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.red.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(0, 3))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.5),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.redAccent.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: const Offset(0, 5))
                          ],
                        ),
                        child: FloatingActionButton(
                          heroTag: 'buttonTag01',
                            mini: true,
                            elevation: 0,
                            backgroundColor: Colors.white,
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            foregroundColor: Colors.redAccent.withOpacity(0.5),
                            child: const Icon(
                              IconlyLight.notification,
                              color: Colors.red,
                              size: 21,
                            )),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
