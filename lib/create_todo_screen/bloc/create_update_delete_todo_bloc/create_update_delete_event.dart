part of 'create_update_delete_bloc.dart';

abstract class CreateUpdateDeleteEvent {}

class CreateTodo extends CreateUpdateDeleteEvent {
  String title, description;

  CreateTodo({required this.title, required this.description});
}

class UpdateTodo extends CreateUpdateDeleteEvent {
  String title, description, id;

  UpdateTodo({required this.title, required this.description, required this.id});
}

class DeleteTodo extends CreateUpdateDeleteEvent {
  Todo todo;

  DeleteTodo({required this.todo});
}
