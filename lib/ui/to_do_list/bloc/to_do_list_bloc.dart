import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vedita_learning2/ui/widgets/widgets.dart';

part 'to_do_list_event.dart';
part 'to_do_list_state.dart';

class ToDoListBloc extends Bloc<ToDoListEvent, ToDoListState> {
  ToDoListBloc():super(ToDoListState.initial());

  void _onChangeDate(ChangeDate event,
      Emitter<ToDoListState> emit,){
    return emit(state.copyWith(date: event.newDate));
  }
}
