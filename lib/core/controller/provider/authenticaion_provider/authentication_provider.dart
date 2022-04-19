import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tipperapp/core/constants/route_names.dart';
import 'package:tipperapp/core/model/reciever_model.dart';
import 'package:tipperapp/core/model/tipper_model.dart';
import 'package:tipperapp/core/navigation/navigation_service.dart';
import 'package:tipperapp/locator.dart';

enum AuthenticationType {
  Email,
  Phone,
}

enum UserType {
  receiver,
  tipper,
}

class AuthenticationProvider extends ChangeNotifier {
  final NavigationService _navigationService = locator<NavigationService>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthenticationType _authenticationType = AuthenticationType.Email;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isEmailVerified = false;
  bool _isPasswordVerified = false;
  bool _canPressLogin = false;
  bool _loading = false;
  ReceiverModel _receiverModel = ReceiverModel();

  AuthenticationType get authenticationType => _authenticationType;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  bool get isEmailVerified => _isEmailVerified;
  bool get isPasswordVerified => _isPasswordVerified;
  bool get canPressLogin => _canPressLogin;
  bool get loading => _loading;
  ReceiverModel get receiverModel => _receiverModel;

  void setEmailAuthenticationType() {
    _authenticationType = AuthenticationType.Email;
    notifyListeners();
  }

  void setPhoneAuthenticationType() {
    _authenticationType = AuthenticationType.Phone;
    notifyListeners();
  }

  setIsEmailVerified(bool val) {
    _isEmailVerified = val;
    notifyListeners();
  }

  setIsPasswordVerified(bool val) {
    _isPasswordVerified = val;
    notifyListeners();
  }

  setCanPressLogin(bool val) {
    _canPressLogin = val;
    notifyListeners();
  }

  handleSignInButton() async {
    print(_isEmailVerified);
    print(_isPasswordVerified);
    print(_canPressLogin);
    notifyListeners();
  }

  signInWithEmailAndPassword() async {
    try {
      _loading = true;
      notifyListeners();
      if (_isEmailVerified && _isPasswordVerified) {
        UserCredential result = await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        if (result != null) {
          await getUserDataOnSignIn(result.user!.uid);
        } else {
          /// TODO handle firebase error
        }
      }
      if (!_isEmailVerified) {
        _canPressLogin = true;
      }
      if (!_isPasswordVerified) {
        _canPressLogin = true;
      }
      _loading = false;
      print("the loading is $_loading");
      notifyListeners();
    } catch (e) {
      print('sign in with email and password error : $e');
    }
  }

  Future<String> getUserDataOnStartup() async {
    try {
      User? _firebaseUser = _auth.currentUser;
      var docUser = await FirebaseFirestore.instance
          .collection("users")
          .doc(_firebaseUser!.uid);
      var snapshot = await docUser.get();
      if (snapshot.exists) {
        print(snapshot.data());
        Map<String, dynamic>? data = snapshot.data();
        // print("data is ${jsonEncode(data)}");
        String user_type = data!['user_type'];
        if (user_type == UserType.receiver.name) {
          print("the user is ${user_type}");
          _receiverModel = ReceiverModel.fromJson(data);
        }
        return user_type;
      } else {
        // _loading = false;
        // notifyListeners();
        /// TODO handle document does not exist
        return "";
      }
    } catch (e) {
      print('get user data error $e');
      return "";
    }
  }

  getUserDataOnSignIn(String uid) async {
    try {
      var docUser =
          await FirebaseFirestore.instance.collection("users").doc(uid);
      var snapshot = await docUser.get();
      if (snapshot.exists) {
        print(snapshot.data());
        Map<String, dynamic>? data = snapshot.data();
        // print("data is ${jsonEncode(data)}");
        String user_type = data!['user_type'];
        if (user_type == UserType.receiver.name) {
          print("the user is ${user_type}");
          _receiverModel = ReceiverModel.fromJson(data);
          notifyListeners();
          _navigationService.navigateTo(name: kReceiverHomePage);
        }
      } else {
        // _loading = false;
        // notifyListeners();
        /// TODO handle document does not exist
      }
    } catch (e) {
      print('get user data error $e');
    }
  }
}
