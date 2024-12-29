// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CounterStore on CounterStoreBase, Store {
  late final _$valueAtom =
      Atom(name: 'CounterStoreBase.value', context: context);

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$increaseCounterAsyncAction =
      AsyncAction('CounterStoreBase.increaseCounter', context: context);

  @override
  Future<void> increaseCounter() {
    return _$increaseCounterAsyncAction.run(() => super.increaseCounter());
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
