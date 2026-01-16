import 'package:flutter/material.dart';
import 'package:todo_challange/core/todo_app.dart';
import 'package:todo_challange/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const TodoApp());
}
