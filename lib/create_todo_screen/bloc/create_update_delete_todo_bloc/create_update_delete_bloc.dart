import 'package:bloc/bloc.dart';
import 'package:realm/realm.dart';

import '../../../main.dart';
import '../../../utils/database/database_model.dart';

part 'create_update_delete_event.dart';

part 'create_update_delete_state.dart';

class CreateUpdateDeleteBloc
    extends Bloc<CreateUpdateDeleteEvent, CreateUpdateDeleteState> {
  CreateUpdateDeleteBloc() : super(CreateUpdateDeleteInitial()) {
    on<CreateTodo>((event, emit) {
      realm.write(() => realm.add(Todo(ObjectId().hexString, event.title,
          description: event.description)));

      emit(CreateUpdateDeleteSuccess());
    });
    on<UpdateTodo>((event, emit) {
      realm.write(() => realm.add(
          Todo(event.id, event.title, description: event.description),
          update: true));
      emit(CreateUpdateDeleteSuccess());
    });
    on<DeleteTodo>((event, emit) {
      realm.write(() => realm.delete(event.todo));
      emit(CreateUpdateDeleteSuccess());
    });
  }
}
