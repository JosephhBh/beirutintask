import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:tipperapp/core/controller/provider/error_message_provider/error_message_provider.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/widgets/error_widgets/custom_error_widget.dart';

class FinalErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ErrorMessageProvider>(
        builder: (context, errorMessageProvider, _) {
      return AnimatedSwitcher(
          duration: Duration(milliseconds: 200),
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            opacity: errorMessageProvider.errorMessage.message == "" ? 0 : 1,
            child: errorMessageProvider.errorMessage.message == ""
                ? SizedBox.shrink()
                : Stack(
                    fit: StackFit.loose,
                    children: [
                      applyPadding(
                        30,
                        0,
                        0,
                        0,
                        Align(
                          alignment: Alignment.topCenter,
                          child: CustomErrorWidget(
                            title: errorMessageProvider.errorMessage.title,
                            errorMessage:
                                errorMessageProvider.errorMessage.message,
                            onTap: errorMessageProvider.clearErrorMessage,
                            isRed: errorMessageProvider.errorMessage.isRed,
                            hasTitle:
                                errorMessageProvider.errorMessage.hasTitle,
                          ),
                        ),
                      ),
                    ],
                  ),
          ));
    });
  }
}
