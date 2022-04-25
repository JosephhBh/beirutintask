import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class SignUpFields extends StatelessWidget {
  final Widget icon;
  final String hint;
  final TextEditingController controller;
  final bool condition;
  final Function onChnaged;
  final bool isPhoneNumber;
  final bool isPassword;
  SignUpFields({
    required this.icon,
    required this.hint,
    required this.controller,
    required this.condition,
    required this.onChnaged,
    this.isPhoneNumber = false,
    this.isPassword = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: setCurrentHeight(50),
      width: double.infinity,
      decoration: BoxDecoration(
        color: appColor.whiteColor,
        border: Border.all(
          color: condition ? appColor.redColor : appColor.transparentColor,
          width: condition ? 1 : 0.2,
        ),
      ),
      child: Stack(
        fit: StackFit.loose,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widthSpacer(10),
                icon,
                widthSpacer(10),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: setCurrentWidth(260),
              color: appColor.transparentColor,
              child: Center(
                child: Row(
                  children: [
                    Visibility(
                      visible: isPhoneNumber,
                      child: Row(
                        children: [
                          widthSpacer(8),
                          GlobalText(
                            text: "+971",
                            fontSize: 18,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextField(
                          controller: controller,
                          onChanged: (String value) => onChnaged(value),
                          style: GoogleFonts.fredokaOne(
                            color: appColor.blackColor,
                            fontSize: setFontSize(18),
                          ),
                          textInputAction: TextInputAction.next,
                          keyboardType: isPhoneNumber
                              ? TextInputType.phone
                              : TextInputType.name,
                          cursorColor: appColor.blackColor,
                          decoration: InputDecoration(
                            alignLabelWithHint: false,
                            contentPadding: EdgeInsets.fromLTRB(
                                setCurrentWidth(16),
                                setCurrentHeight(8),
                                8,
                                12),
                            fillColor: appColor.transparentColor,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(9),
                            ),
                            hintText: hint,
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
                          obscureText: isPassword ? true : false,
                          inputFormatters: isPhoneNumber
                              ? [
                                  AsYouTypeFormatter(
                                    isoCode: "ARE",
                                    dialCode: "+971",
                                    onInputFormatted: (TextEditingValue value) {
                                      controller.value = value;
                                    },
                                  )
                                ]
                              : []),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
