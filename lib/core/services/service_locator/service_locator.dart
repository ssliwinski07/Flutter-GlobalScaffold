import 'package:get_it/get_it.dart';
import 'dart:async';

import 'package:flutter_global_scaffold/core/services.dart';
import 'package:flutter_global_scaffold/helpers/consts.dart';

class ServiceLocator {
  static GetIt getIt = GetIt.instance;

  static Future<void> initializeCoreUIServices() async {
    getIt.registerSingleton<MessageServiceBase>(MessageServiceMain(),
        instanceName: mainInstance);
  }
}
