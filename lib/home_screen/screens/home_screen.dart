import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../create_todo_screen/screens/create_todo_screen.dart';
import '../bloc/get_todo_list_bloc/get_todo_list_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Todo")),
      body: BlocBuilder<GetTodoListBloc, GetTodoListState>(
        builder: (context, state) {
          if (state is GetTodoListInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetTodoListLoaded) {
            return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                     CreateTodoScreen(
                                          todo: state.data[index]),
                                    ));
                      },
                      title: Text(state.data[index].title));
                });
          } else {
            return const Center(child: Text("error"));
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CreateTodoScreen()));
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
