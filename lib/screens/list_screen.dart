import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:introducao_mobx/screens/login_screen.dart';
import 'package:introducao_mobx/stores/list_store.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  ListStore listStore = ListStore();
  TextEditingController todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: customBody(),
      ),
    );
  }

  Widget customBody() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          listHeader(),
          Expanded(child: customList()),
        ],
      ),
    );
  }

  Widget customList() {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: <Widget>[
          listTextField(),
          Expanded(
            child: Observer(
              builder: (_) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: listStore.todoList.length,
                  itemBuilder: (context, index) {
                    final todo = listStore.todoList[index];
                    return Observer(
                      builder: (_) {
                        return ListTile(
                          onTap: todo.toggleDone,
                          title: Text(
                            todo.title,
                            style: TextStyle(
                              color: todo.done ? Colors.grey : Colors.black,
                              decoration:
                                  todo.done ? TextDecoration.lineThrough : null,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  separatorBuilder: (_, __) {
                    return Divider();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget listTextField() {
    return Container(
      padding: EdgeInsets.only(left: 10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: <Widget>[
          Observer(
            builder: (_) {
              return Expanded(
                child: TextField(
                  controller: todoController,
                  onChanged: listStore.setNewTodo,
                  decoration: InputDecoration.collapsed(hintText: 'Tarefa'),
                ),
              );
            },
          ),
          Observer(
            builder: (_) {
              return IconButton(
                icon: Icon(Icons.add),
                onPressed: listStore.isFormValid ? () {
                  listStore.addNewTodo();
                  todoController.clear();
                } : null,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget listHeader() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Tarefas',
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: goToLoginScreen,
          ),
        ],
      ),
    );
  }

  void goToLoginScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }
}
