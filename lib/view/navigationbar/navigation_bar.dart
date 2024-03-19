import 'package:flutter/material.dart';
import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:bake_n_cake_user_side/view/cart/cart_page.dart';
import 'package:bake_n_cake_user_side/view/home/home_page.dart';
import 'package:bake_n_cake_user_side/view/search/search_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:bake_n_cake_user_side/view/settings/settings_page_edit.dart';


class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _page = 0;

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _page,
        height: 50.0,
        items: <Widget>  [
          Icon(Icons.home, size: 30),
          Icon(Icons.search, size: 30),
          Icon(Icons.shopping_cart, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        color: navigation,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: buildBody()


    );
  }

    Widget buildBody() {
    switch (_page) {
      case 0:
        return HomeScreen();
      case 1:
        return SearchPage();
      case 2:
        return CartPage();
      case 3:
        return Settings();
      default:
        return Container();
    }
  }

}
