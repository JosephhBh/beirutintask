import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/reciever/view/home_page/home_page.dart';
import 'package:tipperapp/reciever/view/profile/profile_page.dart';
import 'package:tipperapp/widgets/icons/notification_icon.dart';
import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class ReceiverHomePage extends StatefulWidget {
  @override
  State<ReceiverHomePage> createState() => _ReceiverHomePageState();
}

class _ReceiverHomePageState extends State<ReceiverHomePage> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      HomePage(),
      ProfilePage(),
      GlobalScaffold(
        backgroundColor: appColor.greyColor,
        child: Center(
          child: GlobalText(
            text: "Screen 3",
            color: appColor.blackColor,
          ),
        ),
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: appColor.yellowColor,
        inactiveColorPrimary: appColor.greyColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.profile_circled),
        title: ("Profile"),
        activeColorPrimary: appColor.yellowColor,
        inactiveColorPrimary: appColor.greyColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.phone),
        title: ("Support"),
        activeColorPrimary: appColor.yellowColor,
        inactiveColorPrimary: appColor.greyColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor.whiteColor,
      extendBody: true,
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
        backgroundColor: appColor.transparentColor,
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.loose,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: PersistentTabView(
              context,
              controller: _controller,
              navBarHeight: setCurrentHeight(55),
              screens: _buildScreens(),
              items: _navBarsItems(),
              confineInSafeArea: true,
              backgroundColor: appColor.whiteColor,
              handleAndroidBackButtonPress: true,
              resizeToAvoidBottomInset: true,
              stateManagement: true,
              hideNavigationBarWhenKeyboardShows: true,
              decoration: NavBarDecoration(
                borderRadius: BorderRadius.circular(31.0),
                colorBehindNavBar: Colors.white,
              ),
              popAllScreensOnTapOfSelectedTab: true,
              popActionScreens: PopActionScreensType.all,
              itemAnimationProperties: ItemAnimationProperties(
                duration: Duration(milliseconds: 200),
                curve: Curves.ease,
              ),
              screenTransitionAnimation: ScreenTransitionAnimation(
                animateTabTransition: true,
                curve: Curves.easeInOut,
                duration: Duration(milliseconds: 200),
              ),
              navBarStyle: NavBarStyle.style6,
            ),
          ),
          applyPadding(
            31,
            360,
            0,
            0,
            NotificationIcon(),
          ),
        ],
      ),
    );
  }
}
