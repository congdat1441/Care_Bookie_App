import 'package:flutter/material.dart';

class Price extends StatefulWidget {
  const Price({Key? key}) : super(key: key);

  @override
  State<Price> createState() => _PriceState();
}

class _PriceState extends State<Price> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text("Chi phí dự kiến",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  overflow: TextOverflow.visible)),
        ),
        SizedBox(
          width: 200,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text("150,000đ",
                maxLines: 2,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.amber,
                    fontSize: 17,
                    overflow: TextOverflow.ellipsis)),
          ),
        ),
      ],
    );
  }
}
