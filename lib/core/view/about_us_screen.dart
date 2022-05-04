// import 'package:flutter/material.dart';
// import 'package:tipperapp/core/device_utils/device_utils.dart';
// import 'package:tipperapp/core/navigation/navigation_service.dart';
// import 'package:tipperapp/locator.dart';
// import 'package:tipperapp/widgets/icons/back_icon.dart';
// import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';
// import 'package:tipperapp/widgets/text/global_text.dart';

// class AboutUsPage extends StatelessWidget {
//   final NavigationService _navigationService = locator<NavigationService>();
//   @override
//   Widget build(BuildContext context) {
//     return GlobalScaffold(
//       backgroundColor: appColor.greyColor,
//       child: Stack(
//         fit: StackFit.loose,
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               heighSpacer(18),
//               GestureDetector(
//                 onTap: () {
//                   _navigationService.pop();
//                 },
//                 child: Container(
//                   color: appColor.transparentColor,
//                   child: Row(
//                     children: [
//                       widthSpacer(17),
//                       BackIcon(),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Align(
//             alignment: Alignment.center,
//             child: Container(
//               width: setCurrentWidth(300),
//               child: GlobalText(
//                 text:
//                     "Tipr is a mobile application that allows customers to pay cashless tips directly to service workers using QR Code reader technology.",
//                 showEllipsis: false,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/core/navigation/navigation_service.dart';
import 'package:tipperapp/locator.dart';
import 'package:tipperapp/widgets/icons/back_icon.dart';
import 'package:tipperapp/widgets/icons/back_icon_withcolor.dart';
import 'package:tipperapp/widgets/icons/profile_icons/about_us_icon.dart';
import 'package:tipperapp/widgets/icons/support/about_us_icon.dart';
import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class AboutUsPage extends StatelessWidget {
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      backgroundColor: appColor.greyColor,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            height: setCurrentHeight(355),
            width: double.infinity,
            color: appColor.yellowColor,
            child: Center(
              child: GlobalText(
                color: appColor.whiteColor,
                text: "tipr",
                fontSize: 80,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                        BackIconWithColor(
                          color: appColor.whiteColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Align(
          //   alignment: Alignment.center,
          //   child: Container(
          //     width: setCurrentWidth(300),
          //     child: GlobalText(
          //       text:
          //           "Tipr is a mobile application that allows customers to pay cashless tips directly to service workers using QR Code reader technology.",
          //       showEllipsis: false,
          //     ),
          //   ),
          // ),
          applyPadding(
            390,
            0,
            24,
            0,
            Stack(
              fit: StackFit.loose,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      // textBaseline: TextBaseline.ideographic,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        applyPadding(
                          20,
                          0,
                          0,
                          0,
                          Container(
                            width: setCurrentWidth(50),
                            child: Divider(
                              height: 2,
                              thickness: 3,
                              color: appColor.yellowColor,
                            ),
                          ),
                        ),
                        widthSpacer(15),
                        Expanded(
                          flex: 1,
                          child: RichText(
                            text: TextSpan(
                              text: '',
                              // style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Tipr',
                                  style: GoogleFonts.fredokaOne(
                                      fontSize: setFontSize(30),
                                      color: appColor.yellowColor),
                                ),
                                TextSpan(
                                  text:
                                      ' is a mobile application that allows customers to pay cashless tips directly to service workers using QR Code reader technology.',
                                  style: GoogleFonts.fredokaOne(
                                      fontSize: setFontSize(30),
                                      color:
                                          appColor.blackColor.withOpacity(0.6)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                applyPadding(
                  210,
                  200,
                  0,
                  0,
                  AboutUsIconLogo(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
