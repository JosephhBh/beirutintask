import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:tipperapp/core/controller/provider/authenticaion_provider/authentication_provider.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/core/navigation/navigation_service.dart';
import 'package:tipperapp/locator.dart';
import 'package:tipperapp/widgets/error_widgets/final_error_widget.dart';
import 'package:tipperapp/widgets/icons/back_icon.dart';
import 'package:tipperapp/widgets/icons/user_icon.dart';
import 'package:tipperapp/widgets/loading/global_loading.dart';
import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class TipperPersonalDetailsPage extends StatefulWidget {
  @override
  State<TipperPersonalDetailsPage> createState() =>
      _TipperPersonalDetailsPageState();
}

class _TipperPersonalDetailsPageState extends State<TipperPersonalDetailsPage> {
  final NavigationService _navigationService = locator<NavigationService>();

  String _imagePath = "";
  File? _currentFile;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var authenticationProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    authenticationProvider.editNameController.text =
        authenticationProvider.tipperModel.name!;
    authenticationProvider.editPhoneNumberController.text =
        authenticationProvider.tipperModel.phoneNumber!;
    authenticationProvider.editEmailController.text =
        authenticationProvider.tipperModel.email!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // var authenticationProvider =
    //     Provider.of<AuthenticationProvider>(context, listen: false);
    return GlobalScaffold(
      backgroundColor: appColor.greyColor,
      child: Stack(
        fit: StackFit.loose,
        children: [
          applyPadding(
            18,
            0,
            0,
            0,
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
          ),
          applyPadding(
            48,
            13,
            13,
            0,
            SingleChildScrollView(
              child: Consumer<AuthenticationProvider>(
                  builder: (context, authenticationProvider, _) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heighSpacer(65),
                    Row(
                      children: [
                        widthSpacer(5),
                        GlobalText(
                          text: "Personal details",
                          color: appColor.blackColor.withOpacity(0.66),
                        ),
                      ],
                    ),
                    heighSpacer(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(43),
                          child: Container(
                            height: setCurrentHeight(242),
                            width: setCurrentWidth(366),
                            color: appColor.whiteColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                heighSpacer(34),
                                authenticationProvider.tipperModel.imagePath ==
                                        null
                                    ? UserIcon(
                                        height: 100,
                                      )
                                    : authenticationProvider
                                                    .tipperModel.imagePath ==
                                                "" &&
                                            _imagePath == ""
                                        ? GestureDetector(
                                            onTap: () async {
                                              FilePickerResult? result =
                                                  await FilePicker.platform
                                                      .pickFiles();

                                              if (result != null) {
                                                File file = File(
                                                    result.files.single.path!);

                                                print(
                                                    "the path is ${file.path}");
                                                _imagePath = file.path;
                                                _currentFile = file;
                                                setState(() {});
                                              } else {
                                                _imagePath = "";
                                                _currentFile = null;
                                                setState(() {});
                                              }
                                              print(authenticationProvider
                                                  .tipperModel.imagePath);
                                            },
                                            child: UserIcon(
                                              height: 100,
                                            ),
                                          )
                                        : GestureDetector(
                                            onTap: () async {
                                              FilePickerResult? result =
                                                  await FilePicker.platform
                                                      .pickFiles();

                                              if (result != null) {
                                                File file = File(
                                                    result.files.single.path!);

                                                print(
                                                    "the path is ${file.path}");
                                                _imagePath = file.path;
                                                _currentFile = file;
                                                setState(() {});
                                              } else {
                                                _imagePath = "";
                                                _currentFile = null;
                                                setState(() {});
                                              }
                                              print(authenticationProvider
                                                  .tipperModel.imagePath);
                                            },
                                            child: CircleAvatar(
                                                radius: setCurrentWidth(60),
                                                backgroundColor:
                                                    appColor.greyColor,
                                                backgroundImage:
                                                    authenticationProvider
                                                                    .tipperModel
                                                                    .imagePath ==
                                                                "" &&
                                                            _imagePath == ""
                                                        ? null
                                                        : _imagePath == ""
                                                            ? NetworkImage(
                                                                authenticationProvider
                                                                    .tipperModel
                                                                    .imagePath!)
                                                            : Image.file(File(
                                                                    _imagePath))
                                                                .image),
                                          ),
                                heighSpacer(27),
                                GlobalText(
                                  text: authenticationProvider
                                          .tipperModel.username ??
                                      "",
                                  color: appColor.blackColor.withOpacity(0.66),
                                ),
                                // heighSpacer(34),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    heighSpacer(58),
                    GlobalText(
                      text: "Name",
                      color: appColor.blackColor.withOpacity(0.66),
                    ),
                    heighSpacer(10),
                    Container(
                      height: setCurrentHeight(62),
                      width: double.infinity,
                      color: appColor.whiteColor,
                      child: Center(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextField(
                                controller:
                                    authenticationProvider.editNameController,
                                onChanged: (String value) {},
                                style: GoogleFonts.fredokaOne(
                                  color: appColor.blackColor,
                                  fontSize: setFontSize(18),
                                ),
                                textInputAction: TextInputAction.next,
                                cursorColor: appColor.blackColor,
                                // obscureText: true,
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
                    heighSpacer(11),
                    GlobalText(
                      text: "Phone number",
                      color: appColor.blackColor.withOpacity(0.66),
                    ),
                    heighSpacer(10),
                    Container(
                      height: setCurrentHeight(62),
                      width: double.infinity,
                      color: appColor.whiteColor,
                      child: Center(
                        child: Row(
                          children: [
                            // Row(
                            //   children: [
                            //     widthSpacer(8),
                            //     GlobalText(
                            //       text: "+971",
                            //       fontSize: 18,
                            //     ),
                            //   ],
                            // ),
                            Expanded(
                              flex: 1,
                              child: TextField(
                                controller: authenticationProvider
                                    .editPhoneNumberController,
                                onChanged: (String value) {},
                                style: GoogleFonts.fredokaOne(
                                  color: appColor.blackColor,
                                  fontSize: setFontSize(18),
                                ),
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                                cursorColor: appColor.blackColor,
                                // obscureText: true,
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
                                // inputFormatters: [
                                //   AsYouTypeFormatter(
                                //     isoCode: "ARE",
                                //     dialCode: "+971",
                                //     onInputFormatted: (TextEditingValue value) {
                                //       authenticationProvider
                                //           .editPhoneNumberController
                                //           .value = value;
                                //     },
                                //   )
                                // ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    heighSpacer(11),
                    GlobalText(
                      text: "Email",
                      color: appColor.blackColor.withOpacity(0.66),
                    ),
                    heighSpacer(10),
                    Container(
                      height: setCurrentHeight(62),
                      width: double.infinity,
                      color: appColor.whiteColor,
                      child: Center(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextField(
                                controller:
                                    authenticationProvider.editEmailController,
                                onChanged: (String value) {},
                                style: GoogleFonts.fredokaOne(
                                  color: appColor.blackColor,
                                  fontSize: setFontSize(18),
                                ),
                                textInputAction: TextInputAction.next,
                                cursorColor: appColor.blackColor,
                                // obscureText: true,
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
                            // authenticationProvider
                            //     .clearEditPersonalDetailsFunction();
                          },
                          child: Container(
                            height: setCurrentHeight(33),
                            width: setCurrentWidth(86),
                            decoration: BoxDecoration(
                              color: appColor.whiteColor,
                              border: Border.all(color: appColor.dividerColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: GlobalText(
                                text: "Cancel",
                                fontSize: 14,
                                color: appColor.blackColor.withOpacity(0.66),
                              ),
                            ),
                          ),
                        ),
                        widthSpacer(16),
                        GestureDetector(
                          onTap: () async {
                            // await uploadFile();
                            await authenticationProvider
                                .updateTipperPersonalDetails(_currentFile);
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
    );
  }

  Future<UploadTask?> uploadFile() async {
    try {
      UploadTask? task;
      final fileName = _currentFile!.path;
      final destination = 'user-images/$fileName';

      final ref = FirebaseStorage.instance.ref(destination);
      task = ref.putFile(_currentFile!);

      // setState(() {});
      final TaskSnapshot downloadUrl = (await task);
      final String url = await downloadUrl.ref.getDownloadURL();
      print("Download linl $url");
    } catch (e) {
      print("error uploading image : $e");
    }
  }
}
