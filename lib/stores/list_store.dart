import 'package:mobx/mobx.dart';

part 'list_store.g.dart';

class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store {

  @observable
  String newTodo = '';

  ObservableList<String> todoList = ObservableList<String>();

  @action
  void setNewTodo(String value) => newTodo = value;

  @action
  void addNewTodo() {
    todoList.add(newTodo);
    newTodo = '';  
  }

  @computed
  bool get isFormValid => newTodo.isNotEmpty;
}