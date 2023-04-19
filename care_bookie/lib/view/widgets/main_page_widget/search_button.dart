import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:heath_care/view/pages/search_page/search_screen.dart';
import '../../../res/constants/colors.dart';

class SearchButton extends StatefulWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 20, 35, 0),
      child: Container(
        height: 65,
        decoration: BoxDecoration(
            color: const Color(0xf2ffffff),
            borderRadius: BorderRadius.circular(20)),
        child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          onPressed: () {Navigator.push(context, MaterialPageRoute(
              builder: (context) => const SearchScreen()));},
          child: customButton(),
        ),
      ),
    );
  }

  Widget customButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          "Search for poly",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: ColorConstant.Grey00,
              fontFamily: 'Poppins'),
        ),
        const SizedBox(
          width: 10,
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: Center(
              child: Stack(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.red.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 2))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.5),
                    child: Container(
                      width: 30,
                      height: 30,
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
                          mini: true,
                          elevation: 0,
                          backgroundColor: Colors.white,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => const SearchScreen()));
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          foregroundColor: Colors.redAccent.withOpacity(0.5),
                          child: const Icon(
                            IconlyLight.search,
                            color: Colors.red,
                            size: 18,
                          )),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
