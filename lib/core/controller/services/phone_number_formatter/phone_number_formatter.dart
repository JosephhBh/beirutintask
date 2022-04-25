import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberFormatter {
  Future<String?> formatAsYouType(
      {required String input, required String isoCode}) async {
    try {
      String? formattedPhoneNumber = await PhoneNumberUtil.formatAsYouType(
          phoneNumber: input, isoCode: isoCode);
      return formattedPhoneNumber;
    } on Exception {
      return '';
    }
  }
}
