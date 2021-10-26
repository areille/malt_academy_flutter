import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'todo.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({Key? key}) : super(key: key);

  Future<List<Todo>> fetchTodos() async {
    final response =
        await get(Uri.parse('http://jsonplaceholder.typicode.com/todos'));
    final jsonResult = jsonDecode(response.body) as List<dynamic>;
    return jsonResult.map((e) => Todo.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todos')),
      body: FutureBuilder<List<Todo>>(
        future: fetchTodos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final todo = snapshot.data![index];
                  return ListTile(
                    leading: Checkbox(value: todo.completed, onChanged: (_) {}),
                    title: Text(todo.title),
                  );
                });
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
