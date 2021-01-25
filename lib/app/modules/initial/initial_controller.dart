import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'initial_controller.g.dart';

@Injectable()
class InitialController = _InitialControllerBase with _$InitialController;

abstract class _InitialControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
