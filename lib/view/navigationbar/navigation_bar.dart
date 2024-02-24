import 'package:bake_n_cake_user_side/controller/navigatoion_controller.dart';
import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:bake_n_cake_user_side/view/cart/cart_page.dart';
import 'package:bake_n_cake_user_side/view/home/home_page.dart';
import 'package:bake_n_cake_user_side/view/profile/profile_page.dart';
import 'package:bake_n_cake_user_side/view/profile/profile_page_app_bar.dart';
import 'package:bake_n_cake_user_side/view/search/search_page.dart';
import 'package:bake_n_cake_user_side/view/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPage extends StatelessWidget {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle =
      const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  LandingPage({super.key});
  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: BottomNavigationBar(
            showUnselectedLabels: false,
            showSelectedLabels: false,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor:navigation,
            unselectedItemColor: Colors.white.withOpacity(0.5),
            selectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Obx(() => Icon(
                        Icons.home,
                        size: 20.0,
                        color: landingPageController.tabIndex.value == 0
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                      )),
                ),
                label: '',
                backgroundColor: navigation
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Obx(() => Icon(
                        Icons.search,
                        size: 20.0,
                        color: landingPageController.tabIndex.value == 1
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                      )),
                ),
                label: '',
                backgroundColor: navigation
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Obx(() => Icon(
                        Icons.shopping_cart,
                        size: 20.0,
                        color: landingPageController.tabIndex.value == 2
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                      )),
                ),
                label: '',
                backgroundColor: navigation
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Obx(() => Icon(
                        Icons.settings,
                        size: 20.0,
                        color: landingPageController.tabIndex.value == 3
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                      )),
                ),
                label: '',
                backgroundColor: navigation
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final LandingPageController landingPageController =
        Get.put(LandingPageController(), permanent: false);
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar:
          buildBottomNavigationMenu(context, landingPageController),
      body: Obx(
        () => IndexedStack(
          index: landingPageController.tabIndex.value,
          children:  [
            HomeScreen(),
            SearchPage(),
            CartPage(),
            Settings()
          ],
        ),
      ),
    ));
  }
}
