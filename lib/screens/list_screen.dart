import 'package:flutter/material.dart';
import 'package:introducao_mobx/screens/login_screen.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
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
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return taskItem(title: 'Item $index');
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget taskItem({@required String title}) {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(title),
          ),
          Divider(),
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
          Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(hintText: 'Tarefa'),
            ),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          )
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