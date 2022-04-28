// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:email_validator/email_validator.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:tipperapp/core/constants/route_names.dart';
// import 'package:tipperapp/core/device_utils/device_utils.dart';
// import 'package:tipperapp/reciever/model/reciever_model.dart';
// import 'package:tipperapp/tipper/model/tipper_model.dart';
// import 'package:tipperapp/core/navigation/navigation_service.dart';
// import 'package:tipperapp/locator.dart';

// enum AuthenticationType {
//   Email,
//   Phone,
// }

// enum UserType {
//   receiver,
//   tipper,
// }

// class AuthenticationProvider extends ChangeNotifier {
//   final NavigationService _navigationService = locator<NavigationService>();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   AuthenticationType _authenticationType = AuthenticationType.Email;
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   TextEditingController _phoneNumberController = TextEditingController();
//   bool _isEmailVerified = false;
//   bool _isPasswordVerified = false;
//   bool _isPhoneNumberVerified = false;
//   bool _canPressLogin = false;
//   bool _loading = false;
//   ReceiverModel _receiverModel = ReceiverModel();
//   TipperModel _tipperModel = TipperModel();
//   // TextEditingController _emiratesIdController = TextEditingController();
//   TextEditingController _tipperUsernameController = TextEditingController();
//   TextEditingController _tipperEmailAddressController = TextEditingController();
//   TextEditingController _tipperPhoneNumberController = TextEditingController();
//   TextEditingController _tipperPasswordController = TextEditingController();
//   TextEditingController _tipperConfirmPasswordController =
//       TextEditingController();

//   AuthenticationType get authenticationType => _authenticationType;
//   TextEditingController get emailController => _emailController;
//   TextEditingController get passwordController => _passwordController;
//   TextEditingController get phoneNumberController => _phoneNumberController;
//   bool get isEmailVerified => _isEmailVerified;
//   bool get isPasswordVerified => _isPasswordVerified;
//   bool get isPhoneNumberVerified => _isPhoneNumberVerified;
//   bool get canPressLogin => _canPressLogin;
//   bool get loading => _loading;
//   ReceiverModel get receiverModel => _receiverModel;
//   TipperModel get tipperModel => _tipperModel;
//   // TextEditingController get emiratesIdController => _emiratesIdController;
//   TextEditingController get tipperUsernameController =>
//       _tipperUsernameController;
//   TextEditingController get tipperEmailAddressController =>
//       _tipperEmailAddressController;
//   TextEditingController get tipperPhoneNumberController =>
//       _tipperPhoneNumberController;
//   TextEditingController get tipperPasswordController =>
//       _tipperPasswordController;
//   TextEditingController get tipperConfirmPasswordController =>
//       _tipperConfirmPasswordController;

//   updateTipperModel(TipperModel tipperModel) {
//     _tipperModel = tipperModel;
//     notifyListeners();
//   }

//   void setEmailAuthenticationType() {
//     _authenticationType = AuthenticationType.Email;
//     _phoneNumberController.clear();
//     errorMessageProvider.clearErrorMessage();
//     _canPressLogin = false;
//     notifyListeners();
//   }

//   void setPhoneAuthenticationType() {
//     _authenticationType = AuthenticationType.Phone;
//     _emailController.clear();
//     errorMessageProvider.clearErrorMessage();
//     _canPressLogin = false;
//     notifyListeners();
//   }

//   setIsEmailVerified(bool val) {
//     _isEmailVerified = val;
//     notifyListeners();
//   }

//   setIsPasswordVerified(bool val) {
//     _isPasswordVerified = val;
//     notifyListeners();
//   }

//   setIsPhoneNumberVerified(bool val) {
//     _isPhoneNumberVerified = val;
//     notifyListeners();
//   }

//   setCanPressLogin(bool val) {
//     _canPressLogin = val;
//     notifyListeners();
//   }

//   handleSignInButton() async {
//     print(_isEmailVerified);
//     print(_isPasswordVerified);
//     print(_canPressLogin);
//     notifyListeners();
//   }

