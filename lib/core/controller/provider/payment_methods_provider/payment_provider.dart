import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:provider/provider.dart';
import 'package:tipperapp/core/controller/provider/authenticaion_provider/authentication_provider.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/core/navigation/navigation_service.dart';
import 'package:tipperapp/locator.dart';
import 'package:tipperapp/tipper/model/selected_paymen_details.dart';

// enum PaymentMethod { none, card, apple, google }

enum SelectedPaymentMethod {
  none,
  card,
  apple,
  google,
}

class PaymentProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final NavigationService _navigationService = locator<NavigationService>();

  bool _isLoading = false;
  // PaymentMethod _currentPaymentMethod = PaymentMethod.none;
  SelectedPaymentMethod _selectedPaymentMethod = SelectedPaymentMethod.none;
  MaskedTextController _cardNumberController =
      MaskedTextController(mask: "0000 0000 0000 0000");
  TextEditingController _cardHolderNameController = TextEditingController();
  TextEditingController _cvcController = TextEditingController();
  MaskedTextController _expiryDateController =
      MaskedTextController(mask: "00 / 0000");
  TextEditingController _amountController = TextEditingController();
  bool _isNameValid = false;
  bool _isCardValid = false;
  bool _isDateValid = false;
  bool _isCVCValid = false;
  bool _isAmountValid = false;
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
  bool get isNameValid => _isNameValid;
  bool get isCardValid => _isCardValid;
  bool get isDateValid => _isDateValid;
  bool get isCVCValid => _isCVCValid;
  bool get isAmountValid => _isAmountValid;
  SelectedPaymentDetailsModel get selectedPaymentDetailsModel =>
      _selectedPaymentDetailsModel;

  setPaymentMethod(SelectedPaymentMethod paymentMethod) {
    _selectedPaymentMethod = paymentMethod;
    notifyListeners();
  }

  setCardPaymentMethod() {
    if (_selectedPaymentMethod == SelectedPaymentMethod.card) {
      _selectedPaymentMethod = SelectedPaymentMethod.none;
    } else {
      _selectedPaymentMethod = SelectedPaymentMethod.card;
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

  setIsAmountValid(bool val) {
    _isAmountValid = val;
    notifyListeners();
  }

  setSelectedPaymentDetails(
      SelectedPaymentDetailsModel selectedPaymentDetailsModel) {
    _selectedPaymentDetailsModel = selectedPaymentDetailsModel;
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

  updateAmount(BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();
      var authenticationProvider =
          Provider.of<AuthenticationProvider>(context, listen: false);
      bool isValid = validatePaymentFields();
      if (isValid) {
        dynamic addedAmount = _amountController.text.trim().length == 0
            ? "100"
            : _amountController.text.trim();
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
        // _currentPaymentMethod = PaymentMethod.card;
        setSelectedPaymentDetails(SelectedPaymentDetailsModel(
          cardNumber: "**** **** **** " +
              _cardNumberController.text
                  .substring(_cardNumberController.text.length - 4),
          exipryDate: _expiryDateController.text,
        ));
        _amountController.clear();
        _navigationService.pop();
      }
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print("update amount error : $e");
      _isLoading = false;
      notifyListeners();
      errorMessageProvider.setSomethingWentWrrongMessage();
    }
  }
}
