import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realm/realm.dart';
import 'package:realm_demo/utils/database/database_model.dart';
import 'create_todo_screen/bloc/create_update_delete_todo_bloc/create_update_delete_bloc.dart';
import 'home_screen/bloc/get_todo_list_bloc/get_todo_list_bloc.dart';
import 'home_screen/screens/home_screen.dart';

late Realm realm;

void main() {
  final config = Configuration.local([Todo.schema]);
  realm = Realm(config);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetTodoListBloc>(
          create: (context) => GetTodoListBloc()..add(GetList()),
        ),
        BlocProvider<CreateUpdateDeleteBloc>(
          create: (context) => CreateUpdateDeleteBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
