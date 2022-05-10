import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:tipperapp/core/constants/route_names.dart';
import 'package:tipperapp/core/controller/provider/authenticaion_provider/authentication_provider.dart';
import 'package:tipperapp/core/controller/services/notification_service/notification_service.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/core/navigation/navigation_service.dart';
import 'package:tipperapp/locator.dart';
import 'package:tipperapp/reciever/view/receiver_home_page/receiver_home_page.dart';
import 'package:tipperapp/reciever/view/receiver_profile/receriver_profile_page.dart';
import 'package:tipperapp/reciever/view/receiver_support/receiver_support_page.dart';

import 'package:tipperapp/widgets/icons/notification_icon.dart';

class ReceiverRootPage extends StatefulWidget {
  @override
  State<ReceiverRootPage> createState() => _ReceiverRootPageState();
}

class _ReceiverRootPageState extends State<ReceiverRootPage> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      ReceiverHomePage(),
      ReceiverProfilePage(),
      ReceiverSupportPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: appColor.yellowColor,
        inactiveColorPrimary: appColor.greyColor,
        iconSize: setCurrentHeight(38),
        textStyle: GoogleFonts.fredokaOne(
          fontSize: setFontSize(10),
          letterSpacing: 0.4,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person_crop_circle_fill),
        title: ("Profile"),
        activeColorPrimary: appColor.yellowColor,
        inactiveColorPrimary: appColor.greyColor,
        iconSize: setCurrentHeight(42),
        contentPadding: 0,
        textStyle: GoogleFonts.fredokaOne(
          fontSize: setFontSize(10),
          letterSpacing: 0.4,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.phone),
        title: ("Support"),
        iconSize: setCurrentHeight(38),
        activeColorPrimary: appColor.yellowColor,
        inactiveColorPrimary: appColor.greyColor,
        textStyle: GoogleFonts.fredokaOne(
          fontSize: setFontSize(10),
          letterSpacing: 0.4,
        ),
      ),
    ];
  }

  final NotificationService _notificationService =
      locator<NotificationService>();

  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    var authenticaionProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
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
            child: MediaQuery.removePadding(
              context: context,
              removeBottom: true,
              removeLeft: true,
              removeRight: true,
              removeTop: true,
              child: PersistentTabView(
                context,
                controller: _controller,
                navBarHeight: setCurrentHeight(80),
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
                onItemSelected: (val) {
                  setState(() {});
                },
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
                navBarStyle: NavBarStyle.style8,
              ),
            ),
          ),
          applyPadding(
            31,
            360,
            0,
            0,
            Container(
                height: setCurrentHeight(35),
                width: setCurrentWidth(32),
                child: StreamBuilder(
                  stream: _notificationService.getReceiverNotifications(
                      authenticaionProvider.receiverModel.userId!),
                  builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return NotificationIcon(
                        color: appColor.darkBlueColor,
                      );
                    }
                    if (!snapshot.hasData) {
                      return NotificationIcon(
                        color: appColor.darkBlueColor,
                      );
                    }
                    var userDocument = snapshot.data;
                    // return Text(userDocument!["is_read"].toString());
                    return GestureDetector(
                      onTap: () async {
                        _navigationService.navigateTo(
                            name: kReceiverAllNotificationsPage);
                        if (!userDocument!["is_read"]) {
                          await _notificationService
                              .updateGlobalIsReadNotificationStatus(
                                  authenticaionProvider.receiverModel.userId!);
                        }
                      },
                      child: Stack(
                        fit: StackFit.loose,
                        children: [
                          NotificationIcon(
                            color: appColor.darkBlueColor,
                            size: 35,
                          ),
                          Visibility(
                            visible: !userDocument!["is_read"],
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: setCurrentWidth(1),
                              ),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  height: setCurrentHeight(10),
                                  width: setCurrentWidth(10),
                                  decoration: BoxDecoration(
                                      color: appColor.yellowColor,
                                      shape: BoxShape.circle),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