//   signInWithEmailAndPassword() async {
//     try {
//       _loading = true;
//       notifyListeners();
//       if (_isEmailVerified && _isPasswordVerified) {
//         UserCredential result = await _auth.signInWithEmailAndPassword(
//           email: _emailController.text.trim(),
//           password: _passwordController.text.trim(),
//         );
//         if (result != null) {
//           await getUserDataOnSignIn(result.user!.uid);
//         } else {
//           /// TODO handle firebase error
//         }
//       }
//       if (!_isEmailVerified) {
//         _canPressLogin = true;
//       }
//       if (!_isPasswordVerified) {
//         _canPressLogin = true;
//       }
//       _loading = false;
//       print("the loading is $_loading");
//       notifyListeners();
//     } catch (e) {
//       print('sign in with email and password error : $e');
//     }
//   }

//   Future<String> getUserDataOnStartup(String uid) async {
//     try {
//       // User? _firebaseUser = _auth.currentUser;
//       var docUser =
//           await FirebaseFirestore.instance.collection("users").doc(uid);
//       var snapshot = await docUser.get();
//       if (snapshot.exists) {
//         print(snapshot.data());
//         Map<String, dynamic>? data = snapshot.data();
//         print("data is ${jsonEncode(data)}");
//         String user_type = data!['user_type'];
//         if (user_type == UserType.receiver.name) {
//           print("the user is ${user_type}");
//           _receiverModel = ReceiverModel.fromJson(data);
//         } else {
//           _tipperModel = TipperModel.fromJson(data);
//         }
//         return user_type;
//       } else {
//         // _loading = false;
//         // notifyListeners();
//         /// TODO handle document does not exist
//         return "";
//       }
//     } catch (e) {
//       print('get user data error $e');
//       return "";
//     }
//   }

//   getUserDataOnSignIn(String uid) async {
//     try {
//       var docUser =
//           await FirebaseFirestore.instance.collection("users").doc(uid);
//       var snapshot = await docUser.get();
//       if (snapshot.exists) {
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         await prefs.setString('uid', uid);
//         print(snapshot.data());
//         Map<String, dynamic>? data = snapshot.data();
//         print("data is ${jsonEncode(data)}");
//         String user_type = data!['user_type'];
//         if (user_type == UserType.receiver.name) {
//           print("the user is ${user_type}");
//           _receiverModel = ReceiverModel.fromJson(data);
//           notifyListeners();
//           _navigationService.navigateAndRemove(name: kReceiverRootPage);
//         } else {
//           _tipperModel = TipperModel.fromJson(data);
//           _navigationService.navigateAndRemove(name: kTipperRootPage);
//         }
//       } else {
//         // _loading = false;
//         // notifyListeners();
//         /// TODO handle document does not exist
//       }
//     } catch (e) {
//       print('get user data error $e');
//     }
//   }

//   signOut() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.remove('uid');
//     clearAuthenticationProvider();
//     await FirebaseAuth.instance.signOut();
//     _navigationService.navigateAndRemove(name: kRootPage);
//   }

//   //// Registration Tipper

//   bool validateRegistrationFields() {
//     bool valid = false;
//     // if (_emiratesIdController.text.length <= 2) {
//     //   errorMessageProvider.setErrorMessage(message: 'Invalid emirates id');
//     // }
//     // else
//     if (_tipperUsernameController.text.trim().length <= 2) {
//       errorMessageProvider.setErrorMessage(message: 'Invalid username');
//     } else if (!EmailValidator.validate(
//         _tipperEmailAddressController.text.trim())) {
//       errorMessageProvider.setErrorMessage(message: 'Invalid email');
//     } else if (_tipperPhoneNumberController.text.trim().length <= 6) {
//       errorMessageProvider.setErrorMessage(message: 'Invalid phone');
//     } else if (_tipperPasswordController.text.trim().length <= 6) {
//       errorMessageProvider.setErrorMessage(message: 'Invalid password');
//     } else if (_tipperConfirmPasswordController.text.trim().length <= 6) {
//       errorMessageProvider.setErrorMessage(message: 'Invalid password');
//     } else if (_tipperPasswordController.text.trim() !=
//         _tipperConfirmPasswordController.text.trim()) {
//       errorMessageProvider.setErrorMessage(message: "Password does not match");
//     } else {
//       valid = true;
//     }
//     return valid;
//   }

