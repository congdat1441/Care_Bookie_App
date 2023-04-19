import 'package:flutter/material.dart';

import '../../../models/app_banner.dart';




class BannerItem extends StatelessWidget {
  final AppBanner appBanner;
  const BannerItem({Key? key, required this.appBanner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        //margin: const EdgeInsets.symmetric(horizontal: 1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(appBanner.thumbnailUrl),
              fit: BoxFit.fill,
            )),
        child: DefaultTextStyle(
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(0, 0, 0, 0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("data"),
                       SizedBox(
                        width: 200,
                        child: Text(
                          appBanner.title.toUpperCase(),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ]),
              )
            ],
          ),
        ));
  }
}