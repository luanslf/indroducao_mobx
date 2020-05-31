import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {

  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  bool obscurePassword = true;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void setObscurePassword() => obscurePassword = !obscurePassword;

  @computed
  bool get isPasswordObscure => obscurePassword != false;
  
  @computed
  bool get isEmailValid => email.length >= 6;

  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  bool get isFormValid => isEmailValid && isPasswordValid;
}