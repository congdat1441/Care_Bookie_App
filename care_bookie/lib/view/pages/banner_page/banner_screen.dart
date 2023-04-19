import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/tween_animation_builder.dart';
import '../../../models/app_banner.dart';
import 'banner_item.dart';

class BannerScreen extends StatefulWidget {
  const BannerScreen({super.key});

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  var _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        height: 150,
        decoration: const BoxDecoration(
            //color: Colors.orange[100],
            ),
        child: PageView.builder(
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          controller: PageController(viewportFraction: 0.75),
          itemCount: appBannerList.length,
          itemBuilder: (context, index) {
            var banner = appBannerList[index];
            var _scale = _selectedIndex == index ? 1.0 : 0.9;
            return TweenAnimationBuilder(
                duration: const Duration(milliseconds: 300),
                tween: Tween(begin: _scale, end: _scale),
                //curve: Curves.ease,
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: child,
                  );
                },
                child: BannerItem(
                  appBanner: banner,
                ));
          },
        ),
      ),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     ...List.generate(
      //         appBannerList.length,
      //         (index) =>
      //             Indicator(isActive: _selectedIndex == index ? true : false))
      //   ],
      // )
    ]);
  }
}
