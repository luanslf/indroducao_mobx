import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  bool loggedIn = false;

  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  bool obscurePassword = true;

  @observable
  bool loading = false;

  @action
  Future<void> login() async {
    loading = true;

    await Future.delayed(Duration(seconds: 2));

    loading = false;
    loggedIn = true;

    email = '';
    password = '';
  }

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void setObscurePassword() => obscurePassword = !obscurePassword;

  @action
  void logOut() => loggedIn = false;

  @computed
  bool get isPasswordObscure => obscurePassword != false;

  @computed
  bool get isEmailValid => email.length >= 6;

  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  bool get isFormValid => isEmailValid && isPasswordValid;

  @computed
  bool get isLoading => loading == true;

  @computed
  Function get loginPressed => (isFormValid && !isLoading) ? login : null;
}
