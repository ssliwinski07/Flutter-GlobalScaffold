import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_global_scaffold/core/services.dart';
import 'package:flutter_global_scaffold/helpers/helpers.dart';
import 'package:flutter_global_scaffold/widgets/messages.dart';

class MessageServiceMain implements MessageServiceBase {
  static final GlobalKey<ScaffoldMessengerState> scaffoldMsgKey =
      GlobalKey<ScaffoldMessengerState>();

  late FToast fToast;

  @override
  void init() {
    fToast = FToast();
    fToast.init(navigatorKey.currentContext!);
  }

  @override
  void showMessageWidget() {
    fToast.showToast(
        child: const MessagesWidget(
      message: "success",
    ));
  }

  @override
  void showMessage(
      {required String message, required InfoMessageType infoMessageType}) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: _getBackgroundColor(infoMessageType),
      duration: Duration(seconds: _getDurationSeconds(infoMessageType)),
    );

    scaffoldMsgKey.currentState?.showSnackBar(snackBar);
  }

  @override
  void showToastMessage(
      {required String message, required InfoMessageType infoMessageType}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: _getDurationSeconds(infoMessageType),
        backgroundColor: _getBackgroundColor(infoMessageType),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Color _getBackgroundColor(InfoMessageType infoMessageType) {
    switch (infoMessageType) {
      case InfoMessageType.info:
        return Colors.green;
      case InfoMessageType.warning:
        return Colors.orange;
      case InfoMessageType.error:
        return Colors.red;
    }
  }

  int _getDurationSeconds(InfoMessageType infoMessageType) {
    switch (infoMessageType) {
      case InfoMessageType.info:
        return 3;
      case InfoMessageType.warning:
        return 4;
      case InfoMessageType.error:
        return 5;
    }
  }
}
