import 'package:introducao_mobx/stores/todo_store.dart';
import 'package:mobx/mobx.dart';

part 'list_store.g.dart';

class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store {
  @observable
  String newTodo = '';

  ObservableList<TodoStore> todoList = ObservableList<TodoStore>();

  @action
  void setNewTodo(String value) => newTodo = value;

  @action
  void addNewTodo() {
    todoList.insert(0, TodoStore(newTodo));
    newTodo = '';
  }

  @computed
  bool get isFormValid => newTodo.isNotEmpty;
}
