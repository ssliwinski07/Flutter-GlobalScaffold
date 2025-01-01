import 'package:mobx/mobx.dart';
import 'dart:async';

part 'counter_store.g.dart';

class CounterStore = CounterStoreBase with _$CounterStore;

abstract class CounterStoreBase with Store {
  @observable
  int value = 0;

  @action
  Future<void> increaseCounter() async {
    await Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
    );

    if (DateTime.now().second % 2 == 0) {
      throw "Database error. Please contact administrator.";
    }

    value++;
  }
}
