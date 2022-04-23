import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class SignUpFields extends StatelessWidget {
  final Widget icon;
  final String hint;
  final TextEditingController controller;
  final bool condition;
  final Function onChnaged;
  SignUpFields({
    required this.icon,
    required this.hint,
    required this.controller,
    required this.condition,
    required this.onChnaged,
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
      // child: Center(
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       widthSpacer(26),
      //       icon,
      //       widthSpacer(30),
      //       // GlobalText(
      //       //   text: text,
      //       //   color: appColor.blackColor.withOpacity(0.6),
      //       // ),
      //       Container(
      //         height: setCurrentHeight(60),
      //         width: double.infinity - 10,
      //         child: TextFormField(),
      //       ),
      //     ],
      //   ),
      // ),
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
                child: TextField(
                  controller: controller,
                  onChanged: (String value) => onChnaged(value),
                  style: GoogleFonts.fredokaOne(
                    color: appColor.blackColor,
                    fontSize: 18,
                  ),
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
                    hintText: hint,
                    hintStyle: GoogleFonts.fredokaOne(
                      color: appColor.blackColor.withOpacity(0.6),
                      fontSize: 16,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
