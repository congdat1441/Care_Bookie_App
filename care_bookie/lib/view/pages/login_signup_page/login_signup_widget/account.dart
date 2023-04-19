import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:icons_plus/icons_plus.dart';

class AddAcount extends StatefulWidget {
  const AddAcount({Key? key}) : super(key: key);

  @override
  State<AddAcount> createState() => _AddAcountState();
}

class _AddAcountState extends State<AddAcount> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      padding: EdgeInsets.fromLTRB(0, 20, 30, 0),
      // color: Colors.orange,
      width: 330,
      child: TextFormField(
        // textAlign: TextAlign.left,
          style: TextStyle(color: Colors.black),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Add your phone number";
            } else if (value.length <= 5) {
              return "Not enough required character";
            }
            return null;
          },
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(0),
                )),
            label: Text("Phone number",
                style:
                TextStyle(color: Colors.black)),
            hintText: "Please add your phone number",
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 94, 92, 88),
            ),
            prefixIcon: SizedBox(
              width: 0,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  IconlyLight.call,
                  color: Colors.black,
                ),
              ),
            ),
          )),
    );
  }
}
