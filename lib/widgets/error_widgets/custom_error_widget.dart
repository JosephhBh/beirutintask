import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class CustomErrorWidget extends StatefulWidget {
  final String title;
  final String errorMessage;
  final Function() onTap;
  final bool isRed;
  final bool hasTitle;
  CustomErrorWidget({
    required this.title,
    required this.errorMessage,
    required this.onTap,
    this.isRed = true,
    this.hasTitle = true,
  });
  @override
  _CustomErrorWidgetState createState() => _CustomErrorWidgetState();
}

class _CustomErrorWidgetState extends State<CustomErrorWidget> {
  @override
  void initState() {
    super.initState();
    print('deleted1');
    removeErrorWidget();
    // removeErrorWidget();
    // rmErroe();
  }

  removeErrorWidget() async {
    print('init state called');
    await Future.delayed(Duration(seconds: 5), () async {
      print('deleted2');
      if (mounted) {
        if (widget.errorMessage != "") {
          await Future.delayed(Duration.zero, () {
            // var errorMessageProvider =
            //     Provider.of<ErrorMessageProvider>(context, listen: false);
            // paymentProvider.clearErrorMessage();
            widget.onTap();
            // errorMessageProvider.clearErrorMessage();
          });
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: setCurrentHeight(55),
          width: setCurrentWidth(294),
          color: widget.isRed ? appColor.redColor : Colors.blue,
          child: Center(
            child: Stack(
              fit: StackFit.loose,
              children: [
                applyPadding(
                  0,
                  setCurrentWidth(12),
                  0,
                  0,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.error,
                      color: appColor.whiteColor,
                    ),
                  ),
                ),
                applyPadding(
                  setCurrentHeight(7.98),
                  0,
                  0,
                  0,
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: setCurrentWidth(216),
                      color: appColor.transparentColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          widget.hasTitle
                              // ? CustomTextWidget(
                              //     text: widget.title,
                              //     fontSize: 14,
                              //     color: zappColor.customWhiteColor,
                              //     fontFamily: MONTESERRATBOLD,
                              //     textAlign: TextAlign.center,
                              //     letterSpacing: 0,
                              //     height: 1,
                              //     textOverflow: TextOverflow.clip,
                              //   )
                              ? GlobalText(
                                  text: widget.title,
                                  fontSize: 14,
                                  color: appColor.whiteColor,
                                )
                              : heighSpacer(5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GlobalText(
                                text: widget.errorMessage,
                                fontSize: 14,
                                color: appColor.whiteColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
