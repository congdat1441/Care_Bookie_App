import 'package:flutter/material.dart';

import '../../../res/constants/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = "";
  int _selectStar = -1;
  final List<String> _optionListStar = ['1', '2', '3', '4', '5'];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          width: 600,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(50)),
          child: TextField(
            decoration: InputDecoration(
              fillColor: Colors.white,
              hintText: 'Search for poly...',
              hintStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: ColorConstant.Grey00,
                  fontFamily: 'Poppins'),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.clear,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
              filled: true,
            ),
            onChanged: (value) {},
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),

                    ),
                    GridView.count(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: (1 / .4),
                      children: List.generate(
                        _optionListStar.length,
                            (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectStar = index;
                              });
                            },
                            child: Container(
                              //height: 100,
                              margin: const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                color: _optionListStar == index
                                    ? ColorConstant.BLue02
                                    : const Color(0xFFf6f6f6),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Column(
                                  children: [
                                    // Text(
                                    //   _optionListStar[index],
                                    //   style: TextStyle(
                                    //     fontSize: 15,
                                    //     fontWeight: FontWeight.w400,
                                    //     fontFamily: 'Poppins',
                                    //     color: _selectStar == index
                                    //         ? Colors.white
                                    //         : Colors.black,
                                    //   ),
                                    // ),
                                    Text(
                                      _optionListStar[index],
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Poppins',
                                        color: _selectStar == index
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ],
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
            )
          ],
        ),
      ),
    );
  }
}
