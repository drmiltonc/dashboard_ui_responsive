import 'package:dashboard_ui_responsive/account_settings.dart';
import 'package:dashboard_ui_responsive/analytics.dart';
import 'package:dashboard_ui_responsive/cart.dart';
import 'package:dashboard_ui_responsive/orders.dart';
import 'package:dashboard_ui_responsive/payphone.dart';
import 'package:dashboard_ui_responsive/profile.dart';
import 'package:flutter/material.dart';

import 'logout.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int screenIndex = 0;
  late bool showNavigationDrawer;

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      screenIndex = selectedScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      ),
      drawer: NavigationDrawer(
          selectedIndex: screenIndex,
          onDestinationSelected: (int index) {
            setState(() {
              screenIndex = index;
            });
          },
          children: const [
            DrawerHeader(child: Center(child: Text('name@gmail.com'))),
            NavigationDrawerDestination(icon: Icon(Icons.person_2_rounded), label: Text('Profile')),
            NavigationDrawerDestination(icon: Icon(Icons.settings), label: Text('Account Settings')),
            NavigationDrawerDestination(icon: Icon(Icons.shopping_cart_checkout_rounded),label: Text('Cart')),
            NavigationDrawerDestination(icon: Icon(Icons.list_alt_rounded), label: Text('Orders')),
            NavigationDrawerDestination(icon: Icon(Icons.analytics_rounded), label: Text('Analytics')),
            NavigationDrawerDestination(icon: Icon(Icons.money_off_csred_outlined), label: Text('PayPhone')),
            NavigationDrawerDestination(icon: Icon(Icons.logout_rounded), label: Text('Logout')),
          ]),
      body: const [
        Profile(),
        AccountSettings(),
        Cart(),
        Orders(),
        Analytics(),
        PayPhoneView(),
        Logout(),
      ][screenIndex],
    );
  }
}
