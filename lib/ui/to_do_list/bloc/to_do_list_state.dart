part of 'to_do_list_bloc.dart';

class ToDoListState extends Equatable {
  final DateTime _date;
  String get month => _date.getMonthName();
  String get year => _date.year.toString();
  const ToDoListState._({required DateTime date}):_date = date;
  ToDoListState.initial()
      : this._(date: DateTime.now());

  ToDoListState copyWith({DateTime? date}) {
    return ToDoListState._(date: date ?? _date);
  }



  @override
  List<Object?> get props => [_date];
}
