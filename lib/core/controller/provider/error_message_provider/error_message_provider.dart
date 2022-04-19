import 'package:flutter/material.dart';

import 'package:tipperapp/core/model/error_message.dart';

class ErrorMessageProvider extends ChangeNotifier {
  ErrorMessage _errorMessage = ErrorMessage(title: '', message: '');
  ErrorMessage get errorMessage => _errorMessage;

  setErrorMessage(ErrorMessage errorMessage) {
    _errorMessage = errorMessage;
    notifyListeners();
  }

  clearErrorMessage() {
    _errorMessage = ErrorMessage(title: "", message: "");
    notifyListeners();
  }

  setSomethingWentWrrongMessage() {
    _errorMessage =
        ErrorMessage(title: 'Error', message: 'Something went wrong.');
    notifyListeners();
  }

  setNoInternetConnectionError() {
    _errorMessage = ErrorMessage(
        title: "NO INTERNET CONNECTION",
        message: "Please check your internet connection.");
    notifyListeners();
  }
}
