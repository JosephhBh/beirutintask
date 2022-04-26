import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:tipperapp/core/controller/provider/authenticaion_provider/authentication_provider.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/core/navigation/navigation_service.dart';
import 'package:tipperapp/locator.dart';
import 'package:tipperapp/widgets/buttons/sign_in_button.dart';
import 'package:tipperapp/widgets/containers/sign_up_fields.dart';
import 'package:tipperapp/widgets/error_widgets/final_error_widget.dart';
import 'package:tipperapp/widgets/icons/back_icon.dart';
import 'package:tipperapp/widgets/icons/registration_icons/email_icon.dart';
import 'package:tipperapp/widgets/icons/registration_icons/emirates_id_icon.dart';
import 'package:tipperapp/widgets/icons/face_id_icon.dart';
import 'package:tipperapp/widgets/icons/registration_icons/password_icon.dart';
import 'package:tipperapp/widgets/icons/registration_icons/phone_number_icon.dart';
import 'package:tipperapp/widgets/icons/registration_icons/username_yellow_icon.dart';
import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class SignUpPage extends StatelessWidget {
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      backgroundColor: appColor.greyColor,
      child: SingleChildScrollView(
        child: Stack(
          fit: StackFit.loose,
          children: [
            Container(
              height: setCurrentHeight(424),
              width: double.infinity,
              color: appColor.whiteColor,
            ),
            GestureDetector(
              onTap: () {
                _navigationService.pop();
              },
              child: Container(
                color: appColor.transparentColor,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: applyPadding(
                    24,
                    25,
                    0,
                    0,
                    BackIcon(),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: GlobalText(
                color: appColor.yellowColor,
                text: "tipr",
                fontSize: 70,
              ),
            ),
            applyPadding(
              155,
              45,
              45,
              0,
              Consumer<AuthenticationProvider>(
                  builder: (context, authenticationProvider, _) {
                return Column(
                  children: [
                    Row(
                      children: [
                        widthSpacer(5),
                        GlobalText(
                          text: 'Sign Up',
                        ),
                      ],
                    ),
                    heighSpacer(45),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        height: setCurrentHeight(514),
                        width: double.infinity,
                        color: appColor.yellowColor,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: setCurrentWidth(20),
                            right: setCurrentWidth(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              heighSpacer(38),
                              // SignUpFields(
                              //   icon: EmiratesIdIcon(),
                              //   controller:
                              //       authenticationProvider.emiratesIdController,
                              //   hint: "Emirates ID",
                              //   condition: false,
                              //   onChnaged: (val) {},
                              // ),
                              // heighSpacer(31),
                              SignUpFields(
                                icon: UsernameYellowIcon(),
                                controller: authenticationProvider
                                    .tipperUsernameController,
                                hint: "Choose username",
                                condition: false,
                                onChnaged: (val) {},
                              ),
                              heighSpacer(31),
                              SignUpFields(
                                icon: EmailIcon(),
                                controller: authenticationProvider
                                    .tipperEmailAddressController,
                                hint: "Email address",
                                condition: false,
                                onChnaged: (val) {},
                              ),
                              heighSpacer(31),
                              SignUpFields(
                                icon: PhoneNumberIcon(),
                                controller: authenticationProvider
                                    .tipperPhoneNumberController,
                                hint: "Phone number",
                                condition: false,
                                onChnaged: (val) {},
                                isPhoneNumber: true,
                              ),
                              heighSpacer(31),
                              SignUpFields(
                                icon: PasswordIcon(),
                                controller: authenticationProvider
                                    .tipperPasswordController,
                                hint: "Password",
                                condition: false,
                                onChnaged: (val) {},
                                isPassword: true,
                              ),
                              heighSpacer(31),
                              SignUpFields(
                                icon: PasswordIcon(),
                                controller: authenticationProvider
                                    .tipperConfirmPasswordController,
                                hint: "Confirm password",
                                condition: false,
                                isPassword: true,
                                onChnaged: (val) {},
                              ),
                              heighSpacer(40),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaceIdIcon(),
                                  widthSpacer(10),
                                  GlobalText(
                                    text: '(optional)',
                                    fontSize: 18,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    heighSpacer(19),
                    SignInButton(
                      text: 'Sign Up',
                      isYellow: false,
                      onPressed: () async {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        currentFocus.unfocus();

                        await authenticationProvider.registerTipper();
                        // var result = await PhoneNumberUtil.isValidNumber(
                        //     phoneNumber: "550000000", isoCode: "AE");
                        // print(result);
                      },
                    ),
                  ],
                );
              }),
            ),
            FinalErrorWidget(),
          ],
        ),
      ),
    );
  }
}
