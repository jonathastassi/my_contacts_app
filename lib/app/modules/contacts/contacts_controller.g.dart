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

  final _$addressControllerAtom =
      Atom(name: '_ContactsControllerBase.addressController');

  @override
  TextEditingController get addressController {
    _$addressControllerAtom.reportRead();
    return super.addressController;
  }

  @override
  set addressController(TextEditingController value) {
    _$addressControllerAtom.reportWrite(value, super.addressController, () {
      super.addressController = value;
    });
  }

  final _$neighborhoodControllerAtom =
      Atom(name: '_ContactsControllerBase.neighborhoodController');

  @override
  TextEditingController get neighborhoodController {
    _$neighborhoodControllerAtom.reportRead();
    return super.neighborhoodController;
  }

  @override
  set neighborhoodController(TextEditingController value) {
    _$neighborhoodControllerAtom
        .reportWrite(value, super.neighborhoodController, () {
      super.neighborhoodController = value;
    });
  }

  final _$cityControllerAtom =
      Atom(name: '_ContactsControllerBase.cityController');

  @override
  TextEditingController get cityController {
    _$cityControllerAtom.reportRead();
    return super.cityController;
  }

  @override
  set cityController(TextEditingController value) {
    _$cityControllerAtom.reportWrite(value, super.cityController, () {
      super.cityController = value;
    });
  }

  final _$stateControllerAtom =
      Atom(name: '_ContactsControllerBase.stateController');

  @override
  TextEditingController get stateController {
    _$stateControllerAtom.reportRead();
    return super.stateController;
  }

  @override
  set stateController(TextEditingController value) {
    _$stateControllerAtom.reportWrite(value, super.stateController, () {
      super.stateController = value;
    });
  }

  final _$submitFormContactAsyncAction =
      AsyncAction('_ContactsControllerBase.submitFormContact');

  @override
  Future submitFormContact() {
    return _$submitFormContactAsyncAction.run(() => super.submitFormContact());
  }

  final _$getByIdAsyncAction = AsyncAction('_ContactsControllerBase.getById');

  @override
  Future getById(int id) {
    return _$getByIdAsyncAction.run(() => super.getById(id));
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
  dynamic setControllersWithModel(ContactModel contact) {
    final _$actionInfo = _$_ContactsControllerBaseActionController.startAction(
        name: '_ContactsControllerBase.setControllersWithModel');
    try {
      return super.setControllersWithModel(contact);
    } finally {
      _$_ContactsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list},
contact: ${contact},
addressController: ${addressController},
neighborhoodController: ${neighborhoodController},
cityController: ${cityController},
stateController: ${stateController}
    ''';
  }
}
