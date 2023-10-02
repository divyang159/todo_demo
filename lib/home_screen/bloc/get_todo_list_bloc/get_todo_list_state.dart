part of 'get_todo_list_bloc.dart';

abstract class GetTodoListState {}

class GetTodoListInitial extends GetTodoListState {}

class GetTodoListLoaded extends GetTodoListState {
  RealmResults<Todo> data;

  GetTodoListLoaded({required this.data});
}

class GetTodoListError extends GetTodoListState {}
