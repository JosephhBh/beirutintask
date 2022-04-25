import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class CustomPhoneInput extends StatefulWidget {
  final ValueChanged<PhoneNumber>? onInputChanged;
  final ValueChanged<bool>? onInputValidated;
  final TextEditingController controller;
  final bool isPhoneNumberVerified;
  CustomPhoneInput({
    required this.onInputChanged,
    this.onInputValidated,
    required this.controller,
    required this.isPhoneNumberVerified,
  });

  @override
  State<CustomPhoneInput> createState() => _CustomPhoneInputState();
}

class _CustomPhoneInputState extends State<CustomPhoneInput> {
  Country? country = Country(
    name: "United Arab Emirates",
    alpha2Code: 'AE',
    alpha3Code: 'ARE',
    dialCode: "+971",
    flagUri: 'assets/flags/ae.png',
  );
  // Country? country;
  List<Country> countries = [];
  bool isNotValid = true;

  void onChanged(String value) {
    phoneNumberControllerListener();
  }

  void phoneNumberControllerListener() {
    if (this.mounted) {
      String parsedPhoneNumberString =
          widget.controller.text.replaceAll(RegExp(r'[^\d+]'), '');

      getParsedPhoneNumber(parsedPhoneNumberString, this.country?.alpha2Code)
          .then((phoneNumber) {
        if (phoneNumber == null) {
          String phoneNumber =
              '${this.country?.dialCode}$parsedPhoneNumberString';

          if (widget.onInputChanged != null) {
            widget.onInputChanged!(PhoneNumber(
              phoneNumber: phoneNumber,
              isoCode: this.country?.alpha2Code,
              dialCode: this.country?.dialCode,
            ));
          }

          if (widget.onInputValidated != null) {
            widget.onInputValidated!(false);
          }
          this.isNotValid = true;
        } else {
          if (widget.onInputChanged != null) {
            widget.onInputChanged!(PhoneNumber(
                phoneNumber: phoneNumber,
                isoCode: this.country?.alpha2Code,
                dialCode: this.country?.dialCode));
          }

          if (widget.onInputValidated != null) {
            widget.onInputValidated!(true);
          }
          this.isNotValid = false;
        }
      });
    }
  }

  Future<String?> getParsedPhoneNumber(
      String phoneNumber, String? isoCode) async {
    if (phoneNumber.isNotEmpty && isoCode != null) {
      try {
        bool? isValidPhoneNumber = await PhoneNumberUtil.isValidNumber(
            phoneNumber: phoneNumber, isoCode: isoCode);

        if (isValidPhoneNumber!) {
          return await PhoneNumberUtil.normalizePhoneNumber(
              phoneNumber: phoneNumber, isoCode: isoCode);
        }
      } on Exception {
        return null;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: setCurrentHeight(54),
      width: double.infinity,
      decoration: BoxDecoration(
        color: appColor.greyColor,
        border: Border.all(
          color: widget.isPhoneNumberVerified
              ? appColor.redColor
              : appColor.transparentColor,
          width: widget.isPhoneNumberVerified ? 1 : 0.2,
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            widthSpacer(9),
            Container(
              height: setCurrentHeight(40),
              width: setCurrentWidth(80),
              decoration: BoxDecoration(
                color: appColor.whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: setCurrentHeight(12),
                      width: setCurrentWidth(17),
                      child: Image(
                        image: AssetImage('assets/flags/ae.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    widthSpacer(6),
                    GlobalText(
                      text: '+971',
                      fontSize: 14,
                      color: appColor.blackColor.withOpacity(0.6),
                    ),
                  ],
                ),
              ),
            ),
            widthSpacer(2),
            Expanded(
              flex: 1,
              child: TextFormField(
                controller: widget.controller,
                onChanged: (String value) => onChanged(value),
                // onChanged: (val) {},
                style: GoogleFonts.fredokaOne(
                  color: appColor.blackColor,
                  fontSize: setFontSize(18),
                ),
                keyboardType: TextInputType.number,
                cursorColor: appColor.blackColor,
                decoration: InputDecoration(
                  alignLabelWithHint: false,
                  contentPadding: EdgeInsets.fromLTRB(
                      setCurrentWidth(16), setCurrentHeight(8), 8, 12),
                  fillColor: appColor.transparentColor,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  hintText: "Phone Number",
                  hintStyle: GoogleFonts.fredokaOne(
                    color: appColor.blackColor.withOpacity(0.6),
                    fontSize: setFontSize(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(15),
                  AsYouTypeFormatter(
                    isoCode: "ARE",
                    dialCode: "+971",
                    onInputFormatted: (TextEditingValue value) {
                      widget.controller.value = value;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
