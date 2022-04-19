import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tipperapp/core/controller/provider/authenticaion_provider/authentication_provider.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class LoginFields extends StatelessWidget {
  final AuthenticationType authenticationType;
  final Function() setEmailAuthenticaitonType;
  final Function() setPhoneAuthenticationType;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function onEmailFieldChanged;
  final Function onPasswordFieldChanged;
  final bool isEmailVerified;
  final bool isPasswordVerified;
  LoginFields({
    required this.authenticationType,
    required this.setEmailAuthenticaitonType,
    required this.setPhoneAuthenticationType,
    required this.emailController,
    required this.passwordController,
    required this.onEmailFieldChanged,
    required this.onPasswordFieldChanged,
    required this.isEmailVerified,
    required this.isPasswordVerified,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: setCurrentHeight(200),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: setEmailAuthenticaitonType,
                child: Container(
                  color: appColor.transparentColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GlobalText(
                        text: "Email",
                        fontSize: 18,
                      ),
                      heighSpacer(4),
                      Container(
                        height: setCurrentHeight(7),
                        width: setCurrentWidth(7),
                        decoration: BoxDecoration(
                          color: authenticationType == AuthenticationType.Email
                              ? appColor.yellowColor
                              : appColor.transparentColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              widthSpacer(20),
              GestureDetector(
                onTap: setPhoneAuthenticationType,
                child: Container(
                  color: appColor.transparentColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GlobalText(
                        text: "Phone Number",
                        fontSize: 18,
                      ),
                      heighSpacer(4),
                      Container(
                        height: setCurrentHeight(7),
                        width: setCurrentWidth(7),
                        decoration: BoxDecoration(
                          color: authenticationType == AuthenticationType.Phone
                              ? appColor.yellowColor
                              : appColor.transparentColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          heighSpacer(28),
          authenticationType == AuthenticationType.Email
              ? EmailView(
                  emailController: emailController,
                  passwordController: passwordController,
                  onEmailFieldChanged: onEmailFieldChanged,
                  onPasswordFieldChanged: onPasswordFieldChanged,
                  isEmailVerified: isEmailVerified,
                  isPasswordVerified: isPasswordVerified,
                )
              : PhoneView(),
        ],
      ),
    );
  }
}

class EmailView extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isEmailVerified;
  final bool isPasswordVerified;
  final Function onEmailFieldChanged;
  final Function onPasswordFieldChanged;
  EmailView({
    required this.emailController,
    required this.passwordController,
    required this.isEmailVerified,
    required this.isPasswordVerified,
    required this.onEmailFieldChanged,
    required this.onPasswordFieldChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: setCurrentHeight(54),
          width: double.infinity,
          decoration: BoxDecoration(
            color: appColor.greyColor,
            border: Border.all(
              color: isEmailVerified
                  ? appColor.redColor
                  : appColor.transparentColor,
              width: isEmailVerified ? 1 : 0.2,
            ),
          ),
          child: TextFormField(
            controller: emailController,
            onChanged: (String value) => onEmailFieldChanged(value),
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
              hintText: "Email",
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
        heighSpacer(15),
        Container(
          height: setCurrentHeight(54),
          width: double.infinity,
          decoration: BoxDecoration(
            color: appColor.greyColor,
            border: Border.all(
              color: isPasswordVerified
                  ? appColor.redColor
                  : appColor.transparentColor,
              width: isPasswordVerified ? 1 : 0.2,
            ),
          ),
          child: TextFormField(
            controller: passwordController,
            onChanged: (String value) => onPasswordFieldChanged(value),
            style: GoogleFonts.fredokaOne(
              color: appColor.blackColor,
              fontSize: 18,
            ),
            obscureText: true,
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
              hintText: "Password",
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
      ],
    );
  }
}

class PhoneView extends StatelessWidget {
  const PhoneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
