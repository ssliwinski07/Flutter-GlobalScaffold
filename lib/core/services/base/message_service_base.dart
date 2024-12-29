import 'package:flutter_global_scaffold/helpers/helpers.dart';

abstract interface class MessageServiceBase {
  void showMessage(
      {required String message, required InfoMessageType infoMessageType});
  void showToastMessage(
      {required String message, required InfoMessageType infoMessageType});
}
