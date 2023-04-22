import 'package:flutter/material.dart';

class Price extends StatefulWidget {
  const Price({Key? key}) : super(key: key);

  @override
  State<Price> createState() => _PriceState();
}

class _PriceState extends State<Price> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text("Tổng chi phí",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      overflow: TextOverflow.visible)),
            ),
            SizedBox(
              width: 200,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text("1000,000đ",
                    maxLines: 2,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.amber,
                        fontSize: 17,
                        overflow: TextOverflow.ellipsis)),
              ),
            ),
          ],
        ),
        ...[1,2,3,4].map((e) => Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(left: 20,right: 20),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Chụp X Quang"),
              Text("500,000đ")
            ],
          ),
        ))
      ],
    );
  }
}
