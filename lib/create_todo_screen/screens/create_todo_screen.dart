import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realm_demo/create_todo_screen/bloc/create_update_delete_todo_bloc/create_update_delete_bloc.dart';
import 'package:realm_demo/home_screen/bloc/get_todo_list_bloc/get_todo_list_bloc.dart';
import 'package:realm_demo/utils/database/database_model.dart';

class CreateTodoScreen extends StatefulWidget {
  const CreateTodoScreen({super.key, this.todo});

  final Todo? todo;

  @override
  State<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  void initState() {
    if (widget.todo != null) {
      title.text = widget.todo?.title ?? "";
      description.text = widget.todo?.description ?? "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateUpdateDeleteBloc, CreateUpdateDeleteState>(
        listener: (context, state) {
          if (state is CreateUpdateDeleteSuccess) {
            BlocProvider.of<GetTodoListBloc>(context).add(GetList());
            Navigator.pop(context);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            actions: [
              if (widget.todo != null)
                IconButton(
                    onPressed: () {
                      BlocProvider.of<CreateUpdateDeleteBloc>(context).add(
                          DeleteTodo(
                              todo: widget.todo!));
                    },
                    icon: const Icon(Icons.delete))
            ],
            title: Text(widget.todo != null ? "Update" : "Create"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: title,
                  decoration: const InputDecoration(hintText: "Title"),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: description,
                  decoration: const InputDecoration(hintText: "Description"),
                ),
                const SizedBox(height: 10),
                MaterialButton(
                    onPressed: () {
                      if (widget.todo != null) {
                        BlocProvider.of<CreateUpdateDeleteBloc>(context).add(
                            UpdateTodo(
                                title: title.text.trim() ?? "",
                                description: description.text.trim() ?? "",
                                id: widget.todo?.isbn10 ?? ""));
                      } else {
                        BlocProvider.of<CreateUpdateDeleteBloc>(context).add(
                            CreateTodo(
                                title: title.text.trim() ?? "",
                                description: description.text.trim() ?? ""));
                      }
                    },
                    child: Text(widget.todo != null ? "Update todo" : "Create todo")),
              ],
            ),
          ),
        ));
  }
}
