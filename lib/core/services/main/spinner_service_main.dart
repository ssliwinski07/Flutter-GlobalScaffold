import 'package:flutter_global_scaffold/core/services.dart';
import 'package:flutter_global_scaffold/helpers/helpers.dart';
import 'package:loader_overlay/loader_overlay.dart';

class SpinnerServiceMain implements SpinnerServiceBase {
  @override
  void show() {
    globalLoaderOverlayKey.currentContext?.loaderOverlay.show();
  }

  @override
  void hide() {
    globalLoaderOverlayKey.currentContext?.loaderOverlay.hide();
  }
}
