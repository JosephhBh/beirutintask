import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tipperapp/core/constants/route_names.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/reciever/model/reciever_model.dart';
import 'package:tipperapp/tipper/model/tipper_model.dart';
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
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  AuthenticationType _authenticationType = AuthenticationType.Email;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isEmailVerified = false;
  bool _isPasswordVerified = false;
  bool _canPressLogin = false;
  bool _loading = false;
  ReceiverModel _receiverModel = ReceiverModel();
  TipperModel _tipperModel = TipperModel();
  TextEditingController _emiratesIdController = TextEditingController();
  TextEditingController _tipperUsernameController = TextEditingController();
  TextEditingController _tipperEmailAddressController = TextEditingController();
  TextEditingController _tipperPhoneNumberController = TextEditingController();
  TextEditingController _tipperPasswordController = TextEditingController();
  TextEditingController _tipperConfirmPasswordController =
      TextEditingController();

  AuthenticationType get authenticationType => _authenticationType;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  bool get isEmailVerified => _isEmailVerified;
  bool get isPasswordVerified => _isPasswordVerified;
  bool get canPressLogin => _canPressLogin;
  bool get loading => _loading;
  ReceiverModel get receiverModel => _receiverModel;
  TipperModel get tipperModel => _tipperModel;
  TextEditingController get emiratesIdController => _emiratesIdController;
  TextEditingController get tipperUsernameController =>
      _tipperUsernameController;
  TextEditingController get tipperEmailAddressController =>
      _tipperEmailAddressController;
  TextEditingController get tipperPhoneNumberController =>
      _tipperPhoneNumberController;
  TextEditingController get tipperPasswordController =>
      _tipperPasswordController;
  TextEditingController get tipperConfirmPasswordController =>
      _tipperConfirmPasswordController;

  updateTipperModel(TipperModel tipperModel) {
    _tipperModel = tipperModel;
    notifyListeners();
  }

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

  Future<String> getUserDataOnStartup(String uid) async {
    try {
      // User? _firebaseUser = _auth.currentUser;
      var docUser =
          await FirebaseFirestore.instance.collection("users").doc(uid);
      var snapshot = await docUser.get();
      if (snapshot.exists) {
        print(snapshot.data());
        Map<String, dynamic>? data = snapshot.data();
        print("data is ${jsonEncode(data)}");
        String user_type = data!['user_type'];
        if (user_type == UserType.receiver.name) {
          print("the user is ${user_type}");
          _receiverModel = ReceiverModel.fromJson(data);
        } else {
          _tipperModel = TipperModel.fromJson(data);
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
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('uid', uid);
        print(snapshot.data());
        Map<String, dynamic>? data = snapshot.data();
        print("data is ${jsonEncode(data)}");
        String user_type = data!['user_type'];
        if (user_type == UserType.receiver.name) {
          print("the user is ${user_type}");
          _receiverModel = ReceiverModel.fromJson(data);
          notifyListeners();
          _navigationService.navigateAndRemove(name: kReceiverRootPage);
        } else {
          _tipperModel = TipperModel.fromJson(data);
          _navigationService.navigateAndRemove(name: kTipperRootPage);
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

  signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('uid');
    await FirebaseAuth.instance.signOut();
    _navigationService.navigateAndRemove(name: kRootPage);
  }

  //// Registration Tipper

  bool validateRegistrationFields() {
    bool valid = false;
    if (_emiratesIdController.text.length <= 2) {
      errorMessageProvider.setErrorMessage(message: 'Invalid emirates id');
    } else if (_tipperUsernameController.text.trim().length <= 2) {
      errorMessageProvider.setErrorMessage(message: 'Invalid username');
    } else if (!EmailValidator.validate(
        _tipperEmailAddressController.text.trim())) {
      errorMessageProvider.setErrorMessage(message: 'Invalid email');
    } else if (_tipperPhoneNumberController.text.trim().length <= 6) {
      errorMessageProvider.setErrorMessage(message: 'Invalid phone');
    } else if (_tipperPasswordController.text.trim().length <= 6) {
      errorMessageProvider.setErrorMessage(message: 'Invalid password');
    } else if (_tipperConfirmPasswordController.text.trim().length <= 6) {
      errorMessageProvider.setErrorMessage(message: 'Invalid password');
    } else if (_tipperPasswordController.text.trim() !=
        _tipperConfirmPasswordController.text.trim()) {
      errorMessageProvider.setErrorMessage(message: "Password does not match");
    } else {
      valid = true;
    }
    return valid;
  }

  registerTipper() async {
    _loading = true;
    notifyListeners();
    bool isValid = validateRegistrationFields();
    if (isValid) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String userId = _firestore.collection('users').doc().id;
      await _firestore.collection('users').doc(userId).set({
        "user_id": userId,
        "emirates_id": _emiratesIdController.text.trim(),
        "username": _tipperUsernameController.text.trim(),
        "email": _tipperEmailAddressController.text.trim(),
        "phone_number": _tipperPhoneNumberController.text.trim(),
        // "password": _tipperPasswordController.text.trim(),
        "balance": 100,
        "user_type": "tipper",
      });

      await _firestore
          .collection('users')
          .doc(userId)
          .collection('notifications')
          .doc(userId)
          .set({
        "is_read": true,
      });

      await prefs.setString('uid', userId);
      _navigationService.navigateAndRemove(name: kRootPage);
    }
    _loading = false;
    notifyListeners();
  }

  signIn() async {
    try {
      if (_authenticationType == AuthenticationType.Email) {
        final QuerySnapshot result = await FirebaseFirestore.instance
            .collection('users')
            .where('email', isEqualTo: _emailController.text.trim())
            .limit(1)
            .get();
        final List<DocumentSnapshot> documents = result.docs;
        if (documents.length > 0) {
          dynamic? data = documents[0].data();
          print(data);
          if (_passwordController.text.trim() == data['password']) {
            // debugPrint(jsonEncode(data));
            await getUserDataOnSignIn(data['user_id']);
          } else {
            errorMessageProvider.setErrorMessage(message: 'Wrong password');
          }
        } else {
          errorMessageProvider.setErrorMessage(message: 'No user found');
        }
      } else {
        /// TODO handle phone sign in
      }
    } catch (e) {
      print('sign in error $e');
    }
  }
}
