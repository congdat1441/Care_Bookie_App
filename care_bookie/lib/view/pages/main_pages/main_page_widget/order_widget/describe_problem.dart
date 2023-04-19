import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoDescribeProblem extends StatefulWidget {
  const InfoDescribeProblem({Key? key}) : super(key: key);

  @override
  State<InfoDescribeProblem> createState() => _InfoDescribeProblemState();
}

class _InfoDescribeProblemState extends State<InfoDescribeProblem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text("Mô tả triệu chứng",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      overflow: TextOverflow.visible)),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          width: double.maxFinite,
          decoration: BoxDecoration(
              //color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border:
                  Border.all(color: CupertinoColors.systemGrey3, width: 0.5)),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eleifend risus a ex ultricies blandit. Mauris venenatis nunc ut est dapibus, ac suscipit eros bibendum. Integer sagittis, enim vel convallis hendrerit, mauris sapien tristique mi, sed bibendum massa metus eu dolor. Sed vestibulum tellus quis ex eleifend auctor. Sed sed velit eget enim tristique ultricies at at massa. In lacinia magna nec arcu dignissim, eu laoreet leo tincidunt. Nulla lobortis nunc at est facilisis faucibus. Sed eget semper enim. Vestibulum id urna nec nulla porttitor accumsan vel quis nisi. Quisque congue ligula at mauris suscipit, ut pellentesque ex iaculis. Maecenas vestibulum, magna vel tempor varius, tortor ex dapibus ipsum, nec bibendum sapien diam auctor metus. In eget mi ex. Nulla varius, massa ac feugiat blandit, dolor libero feugiat magna, ac scelerisque sapien turpis eu felis. Donec pulvinar, arcu eu rutrum malesuada, sapien lectus cursus eros, eget placerat nisl arcu vitae lectus.",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                    height: 1.4,
                    fontSize: 17,
                  )),
            ),
          ),
        ),
        const Divider(
          height: 30,
          color: Colors.grey,
          thickness: 0.25,
        ),
      ],
    );
  }
}
