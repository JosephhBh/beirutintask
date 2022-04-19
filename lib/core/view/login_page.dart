import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tipperapp/core/controller/provider/authenticaion_provider/authentication_provider.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/widgets/buttons/sign_in_button.dart';
import 'package:tipperapp/widgets/icons/face_id_icon.dart';
import 'package:tipperapp/widgets/registration/login_fields.dart';
import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      backgroundColor: appColor.whiteColor,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            height: setCurrentHeight(210),
            width: double.infinity,
            color: appColor.greyColor,
            child: Center(
              child: GlobalText(
                text: "tipr",
                fontSize: 70,
                color: appColor.yellowColor,
              ),
            ),
          ),
          applyPadding(
            210,
            52,
            52,
            0,
            SingleChildScrollView(
              child: Consumer<AuthenticationProvider>(
                  builder: (context, authenticationProvider, _) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heighSpacer(64),
                    GlobalText(
                      text: "Sign In",
                      fontSize: 20,
                    ),
                    heighSpacer(4),
                    GlobalText(
                      text: "Hi There ! Nice To See You again.",
                      fontSize: 18,
                      isFredokaOne: false,
                    ),
                    heighSpacer(42),
                    LoginFields(
                      authenticationType:
                          authenticationProvider.authenticationType,
                      setEmailAuthenticaitonType: () {
                        authenticationProvider.setEmailAuthenticationType();
                      },
                      setPhoneAuthenticationType: () {
                        authenticationProvider.setPhoneAuthenticationType();
                      },
                      emailController: authenticationProvider.emailController,
                      passwordController:
                          authenticationProvider.passwordController,
                      isEmailVerified:
                          (authenticationProvider.isEmailVerified == true &&
                                  authenticationProvider
                                          .isSignInButtonPressed ==
                                      true) ==
                              false,
                      isPasswordVerified:
                          (authenticationProvider.isPasswordVerified == true &&
                                  authenticationProvider
                                          .isSignInButtonPressed ==
                                      true) ==
                              false,
                      onEmailFieldChanged: (val) {},
                      onPasswordFieldChanged: (val) {},
                    ),
                    heighSpacer(18),
                    SignInButton(
                      text: "SIGN IN",
                      onPressed: () {},
                    ),
                    heighSpacer(18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaceIdIcon(),
                      ],
                    ),
                    heighSpacer(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GlobalText(
                          text: "Keep me signed in",
                          isFredokaOne: false,
                          fontSize: 18,
                        ),
                      ],
                    ),
                    heighSpacer(26),
                    SignInButton(
                      text: "SIGN UP",
                      onPressed: () {},
                    ),
                    heighSpacer(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GlobalText(
                          text: "Forgot Password?",
                          isFredokaOne: false,
                          fontSize: 18,
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