//   // final QuerySnapshot result = await FirebaseFirestore.instance
//   //           .collection('users')
//   //           .where('email', isEqualTo: _emailController.text.trim())
//   //           .limit(1)
//   //           .get();

//   registerTipper() async {
//     _loading = true;
//     notifyListeners();
//     bool isValid = validateRegistrationFields();
//     dynamic result = await PhoneNumberUtil.isValidNumber(
//         phoneNumber:
//             _tipperPhoneNumberController.text.trim().replaceAll(' ', ''),
//         isoCode: "AE");
//     if (result as bool == false) {
//       errorMessageProvider.setErrorMessage(message: "Enter valid phone number");
//     }
//     if (isValid && result) {

//       String finalTipperPhoneNumber =
//           '+971' + _tipperPhoneNumberController.text.replaceAll(' ', '');
//       print(finalTipperPhoneNumber);
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String userId = _firestore.collection('users').doc().id;
//       await _firestore.collection('users').doc(userId).set({
//         "user_id": userId,
//         // "emirates_id": _emiratesIdController.text.trim(),
//         "username": _tipperUsernameController.text.trim(),
//         "email": _tipperEmailAddressController.text.trim(),
//         "phone_number": finalTipperPhoneNumber,
//         "password": _tipperPasswordController.text.trim(),
//         "balance": 1320.5,
//         "user_type": "tipper",
//       });

//       await _firestore
//           .collection('users')
//           .doc(userId)
//           .collection('notifications')
//           .doc(userId)
//           .set({
//         "is_read": true,
//       });

//       await prefs.setString('uid', userId);
//       _navigationService.navigateAndRemove(name: kRootPage);
//     }
//     _loading = false;
//     notifyListeners();
//   }

//   signIn() async {
//     try {
//       if (_authenticationType == AuthenticationType.Email) {
//         if (!_isEmailVerified) {
//           errorMessageProvider.setErrorMessage(message: "Enter valid email");
//         } else if (!_isPasswordVerified) {
//           errorMessageProvider.setErrorMessage(
//               message: "Enter valid password min 6 char");
//         } else {
//           final QuerySnapshot result = await FirebaseFirestore.instance
//               .collection('users')
//               .where('email', isEqualTo: _emailController.text.trim())
//               .limit(1)
//               .get();
//           final List<DocumentSnapshot> documents = result.docs;
//           if (documents.length > 0) {
//             dynamic? data = documents[0].data();
//             print(data);
//             if (_passwordController.text.trim() == data['password']) {
//               // debugPrint(jsonEncode(data));
//               await getUserDataOnSignIn(data['user_id']);
//             } else {
//               errorMessageProvider.setErrorMessage(message: 'Wrong password');
//             }
//           } else {
//             errorMessageProvider.setErrorMessage(message: 'No user found');
//           }
//         }
//       } else {
//         if (!_isPhoneNumberVerified) {
//           errorMessageProvider.setErrorMessage(
//               message: "Enter valid phone number");
//         } else if (!_isPasswordVerified) {
//           errorMessageProvider.setErrorMessage(message: "Enter password");
//         } else {
//           String finalPhoneNumber =
//               '+971' + _phoneNumberController.text.replaceAll(' ', '');

