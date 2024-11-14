import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:modul_3/models/boxes.dart';
import 'package:modul_3/models/todo.dart';
import 'package:modul_3/views/camera_access/camera_access_screen.dart';
import 'package:modul_3/views/shared_pref/shared_pref.dart';
import 'package:modul_3/views/todolist/todo_list_screen.dart';

void main() async {
  await Hive.initFlutter(); // beda dari modul, di modul gaada await
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox<Todo>(HiveBoxex.todo);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
        home: CameraAccessScreen()
    );
  }
}
