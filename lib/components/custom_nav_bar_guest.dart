import 'package:after_school/screens/friend_feed/friend_feed_screen.dart';
import 'package:after_school/screens/homepages/homepage_screen.dart';
import 'package:after_school/screens/homepages/homepage_screen_2.dart';
import 'package:after_school/screens/map/map_screen.dart';
import 'package:after_school/screens/profile/profile_screen.dart';
import 'package:after_school/screens/pubs_list/pubs_list_screen.dart';
import 'package:after_school/screens/reset_password/reset_password_screen.dart';
import 'package:after_school/screens/user/user_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/events/events_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../screens/user/components/user.dart';

class CustomNavBarGuest extends StatelessWidget {
  final PersistentTabController _controller =
  PersistentTabController(initialIndex: 2);
//  User mainuser;

//  CustomNavBar({
//      required this.mainuser,
//  });

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
      NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [
      //HomePageScreen2(),
      FriendsFeedScreen(),
      EventsScreen(),
      MapScreen(),
      PubsScreen(),
      HomePageScreen2(),
      //UserScreen(),
      //ResetPasswordScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person_3_fill),
        title: ("Feed"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.calendar),
        title: ("Events"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          CupertinoIcons.map,
          color: CupertinoColors.white,
        ),
        title: ("Map"),
        activeColorPrimary: CupertinoColors.systemGrey,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.list_bullet),
        title: ("Pubs"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person_alt_circle),
        title: ("Log in"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
