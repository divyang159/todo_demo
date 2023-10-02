import 'package:bloc/bloc.dart';
import 'package:realm/realm.dart';

import '../../../main.dart';
import '../../../utils/database/database_model.dart';

part 'get_todo_list_event.dart';

part 'get_todo_list_state.dart';

class GetTodoListBloc extends Bloc<GetTodoListEvent, GetTodoListState> {
  GetTodoListBloc() : super(GetTodoListInitial()) {
    on<GetList>((event, emit) {
      final data = realm.all<Todo>();

      emit(GetTodoListLoaded(data: data));
    });
  }
}
