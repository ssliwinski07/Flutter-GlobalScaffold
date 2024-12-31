import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_global_scaffold/core/services.dart';
import 'package:flutter_global_scaffold/helpers/helpers.dart';
import 'package:flutter_global_scaffold/widgets/messages.dart';

class MessageServiceMain implements MessageServiceBase {
  late FToast fToast;

  @override
  void init() {
    fToast = FToast();
    fToast.init(navigatorKey.currentContext!);
  }

  @override
  void showMessage({
    required String message,
    required InfoMessageType infoMessageType,
  }) {
    fToast.showToast(
      child: MessagesWidget(
        message: message,
        infoMessageType: infoMessageType,
        onTap: () {
          fToast.removeCustomToast();
        },
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(
        seconds: _getDurationSeconds(infoMessageType),
      ),
    );
  }

  int _getDurationSeconds(InfoMessageType infoMessageType) {
    switch (infoMessageType) {
      case InfoMessageType.info:
        return 3;
      case InfoMessageType.warning:
        return 3;
      case InfoMessageType.error:
        return 4;
    }
  }
}
