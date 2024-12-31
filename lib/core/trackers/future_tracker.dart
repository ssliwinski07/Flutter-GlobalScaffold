import 'package:flutter_global_scaffold/core/services.dart';
import 'package:flutter_global_scaffold/core/services/base/message_service_base.dart';

class FutureTracker<T> {
  FutureTracker(
    Future<T> Function() computation, {
    String? successMsg,
    required MessageServiceBase messageService,
  }) : _messageService = messageService {
    _future = computation();
    _futureTracker();
  }

  Future<T> get future => _future;
  bool get isCompleted => _isCompleted;
  bool get hasError => _hasError;
  bool get completedWithError => _hasError && _isCompleted;
  Object get error => _error;

  late final Future<T> _future;
  final MessageServiceBase _messageService;
  bool _isCompleted = false;
  bool _hasError = false;
  Object _error = "";

  void _futureTracker() async {
    try {
      await _future;
      // _messageService.showToastMessage(
      //     message: _successMsg ?? 'Operation successful',
      //     infoMessageType: InfoMessageType.info);
      _messageService.showMessageWidget();
    } catch (e) {
      _hasError = true;
      _error = e;
      // _messageService.showToastMessage(
      //     message: e.toString(), infoMessageType: InfoMessageType.error);
      _messageService.showMessageWidget();
    } finally {
      _isCompleted = true;
    }
  }
}
