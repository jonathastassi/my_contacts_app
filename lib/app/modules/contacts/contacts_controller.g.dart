// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ContactsController = BindInject(
  (i) => ContactsController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContactsController on _ContactsControllerBase, Store {
  final _$valueAtom = Atom(name: '_ContactsControllerBase.value');

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

  final _$_ContactsControllerBaseActionController =
      ActionController(name: '_ContactsControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_ContactsControllerBaseActionController.startAction(
        name: '_ContactsControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_ContactsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
