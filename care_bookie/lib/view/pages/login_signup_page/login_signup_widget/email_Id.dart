import 'package:flutter/material.dart';

class EmailId extends StatefulWidget {
  const EmailId({Key? key}) : super(key: key);

  @override
  State<EmailId> createState() => _EmailIdState();
}

class _EmailIdState extends State<EmailId> {
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
              return "";
            } else if (value.length <= 5) {
              return "Not enough required characters";
            }
            return null;
          },
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(0),
                )),
            label: Text("Email",
                style:
                TextStyle(color: Colors.black)),
            hintText: "Please text your email",
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 94, 92, 88),
            ),
            prefixIcon: SizedBox(
              width: 0,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.email_sharp,
                  color: Colors.black,
                ),
              ),
            ),
          )),
    );
  }
}