//           final QuerySnapshot result = await FirebaseFirestore.instance
//               .collection('users')
//               .where('phone_number', isEqualTo: finalPhoneNumber)
//               .limit(1)
//               .get();
//           final List<DocumentSnapshot> documents = result.docs;
//           if (documents.length > 0) {
//             dynamic? data = documents[0].data();
//             print(data);
//             if (_passwordController.text.trim() == data['password']) {
//               // debugPrint(jsonEncode(data));
//               await getUserDataOnSignIn(data['user_id']);
//             } else {
//               // errorMessageProvider.setErrorMessage(message: 'Wrong password');
//               print(
//                   "the number is $finalPhoneNumber - ${_passwordController.text.trim()} -${data['password']}");
//             }
//           } else {
//             errorMessageProvider.setErrorMessage(message: 'No user found');
//           }
//         }
//       }
//     } catch (e) {
//       print('sign in error $e');
//     }
//   }

//   clearAuthenticationProvider() {
//     _authenticationType = AuthenticationType.Email;
//     _emailController.clear();
//     _passwordController.clear();
//     _phoneNumberController.clear();
//     _isEmailVerified = false;
//     _isPasswordVerified = false;
//     _isPhoneNumberVerified = false;
//     _canPressLogin = false;
//     _loading = false;
//     _receiverModel = ReceiverModel();
//     _tipperModel = TipperModel();
//     // _emiratesIdController = TextEditingController();
//     _tipperUsernameController = TextEditingController();
//     _tipperEmailAddressController.clear();
//     _tipperPhoneNumberController.clear();
//     _tipperPasswordController.clear();
//     _tipperConfirmPasswordController.clear();
//     notifyListeners();
//   }
// }

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
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
  TextEditingController _phoneNumberController = TextEditingController();
  bool _isEmailVerified = false;
  bool _isPasswordVerified = false;
  bool _isPhoneNumberVerified = false;
  bool _canPressLogin = false;
  bool _loading = false;
  ReceiverModel _receiverModel = ReceiverModel();
  TipperModel _tipperModel = TipperModel();
  // TextEditingController _emiratesIdController = TextEditingController();
  TextEditingController _tipperUsernameController = TextEditingController();
  TextEditingController _tipperEmailAddressController = TextEditingController();
  TextEditingController _tipperPhoneNumberController = TextEditingController();
  TextEditingController _tipperPasswordController = TextEditingController();
  TextEditingController _tipperConfirmPasswordController =
      TextEditingController();
  TextEditingController _editUsernameController = TextEditingController();
  TextEditingController _editPassController = TextEditingController();
  TextEditingController _editConfirmPassController = TextEditingController();

  AuthenticationType get authenticationType => _authenticationType;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get phoneNumberController => _phoneNumberController;
  bool get isEmailVerified => _isEmailVerified;
  bool get isPasswordVerified => _isPasswordVerified;
  bool get isPhoneNumberVerified => _isPhoneNumberVerified;
  bool get canPressLogin => _canPressLogin;
  bool get loading => _loading;
  ReceiverModel get receiverModel => _receiverModel;
  TipperModel get tipperModel => _tipperModel;
  // TextEditingController get emiratesIdController => _emiratesIdController;
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
  TextEditingController get editUsernameController => _editUsernameController;
  TextEditingController get editPassController => _editPassController;
  TextEditingController get editConfirmPassController =>
      _editConfirmPassController;

  clearEditFunction() {
    _editUsernameController.clear();
    _editPassController.clear();
    _editConfirmPassController.clear();
    notifyListeners();
  }

  updateTipperModel(TipperModel tipperModel) {
    _tipperModel = tipperModel;
    notifyListeners();
  }

  updateReciverModel(ReceiverModel receiverModel) {
    _receiverModel = receiverModel;
    notifyListeners();
  }

  void setEmailAuthenticationType() {
    _authenticationType = AuthenticationType.Email;
    _phoneNumberController.clear();
    errorMessageProvider.clearErrorMessage();
    _canPressLogin = false;
    notifyListeners();
  }

  void setPhoneAuthenticationType() {
    _authenticationType = AuthenticationType.Phone;
    _emailController.clear();
    errorMessageProvider.clearErrorMessage();
    _canPressLogin = false;
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

  setIsPhoneNumberVerified(bool val) {
    _isPhoneNumberVerified = val;
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
    clearAuthenticationProvider();
    await FirebaseAuth.instance.signOut();
    _navigationService.navigateAndRemove(name: kRootPage);
  }

  //// Registration Tipper

  bool validateRegistrationFields() {
    bool valid = false;
    // if (_emiratesIdController.text.length <= 2) {
    //   errorMessageProvider.setErrorMessage(message: 'Invalid emirates id');
    // }
    // else
    if (_tipperUsernameController.text.trim().length <= 2) {
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

  // final QuerySnapshot result = await FirebaseFirestore.instance
  //           .collection('users')
  //           .where('email', isEqualTo: _emailController.text.trim())
  //           .limit(1)
  //           .get();

  registerTipper() async {
    try {
      _loading = true;
      notifyListeners();
      bool emailExist = false;
      bool usernameExist = false;
      bool phoneExist = false;
      bool isValid = validateRegistrationFields();
      dynamic result = await PhoneNumberUtil.isValidNumber(
          phoneNumber:
              _tipperPhoneNumberController.text.trim().replaceAll(' ', ''),
          isoCode: "AE");
      if (result as bool == false) {
        errorMessageProvider.setErrorMessage(
            message: "Enter valid phone number");
      }
      if (isValid && result) {
        /// check if email exist
        final QuerySnapshot emailResult = await FirebaseFirestore.instance
            .collection('users')
            .where('email',
                isEqualTo: _tipperEmailAddressController.text.trim())
            .limit(1)
            .get();
        final List<DocumentSnapshot> emailDocs = emailResult.docs;
        if (emailDocs.length > 0) {
          emailExist = true;
          errorMessageProvider.setErrorMessage(message: "Email already exist");
        }

        /// check if username exist
        if (!emailExist) {
          final QuerySnapshot usernameResult = await FirebaseFirestore.instance
              .collection('users')
              .where('username',
                  isEqualTo: _tipperUsernameController.text.trim())
              .limit(1)
              .get();
          final List<DocumentSnapshot> usernameDocs = usernameResult.docs;
          if (usernameDocs.length > 0) {
            usernameExist = true;
            errorMessageProvider.setErrorMessage(
                message: "Username already exist");
          }
        }
        String finalTipperPhoneNumber =
            '+971' + _tipperPhoneNumberController.text.replaceAll(' ', '');

        /// check if phoneNumber exist
        if (!emailExist && !usernameExist) {
          final QuerySnapshot phoneResults = await FirebaseFirestore.instance
              .collection('users')
              .where("user_type", isEqualTo: UserType.tipper.name)
              .where('phone_number', isEqualTo: finalTipperPhoneNumber)
              .limit(1)
              .get();
          final List<DocumentSnapshot> phoneDocs = phoneResults.docs;
          if (phoneDocs.length > 0) {
            phoneExist = true;
            errorMessageProvider.setErrorMessage(
                message: "Phone number already exist");
          }
        }

        if (!emailExist && !usernameExist && !phoneExist) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String userId = _firestore.collection('users').doc().id;
          await _firestore.collection('users').doc(userId).set({
            "user_id": userId,
            // "emirates_id": _emiratesIdController.text.trim(),
            "username": _tipperUsernameController.text.trim(),
            "email": _tipperEmailAddressController.text.trim(),
            "phone_number": finalTipperPhoneNumber,
            "password": _tipperPasswordController.text.trim(),
            "balance": 1320.5,
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

          await _firestore
              .collection('users')
              .doc(userId)
              .collection('transactions')
              .doc(userId)
              .set({
            "have_transaction": false,
          });

          await prefs.setString('uid', userId);
          _navigationService.navigateAndRemove(name: kRootPage);
        }
      }
      _loading = false;
      notifyListeners();
    } catch (e) {
      _loading = false;
      notifyListeners();
      errorMessageProvider.setSomethingWentWrrongMessage();
    }
  }

  signIn() async {
    try {
      _loading = true;
      notifyListeners();
      if (_authenticationType == AuthenticationType.Email) {
        if (!_isEmailVerified) {
          errorMessageProvider.setErrorMessage(message: "Enter valid email");
        } else if (!_isPasswordVerified) {
          errorMessageProvider.setErrorMessage(
              message: "Enter valid password min 6 char");
        } else {
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
        }
      } else {
        if (!_isPhoneNumberVerified) {
          errorMessageProvider.setErrorMessage(
              message: "Enter valid phone number");
        } else if (!_isPasswordVerified) {
          errorMessageProvider.setErrorMessage(message: "Enter password");
        } else {
          String finalPhoneNumber =
              '+971' + _phoneNumberController.text.replaceAll(' ', '');

          final QuerySnapshot result = await FirebaseFirestore.instance
              .collection('users')
              .where('phone_number', isEqualTo: finalPhoneNumber)
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
              // errorMessageProvider.setErrorMessage(message: 'Wrong password');
              print(
                  "the number is $finalPhoneNumber - ${_passwordController.text.trim()} -${data['password']}");
            }
          } else {
            errorMessageProvider.setErrorMessage(message: 'No user found');
          }
        }
      }
      _loading = false;
      notifyListeners();
    } catch (e) {
      _loading = false;
      notifyListeners();
      print('sign in error $e');
    }
  }

  updateTipperProfile() async {
    try {
      errorMessageProvider.clearErrorMessage();
      _loading = true;
      notifyListeners();
      // if(_editPassController.text.trim() == _editConfirmPassController.text.trim())

      if (_editUsernameController.text.trim().length <= 2) {
        errorMessageProvider.setErrorMessage(message: 'Invalid username');
      } else if (_editPassController.text.trim() !=
          _editConfirmPassController.text.trim()) {
        errorMessageProvider.setErrorMessage(
            message: 'Password does not match');
      } else if (_editPassController.text.trim() ==
              _editConfirmPassController.text.trim() &&
          _editPassController.text.trim().length < 6 &&
          _editPassController.text.trim().length != 0) {
        errorMessageProvider.setErrorMessage(message: "At leaset 6 characters");
      } else {
        if (_editUsernameController.text.trim() != _tipperModel.username) {
          bool usernameExist = false;
          final QuerySnapshot usernameResult = await FirebaseFirestore.instance
              .collection('users')
              .where('username', isEqualTo: _editUsernameController.text.trim())
              .limit(1)
              .get();
          final List<DocumentSnapshot> usernameDocs = usernameResult.docs;
          if (usernameDocs.length > 0) {
            usernameExist = true;
            errorMessageProvider.setErrorMessage(
                message: "Username already exist");
          } else {
            await _firestore
                .collection('users')
                .doc(_tipperModel.userId)
                .update({
              "username": _editUsernameController.text.trim(),
            });
            updateTipperModel(_tipperModel.copyWith(
              username: _editUsernameController.text.trim(),
            ));
            if (_editPassController.text.trim() ==
                    _editConfirmPassController.text.trim() &&
                _editPassController.text.trim().length >= 6) {
              await _firestore
                  .collection('users')
                  .doc(_tipperModel.userId)
                  .update({
                "password": _editPassController.text.trim(),
              });
              updateTipperModel(_tipperModel.copyWith(
                password: _editPassController.text.trim(),
              ));
            }

            _navigationService.pop();
            clearEditFunction();
          }
        } else {
          if (_editPassController.text.trim() ==
                  _editConfirmPassController.text.trim() &&
              _editPassController.text.trim().length >= 6) {
            await _firestore
                .collection('users')
                .doc(_tipperModel.userId)
                .update({
              "password": _editPassController.text.trim(),
            });
            updateTipperModel(_tipperModel.copyWith(
              password: _editPassController.text.trim(),
            ));
            _navigationService.pop();
            clearEditFunction();
          }
        }
      }

      _loading = false;
      notifyListeners();
    } catch (e) {
      print("update user error $e");
      _loading = false;
      notifyListeners();
      errorMessageProvider.setSomethingWentWrrongMessage();
    }
  }

  updateReciverProfile() async {
    try {
      errorMessageProvider.clearErrorMessage();
      _loading = true;
      notifyListeners();
      // if(_editPassController.text.trim() == _editConfirmPassController.text.trim())

      if (_editUsernameController.text.trim().length <= 2) {
        errorMessageProvider.setErrorMessage(message: 'Invalid username');
      } else if (_editPassController.text.trim() !=
          _editConfirmPassController.text.trim()) {
        errorMessageProvider.setErrorMessage(
            message: 'Password does not match');
      } else if (_editPassController.text.trim() ==
              _editConfirmPassController.text.trim() &&
          _editPassController.text.trim().length < 6 &&
          _editPassController.text.trim().length != 0) {
        errorMessageProvider.setErrorMessage(message: "At leaset 6 characters");
      } else {
        if (_editUsernameController.text.trim() != _receiverModel.username) {
          bool usernameExist = false;
          final QuerySnapshot usernameResult = await FirebaseFirestore.instance
              .collection('users')
              .where('username', isEqualTo: _editUsernameController.text.trim())
              .limit(1)
              .get();
          final List<DocumentSnapshot> usernameDocs = usernameResult.docs;
          if (usernameDocs.length > 0) {
            usernameExist = true;
            errorMessageProvider.setErrorMessage(
                message: "Username already exist");
          } else {
            await _firestore
                .collection('users')
                .doc(_receiverModel.userId)
                .update({
              "username": _editUsernameController.text.trim(),
            });
            updateReciverModel(_receiverModel.copyWith(
              username: _editUsernameController.text.trim(),
            ));
            if (_editPassController.text.trim() ==
                    _editConfirmPassController.text.trim() &&
                _editPassController.text.trim().length >= 6) {
              await _firestore
                  .collection('users')
                  .doc(_receiverModel.userId)
                  .update({
                "password": _editPassController.text.trim(),
              });
              updateReciverModel(_receiverModel.copyWith(
                password: _editPassController.text.trim(),
              ));
            }

            _navigationService.pop();
            clearEditFunction();
          }
        } else {
          if (_editPassController.text.trim() ==
                  _editConfirmPassController.text.trim() &&
              _editPassController.text.trim().length >= 6) {
            print(_receiverModel.userId);
            await _firestore
                .collection('users')
                .doc(_receiverModel.userId)
                .update({
              "password": _editPassController.text.trim(),
            });
            updateReciverModel(_receiverModel.copyWith(
              password: _editPassController.text.trim(),
            ));
            _navigationService.pop();
            clearEditFunction();
          }
        }
      }

      _loading = false;
      notifyListeners();
    } catch (e) {
      print("update user error $e");
      _loading = false;
      notifyListeners();
      errorMessageProvider.setSomethingWentWrrongMessage();
    }
  }

  clearAuthenticationProvider() {
    _authenticationType = AuthenticationType.Email;
    _emailController.clear();
    _passwordController.clear();
    _phoneNumberController.clear();
    _isEmailVerified = false;
    _isPasswordVerified = false;
    _isPhoneNumberVerified = false;
    _canPressLogin = false;
    _loading = false;
    _receiverModel = ReceiverModel();
    _tipperModel = TipperModel();
    // _emiratesIdController = TextEditingController();
    _tipperUsernameController = TextEditingController();
    _tipperEmailAddressController.clear();
    _tipperPhoneNumberController.clear();
    _tipperPasswordController.clear();
    _tipperConfirmPasswordController.clear();
    _editUsernameController.clear();
    _editPassController.clear();
    _editConfirmPassController.clear();
    notifyListeners();
  }
}
