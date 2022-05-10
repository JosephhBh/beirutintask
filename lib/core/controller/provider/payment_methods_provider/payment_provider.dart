import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:provider/provider.dart';
import 'package:tipperapp/core/constants/route_names.dart';
import 'package:tipperapp/core/controller/provider/authenticaion_provider/authentication_provider.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/core/navigation/navigation_service.dart';
import 'package:tipperapp/locator.dart';
import 'package:tipperapp/tipper/model/selected_paymen_details.dart';

// enum PaymentMethod { none, card, apple, google }

enum SelectedPaymentMethod {
  none,
  card,
  hsbc,
  apple,
  google,
}

class PaymentProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final NavigationService _navigationService = locator<NavigationService>();

  bool _isLoading = false;
  // PaymentMethod _currentPaymentMethod = PaymentMethod.none;
  SelectedPaymentMethod _selectedPaymentMethod = SelectedPaymentMethod.card;
  MaskedTextController _cardNumberController =
      MaskedTextController(mask: "0000 0000 0000 0000");
  TextEditingController _cardHolderNameController = TextEditingController();
  TextEditingController _cvcController = TextEditingController();
  MaskedTextController _expiryDateController =
      MaskedTextController(mask: "00 / 00");
  TextEditingController _amountController = TextEditingController(text: "50");
  TextEditingController _bankAccountHolderController = TextEditingController();
  TextEditingController _ibanNumberController = TextEditingController();
  bool _isConfirmIbanPressed = false;
  bool _isNameValid = false;
  bool _isCardValid = false;
  bool _isDateValid = false;
  bool _isCVCValid = false;
  bool _isAmountValid = true;
  SelectedPaymentDetailsModel _selectedPaymentDetailsModel =
      SelectedPaymentDetailsModel();

  bool get isLoading => _isLoading;
  // PaymentMethod get currentPaymentMethod => _currentPaymentMethod;
  SelectedPaymentMethod get selectedPaymentMethod => _selectedPaymentMethod;
  MaskedTextController get cardNumberController => _cardNumberController;
  TextEditingController get cardHolderNameController =>
      _cardHolderNameController;
  TextEditingController get cvcController => _cvcController;
  MaskedTextController get expiryDateController => _expiryDateController;
  TextEditingController get amountController => _amountController;
  TextEditingController get ibanNumberController => _ibanNumberController;
  TextEditingController get bankAccountHolderController =>
      _bankAccountHolderController;

  bool get isConfirmIbanPressed => _isConfirmIbanPressed;
  bool get isNameValid => _isNameValid;
  bool get isCardValid => _isCardValid;
  bool get isDateValid => _isDateValid;
  bool get isCVCValid => _isCVCValid;
  bool get isAmountValid => _isAmountValid;
  SelectedPaymentDetailsModel get selectedPaymentDetailsModel =>
      _selectedPaymentDetailsModel;

  setIsAmountValid(bool val) {
    _isAmountValid = val;
    notifyListeners();
  }

  setPaymentMethod(SelectedPaymentMethod paymentMethod) {
    _selectedPaymentMethod = paymentMethod;
    notifyListeners();
  }

  setCardPaymentMethod() {
    // if (_selectedPaymentMethod == SelectedPaymentMethod.card) {
    //   _selectedPaymentMethod = SelectedPaymentMethod.none;
    // } else {
    //   _selectedPaymentMethod = SelectedPaymentMethod.card;
    // }
    _selectedPaymentMethod = SelectedPaymentMethod.card;
    notifyListeners();
  }

  setHSBCPaymentMethod() {
    if (_selectedPaymentMethod == SelectedPaymentMethod.hsbc) {
      _selectedPaymentMethod = SelectedPaymentMethod.card;
    } else {
      _selectedPaymentMethod = SelectedPaymentMethod.hsbc;
    }
    notifyListeners();
  }

  setAppltPaymentMethod() {
    if (_selectedPaymentMethod == SelectedPaymentMethod.apple) {
      _selectedPaymentMethod = SelectedPaymentMethod.none;
    } else {
      _selectedPaymentMethod = SelectedPaymentMethod.apple;
    }
    notifyListeners();
  }

  setGooglePaymentMethod() {
    if (_selectedPaymentMethod == SelectedPaymentMethod.google) {
      _selectedPaymentMethod = SelectedPaymentMethod.none;
    } else {
      _selectedPaymentMethod = SelectedPaymentMethod.google;
    }
    notifyListeners();
  }

  setIsNameValid(bool val) {
    _isNameValid = val;
    notifyListeners();
  }

  setIsCardValid(bool val) {
    _isCardValid = val;
    notifyListeners();
  }

  setIsDateValid(bool val) {
    _isDateValid = val;
    notifyListeners();
  }

  setIsCVCValid(bool val) {
    _isCVCValid = val;
    notifyListeners();
  }

  setSelectedPaymentDetails(
      SelectedPaymentDetailsModel selectedPaymentDetailsModel) {
    _selectedPaymentDetailsModel = selectedPaymentDetailsModel;
    notifyListeners();
  }

  clearCardDetails() {
    _selectedPaymentDetailsModel = SelectedPaymentDetailsModel();
    notifyListeners();
  }

  clearBankAccountDetails() {
    _bankAccountHolderController.clear();
    _ibanNumberController.clear();
    _isConfirmIbanPressed = false;
    notifyListeners();
  }

  bool validatePaymentFields() {
    bool valid = true;
    if (!_isNameValid) {
      errorMessageProvider.setErrorMessage(message: "Enter valid name");
      valid = false;
    } else if (!_isCardValid) {
      errorMessageProvider.setErrorMessage(message: "Enter valid card");
      valid = false;
    } else if (!_isDateValid) {
      errorMessageProvider.setErrorMessage(message: "Enter valid date");
      valid = false;
    } else if (!_isCVCValid) {
      errorMessageProvider.setErrorMessage(message: "Enter valid cvc");
      valid = false;
    }
    // else if (!_isAmountValid || _amountController.text.length == 0) {
    //   errorMessageProvider.setErrorMessage(message: "Enter valid amount");
    //   valid = false;
    // }
    return valid;
  }

  updateBankAccountDetails() {
    if (_bankAccountHolderController.text.trim().length == 0) {
      errorMessageProvider.setErrorMessage(message: "Enter valid name");
    } else if (_ibanNumberController.text.trim().length == 0) {
      errorMessageProvider.setErrorMessage(message: "Enter valid iban number");
    } else {
      _isConfirmIbanPressed = true;
      notifyListeners();
      _navigationService.pop();
    }
  }

  updateCardInfo() async {
    try {
      _isLoading = true;
      notifyListeners();

      bool isValid = validatePaymentFields();
      if (isValid) {
        // dynamic addedAmount = _amountController.text.trim().length == 0
        //     ? "100"
        //     : _amountController.text.trim();
        // dynamic finalBalance = authenticationProvider.tipperModel.balance +
        //     double.tryParse(addedAmount);
        // await _firestore
        //     .collection("users")
        //     .doc(authenticationProvider.tipperModel.userId)
        //     .update({
        //   "balance": finalBalance,
        // });
        // authenticationProvider
        //     .updateTipperModel(authenticationProvider.tipperModel.copyWith(
        //   balance: finalBalance,
        // ));
        // _currentPaymentMethod = PaymentMethod.card;
        setSelectedPaymentDetails(SelectedPaymentDetailsModel(
          cardNumber: _cardNumberController.text.substring(0, 4) +
              " **** **** " +
              _cardNumberController.text
                  .substring(_cardNumberController.text.length - 4),
          exipryDate: _expiryDateController.text,
        ));
        // _amountController = TextEditingController(text: "50");
        _navigationService.pop();
      }
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print("update card error : $e");
      _isLoading = false;
      notifyListeners();
      errorMessageProvider.setSomethingWentWrrongMessage();
    }
  }

  addAmount(BuildContext context) async {
    try {
      errorMessageProvider.clearErrorMessage();
      _isLoading = true;
      notifyListeners();
      if (_amountController.text.trim().length == 0) {
        _isAmountValid = false;
      }
      if (_isAmountValid &&
          _selectedPaymentMethod != SelectedPaymentMethod.none) {
        var authenticationProvider =
            Provider.of<AuthenticationProvider>(context, listen: false);
        dynamic addedAmount = _amountController.text.trim();

        dynamic finalBalance = authenticationProvider.tipperModel.balance +
            double.tryParse(addedAmount);
        await _firestore
            .collection("users")
            .doc(authenticationProvider.tipperModel.userId)
            .update({
          "balance": finalBalance,
        });
        authenticationProvider
            .updateTipperModel(authenticationProvider.tipperModel.copyWith(
          balance: finalBalance,
        ));
        _navigationService.replaceRoute(name: kTopUpSuccessfulPage);
      } else if (_selectedPaymentMethod == SelectedPaymentMethod.none) {
        errorMessageProvider.setErrorMessage(message: "Choose payment method");
      } else {
        errorMessageProvider.setErrorMessage(message: "Enter valid amount");
      }
      // if (_isAmountValid &&
      //     _selectedPaymentDetailsModel.cardNumber != "" &&
      //     _selectedPaymentMethod == SelectedPaymentMethod.card) {
      //   var authenticationProvider =
      //       Provider.of<AuthenticationProvider>(context, listen: false);
      //   dynamic addedAmount = _amountController.text.trim();

      //   dynamic finalBalance = authenticationProvider.tipperModel.balance +
      //       double.tryParse(addedAmount);
      //   await _firestore
      //       .collection("users")
      //       .doc(authenticationProvider.tipperModel.userId)
      //       .update({
      //     "balance": finalBalance,
      //   });
      //   authenticationProvider
      //       .updateTipperModel(authenticationProvider.tipperModel.copyWith(
      //     balance: finalBalance,
      //   ));
      //   _navigationService.replaceRoute(name: kTopUpSuccessfulPage);
      // } else if (_selectedPaymentDetailsModel.cardNumber == "") {
      //   errorMessageProvider.setErrorMessage(message: "Enter card details");
      // } else if (_selectedPaymentMethod != SelectedPaymentMethod.card) {
      //   errorMessageProvider.setErrorMessage(message: "Please choose card");
      // } else {
      //   errorMessageProvider.setErrorMessage(message: "Enter valid amount");
      // }
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print("update amount error : $e");
      _isLoading = false;
      notifyListeners();
      errorMessageProvider.setSomethingWentWrrongMessage();
    }
  }

  clearAmountController() {
    _amountController = TextEditingController(text: "50");
    notifyListeners();
  }

  deletePaymentMethod() {
    _selectedPaymentMethod = SelectedPaymentMethod.card;
    _selectedPaymentDetailsModel = SelectedPaymentDetailsModel();
    _cardNumberController.clear();
    _cardHolderNameController.clear();
    _cvcController.clear();
    _expiryDateController.clear();
    _amountController = TextEditingController(text: "50");
    _ibanNumberController.clear();
    _bankAccountHolderController.clear();
    _isNameValid = false;
    _isCardValid = false;
    _isDateValid = false;
    _isCVCValid = false;
    _isConfirmIbanPressed = false;
    notifyListeners();
  }
}
