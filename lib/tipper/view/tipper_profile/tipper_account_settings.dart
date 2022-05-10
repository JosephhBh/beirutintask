import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tipperapp/core/controller/provider/authenticaion_provider/authentication_provider.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/core/navigation/navigation_service.dart';
import 'package:tipperapp/locator.dart';
import 'package:tipperapp/widgets/error_widgets/final_error_widget.dart';
import 'package:tipperapp/widgets/icons/back_icon.dart';
import 'package:tipperapp/widgets/loading/global_loading.dart';
import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class TipperAccountSettings extends StatefulWidget {
  @override
  State<TipperAccountSettings> createState() => _TipperAccountSettingsState();
}

class _TipperAccountSettingsState extends State<TipperAccountSettings> {
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var authenticationProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    authenticationProvider.editUsernameController.text =
        authenticationProvider.tipperModel.username!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      backgroundColor: appColor.greyColor,
      child: SingleChildScrollView(
        child: Stack(
          fit: StackFit.loose,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heighSpacer(18),
                GestureDetector(
                  onTap: () {
                    _navigationService.pop();
                  },
                  child: Container(
                    color: appColor.transparentColor,
                    child: Row(
                      children: [
                        widthSpacer(17),
                        BackIcon(),
                      ],
                    ),
                  ),
                ),
                heighSpacer(65.82),
                applyPadding(
                  0,
                  17,
                  17,
                  0,
                  Consumer<AuthenticationProvider>(
                      builder: (context, authenticationProvider, _) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GlobalText(
                          text: 'Account settings',
                          color: appColor.blackColor.withOpacity(0.66),
                        ),
                        heighSpacer(27),
                        GlobalText(
                          text: 'Change username',
                          color: appColor.blackColor.withOpacity(0.66),
                          fontSize: 14,
                        ),
                        heighSpacer(6),
                        Container(
                          height: setCurrentHeight(63),
                          width: double.infinity,
                          color: appColor.whiteColor,
                          child: Center(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: TextField(
                                    controller: authenticationProvider
                                        .editUsernameController,
                                    onChanged: (String value) {},
                                    style: GoogleFonts.fredokaOne(
                                      color: appColor.blackColor,
                                      fontSize: setFontSize(18),
                                    ),
                                    textInputAction: TextInputAction.next,
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
                            ),
                          ),
                        ),
                        heighSpacer(27),
                        GlobalText(
                          text: 'New password',
                          color: appColor.blackColor.withOpacity(0.66),
                          fontSize: 14,
                        ),
                        heighSpacer(6),
                        Container(
                          height: setCurrentHeight(63),
                          width: double.infinity,
                          color: appColor.whiteColor,
                          child: Center(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: TextField(
                                    controller: authenticationProvider
                                        .editPassController,
                                    onChanged: (String value) {},
                                    style: GoogleFonts.fredokaOne(
                                      color: appColor.blackColor,
                                      fontSize: setFontSize(18),
                                    ),
                                    textInputAction: TextInputAction.next,
                                    cursorColor: appColor.blackColor,
                                    obscureText: true,
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
                            ),
                          ),
                        ),
                        heighSpacer(27),
                        GlobalText(
                          text: 'Confirm password',
                          color: appColor.blackColor.withOpacity(0.66),
                          fontSize: 14,
                        ),
                        heighSpacer(6),
                        Container(
                          height: setCurrentHeight(63),
                          width: double.infinity,
                          color: appColor.whiteColor,
                          child: Center(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: TextField(
                                    controller: authenticationProvider
                                        .editConfirmPassController,
                                    onChanged: (String value) {},
                                    style: GoogleFonts.fredokaOne(
                                      color: appColor.blackColor,
                                      fontSize: setFontSize(18),
                                    ),
                                    textInputAction: TextInputAction.next,
                                    cursorColor: appColor.blackColor,
                                    obscureText: true,
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
                            ),
                          ),
                        ),
                        heighSpacer(53),
                        GlobalText(
                          text: "Change language",
                          color: appColor.blackColor.withOpacity(0.66),
                        ),
                        heighSpacer(7),
                        Container(
                          height: setCurrentHeight(63),
                          width: double.infinity,
                          color: appColor.whiteColor,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                widthSpacer(16),
                                Container(
                                  height: setCurrentHeight(25),
                                  width: setCurrentWidth(51),
                                  child: Image(
                                    image: AssetImage('assets/flags/ae.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                widthSpacer(33),
                                GlobalText(
                                  text: "Arabic",
                                  fontSize: 14,
                                ),
                                Spacer(),
                                Icon(
                                  Icons.search_sharp,
                                  color: appColor.blackColor.withOpacity(0.6),
                                  size: setCurrentHeight(30),
                                ),
                                widthSpacer(16),
                              ],
                            ),
                          ),
                        ),
                        heighSpacer(62),
                        Divider(
                          height: 1,
                          thickness: 0.5,
                          color: appColor.dividerColor,
                        ),
                        heighSpacer(30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _navigationService.pop();
                                authenticationProvider
                                    .clearEditAccountSettingsFunction();
                              },
                              child: Container(
                                height: setCurrentHeight(33),
                                width: setCurrentWidth(86),
                                decoration: BoxDecoration(
                                  color: appColor.whiteColor,
                                  border:
                                      Border.all(color: appColor.dividerColor),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: GlobalText(
                                    text: "Cancel",
                                    fontSize: 14,
                                    color:
                                        appColor.blackColor.withOpacity(0.66),
                                  ),
                                ),
                              ),
                            ),
                            widthSpacer(16),
                            GestureDetector(
                              onTap: () async {
                                await authenticationProvider
                                    .updateTipperProfile();
                              },
                              child: Container(
                                height: setCurrentHeight(33),
                                width: setCurrentWidth(86),
                                decoration: BoxDecoration(
                                  color: appColor.yellowColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: GlobalText(
                                    text: "Save",
                                    fontSize: 14,
                                    color: appColor.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
                ),
              ],
            ),
            FinalErrorWidget(),
            Consumer<AuthenticationProvider>(
                builder: (context, authenticationProvider, _) {
              return authenticationProvider.loading
                  ? GlobalLoading()
                  : SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }
}
