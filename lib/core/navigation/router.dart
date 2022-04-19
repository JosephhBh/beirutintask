import 'package:flutter/material.dart';
import 'package:tipperapp/core/constants/route_names.dart';
import 'package:tipperapp/reciever/view/receiver_home_page.dart';
import 'package:tipperapp/root_page.dart';
import 'package:tipperapp/starting_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case kStartingScreen:
      return _fadeRoute(
        settings.name,
        StartingScreen(),
      );

    case kRootPage:
      return _fadeRoute(
        settings.name,
        RootPage(),
      );

    case kReceiverHomePage:
      return _fadeRoute(
        settings.name,
        ReceiverHomePage(),
      );

    default:
      return _errorRoute();
  }
}

Route<dynamic> _fadeRoute(var name, Widget widget) {
  return PageRouteBuilder(
    opaque: true,
    transitionDuration: Duration(milliseconds: 300),
    reverseTransitionDuration: Duration(milliseconds: 300),
    settings: RouteSettings(
      name: name,
    ),
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

Route<dynamic> _errorRoute() {
  // FirebaseAuth _auth = FirebaseAuth.instance;
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Navigation Error',
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Error check navigation option',
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  });
}
