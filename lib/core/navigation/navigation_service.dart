import 'package:flutter/widgets.dart';

class NavigationService {
  GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  Future<dynamic> navigateTo({required String name, dynamic arguments}) {
    return navigatorKey.currentState!.pushNamed(
      name,
      arguments: arguments,
    );
  }

  Future<dynamic> replaceRoute({required String name, dynamic arguments}) {
    return navigatorKey.currentState!.pushReplacementNamed(name);
  }

  pop() {
    if (navigatorKey.currentState!.canPop()) {
      return navigatorKey.currentState!.pop();
    }
  }

  popUntil(String name) {
    return navigatorKey.currentState!.popUntil(ModalRoute.withName(name));
  }

  Future<dynamic> navigateAndRemove({required String name, dynamic arguments}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      name,
      (route) => false,
      arguments: arguments,
    );
  }
}
