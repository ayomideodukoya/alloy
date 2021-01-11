import 'package:alloy/Screens/Card/cards_screen.dart';
import 'package:alloy/Screens/Home/home_screen.dart';
import 'package:alloy/Screens/Account/account_screen.dart';
import 'package:alloy/Screens/Transactions/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:alloy/constants.dart';

class PageNavigator extends StatefulWidget {
  @override
  _PageNavigatorState createState() => _PageNavigatorState();
}

class _PageNavigatorState extends State<PageNavigator> {

  // index for bottom nav bar
  int currentIndex = 0;

  PageController _pageController = PageController();

  List<Widget> _screens = [HomeScreen(), CardScreen(), TransactionScreen(), AccountScreen()];

  void _onPageChanged(int index){
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        onItemSelected: (index){
          setState(() {
            currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              activeColor: kPrimaryColor,
              inactiveColor: Colors.black
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.credit_card),
              title: Text('Cards'),
              activeColor: kPrimaryColor,
              inactiveColor: Colors.black
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.dashboard),
            title: Text('Transactions'),
            activeColor: kPrimaryColor,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('Account'),
              activeColor: kPrimaryColor,
              inactiveColor: Colors.black
          ),
        ],
      ),
    );
  }
}
