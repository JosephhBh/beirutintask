import 'package:flutter/material.dart';

enum AuthenticationType {
  Email,
  Phone,
}

class AuthenticationProvider extends ChangeNotifier {
  AuthenticationType _authenticationType = AuthenticationType.Email;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isEmailVerified = false;
  bool _isPasswordVerified = false;
  bool _isSignInButtonPressed = false;

  AuthenticationType get authenticationType => _authenticationType;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  bool get isEmailVerified => _isEmailVerified;
  bool get isPasswordVerified => _isPasswordVerified;
  bool get isSignInButtonPressed => _isSignInButtonPressed;

  void setEmailAuthenticationType() {
    _authenticationType = AuthenticationType.Email;
    notifyListeners();
  }

  void setPhoneAuthenticationType() {
    _authenticationType = AuthenticationType.Phone;
    notifyListeners();
  }
}
