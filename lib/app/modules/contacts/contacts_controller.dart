import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'contacts_controller.g.dart';

@Injectable()
class ContactsController = _ContactsControllerBase with _$ContactsController;

abstract class _ContactsControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
