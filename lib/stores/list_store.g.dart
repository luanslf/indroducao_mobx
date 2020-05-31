// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListStore on _ListStore, Store {
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_ListStore.isFormValid'))
          .value;

  final _$newTodoAtom = Atom(name: '_ListStore.newTodo');

  @override
  String get newTodo {
    _$newTodoAtom.reportRead();
    return super.newTodo;
  }

  @override
  set newTodo(String value) {
    _$newTodoAtom.reportWrite(value, super.newTodo, () {
      super.newTodo = value;
    });
  }

  final _$_ListStoreActionController = ActionController(name: '_ListStore');

  @override
  void setNewTodo(String value) {
    final _$actionInfo =
        _$_ListStoreActionController.startAction(name: '_ListStore.setNewTodo');
    try {
      return super.setNewTodo(value);
    } finally {
      _$_ListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addNewTodo() {
    final _$actionInfo =
        _$_ListStoreActionController.startAction(name: '_ListStore.addNewTodo');
    try {
      return super.addNewTodo();
    } finally {
      _$_ListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newTodo: ${newTodo},
isFormValid: ${isFormValid}
    ''';
  }
}
