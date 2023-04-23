import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/rendering.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import '../../../providers/bottom_navbar_provider.dart';
import '../account_page/account_page.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../favorite_page/favorite_page.dart';
import '../history_page/history_page.dart';
import '../main_pages/main_page.dart';
import '../schedule/schedule.dart';

class NavbarLayout extends StatefulWidget {
  final int index;
  const NavbarLayout({Key? key, required this.index}) : super(key: key);

  @override
  State<NavbarLayout> createState() => _NavbarLayoutState();
}

class _NavbarLayoutState extends State<NavbarLayout> {
  int _currentIndex = 0;
  bool visible = true;
  late BottomNavBarProvider _bottomNavBarProvider;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 10, fontWeight: FontWeight.w600);

  static final List<Widget> _widgetOptions = <Widget>[
    const MainPage(),
    const Schedule(),
    const HistoryPage(),
    const FavoritePage(),
    const AccountPage()
  ];

  @override
  void initState() {
    super.initState();
    _bottomNavBarProvider = context.read<BottomNavBarProvider>();
    _currentIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1500),
      curve: Curves.fastLinearToSlowEaseIn,
      height: visible ? kBottomNavigationBarHeight : 0,
      child: Scaffold(
        //backgroundColor: Colors.white,
        body: Stack(children: [
          Center(
            child: _widgetOptions.elementAt(_currentIndex),
          ),
          if (_bottomNavBarProvider.visible)
            Positioned(
              bottom: 15,
              left: 20,
              right: 20,
              child: SizedBox(
                height: 90,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      //end: Alignment.centerRight,
                      end: Alignment(0.9, 0.2),
                      colors: <Color>[
                        Color(0xFF237be5),
                        Color(0xFF1e81e7),
                        Color(0xFF1885ea),
                        Color(0xFF1589ec),
                        Color(0xFF118dee),
                        Color(0xFF0e8eef),
                        Color(0xFF0994f1),
                        Color(0xFF0697f3),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: GNav(
                      rippleColor: const Color(0xFF2b85e6),
                      hoverColor: const Color(0xFF2b85e6),
                      gap: 5,
                      activeColor: const Color(0xFFFAF1F1),
                      iconSize: 20,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      duration: const Duration(milliseconds: 600),
                      //tabBackgroundColor: Color(0xFF0697f3),
                      color: Colors.grey[100]!,
                      tabs: const [
                        GButton(
                          icon: FontAwesomeIcons.houseChimneyMedical,
                          text: 'Home',
                        ),
                        GButton(
                            icon: FontAwesomeIcons.wandMagicSparkles,
                            text: 'Schedule'),
                        GButton(
                          icon: FontAwesomeIcons.fileMedical,
                          text: 'History',
                        ),
                        GButton(
                          icon: IconlyBold.heart,
                          iconSize: 25,
                          text: 'Favorite',
                        ),
                        GButton(
                          icon: IconlyBold.profile,
                          iconSize: 25,
                          text: 'Profile',
                        ),
                      ],
                      selectedIndex: _currentIndex,
                      onTabChange: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),
                ),
              ),
            )
          else
            Container()
        ]),
      ),
    );
  }

  void hideNav() {
    _bottomNavBarProvider.visible = false;
  }

  void showNav() {
    _bottomNavBarProvider.visible = true;
  }
}
