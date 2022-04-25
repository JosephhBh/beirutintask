import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tipperapp/core/constants/route_names.dart';
import 'package:tipperapp/core/controller/provider/authenticaion_provider/authentication_provider.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/core/navigation/navigation_service.dart';
import 'package:tipperapp/locator.dart';
import 'package:tipperapp/widgets/buttons/sign_in_button.dart';
import 'package:tipperapp/widgets/error_widgets/final_error_widget.dart';
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
  final NavigationService _navigationService = locator<NavigationService>();

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
                          (authenticationProvider.isEmailVerified == false &&
                                  authenticationProvider.canPressLogin ==
                                      true) ==
                              true,
                      isPasswordVerified:
                          (authenticationProvider.isPasswordVerified == false &&
                                  authenticationProvider.canPressLogin ==
                                      true) ==
                              true,
                      onEmailFieldChanged: (val) {
                        var emailVerified = EmailValidator.validate(
                            authenticationProvider.emailController.text.trim());
                        if (emailVerified) {
                          authenticationProvider.setIsEmailVerified(true);
                          if (authenticationProvider
                                  .passwordController.text.length >=
                              6) {
                            authenticationProvider.setCanPressLogin(true);
                          }
                        } else {
                          authenticationProvider.setIsEmailVerified(false);
                        }
                      },
                      onPasswordFieldChanged: (val) {
                        if (authenticationProvider.passwordController.text
                                .trim()
                                .length >=
                            6) {
                          authenticationProvider.setIsPasswordVerified(true);

                          if (authenticationProvider.isEmailVerified == true) {
                            authenticationProvider.setCanPressLogin(true);
                          }
                        } else {
                          authenticationProvider.setIsPasswordVerified(false);
                        }
                      },
                    ),
                    heighSpacer(18),
                    SignInButton(
                      text: "SIGN IN",
                      onPressed: () async {
                        // authenticationProvider.signInWithEmailAndPassword();
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        currentFocus.unfocus();
                        await authenticationProvider.signIn();
                      },
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
                      onPressed: () {
                        _navigationService.navigateTo(name: kSignUpPage);
                      },
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
          FinalErrorWidget(),
        ],
      ),
    );
  }
}
