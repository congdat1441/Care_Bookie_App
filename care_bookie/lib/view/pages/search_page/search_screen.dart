import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../res/constants/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _selectedStar = '1 Star';
  String _selectedDisease = 'Disease A';

  final List<String> _starLevels = [
    '1 Star',
    '2 Stars',
    '3 Stars',
    '4 Stars',
    '5 Stars'
  ];
  final List<String> _diseases = [
    'Disease A',
    'Disease B',
    'Disease C',
    'Disease D',
    'Disease E',
    'Non'
  ];

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
                    Icons.search,
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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              starAndDisease(),
               content()
            ],
          ),
        ));
  }

  Widget starAndDisease() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            children: [
              SizedBox(
                height: 50,
                width: 100,
                child: DropdownButton<String>(
                  value: _selectedStar,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedStar = value!;
                    });
                  },
                  items: _starLevels.map((level) {
                    int starCount = int.parse(
                        level.split(' ')[0]); // Lấy số lượng sao từ chuỗi level
                    return DropdownMenuItem<String>(
                      value: level,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '$starCount',
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: Colors.black,
                                fontFamily: 'Poppins'),
                          ),
                          const SizedBox(width: 8.0),
                          const Icon(
                            IconlyBold.star,
                            color: Colors.amberAccent,
                            size: 24.0,
                          ), // Icon sao
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              SizedBox(
                height: 50,
                width: 110,
                child: DropdownButton<String>(
                  value: _selectedDisease,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedDisease = value!;
                    });
                  },
                  items: _diseases.map((disease) {
                    return DropdownMenuItem<String>(
                      value: disease,
                      child: Text(
                        disease,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Colors.black,
                            fontFamily: 'Poppins'),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),


        ],
      ),
    );
  }

  Widget content() {
    return Column(
      children: [
        Text(
          'Data for $_selectedStar stars and $_selectedDisease:',
          style: const TextStyle(fontSize: 18.0),
        ),
        const SizedBox(height: 16.0),
        Container(
          color: Colors.grey[200],
          child: const Center(
            child: Text(
              'Data goes here',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ),
      ],
    );
  }
}
