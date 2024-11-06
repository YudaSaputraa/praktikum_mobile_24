import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:modul_3/models/boxes.dart';
import 'package:modul_3/models/todo.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  validated() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _onFromSubmit();
      print("form validated");
    } else {
      print("form not validated");
      return;
    }
  }

  late String title;
  late String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  onChanged: (value) {
                    title = value;
                  },
                  autofocus: false,
                  decoration: const InputDecoration(
                    label: Text("title"),
                  ),
                  validator: (String? value) {
                    if (value == null || value.trim().length == 0) {
                      return "Required";
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  autofocus: false,
                  onChanged: (value) {
                    description = value;
                  },
                  decoration: const InputDecoration(
                    label: Text("Description"),
                  ),
                  validator: (String? value) {
                    if (value == null || value.trim().length == 0) {
                      return "Required";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      validated();
                    },
                    child: const Text("Add Todo"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onFromSubmit() {
    Box<Todo> todoBox = Hive.box<Todo>(HiveBoxex.todo);
    todoBox.add(Todo(title: title, description: description));
    Navigator.of(context).pop();
    print(todoBox);
  }
}
