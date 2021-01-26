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
  final _$listAtom = Atom(name: '_ContactsControllerBase.list');

  @override
  ObservableList<ContactModel> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<ContactModel> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$contactAtom = Atom(name: '_ContactsControllerBase.contact');

  @override
  ContactModel get contact {
    _$contactAtom.reportRead();
    return super.contact;
  }

  @override
  set contact(ContactModel value) {
    _$contactAtom.reportWrite(value, super.contact, () {
      super.contact = value;
    });
  }

  final _$addContactAsyncAction =
      AsyncAction('_ContactsControllerBase.addContact');

  @override
  Future addContact() {
    return _$addContactAsyncAction.run(() => super.addContact());
  }

  final _$removeContactAsyncAction =
      AsyncAction('_ContactsControllerBase.removeContact');

  @override
  Future<int> removeContact() {
    return _$removeContactAsyncAction.run(() => super.removeContact());
  }

  final _$findPortalCodeAsyncAction =
      AsyncAction('_ContactsControllerBase.findPortalCode');

  @override
  Future findPortalCode() {
    return _$findPortalCodeAsyncAction.run(() => super.findPortalCode());
  }

  final _$_ContactsControllerBaseActionController =
      ActionController(name: '_ContactsControllerBase');

  @override
  dynamic createContact() {
    final _$actionInfo = _$_ContactsControllerBaseActionController.startAction(
        name: '_ContactsControllerBase.createContact');
    try {
      return super.createContact();
    } finally {
      _$_ContactsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setContact(ContactModel contact) {
    final _$actionInfo = _$_ContactsControllerBaseActionController.startAction(
        name: '_ContactsControllerBase.setContact');
    try {
      return super.setContact(contact);
    } finally {
      _$_ContactsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updatePostalCode(String value) {
    final _$actionInfo = _$_ContactsControllerBaseActionController.startAction(
        name: '_ContactsControllerBase.updatePostalCode');
    try {
      return super.updatePostalCode(value);
    } finally {
      _$_ContactsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list},
contact: ${contact}
    ''';
  }
}
