part of 'home_bloc.dart';

class HomePageState extends Equatable {
  final String categoryName;
  final int? selectedDotIndex;

  const HomePageState._({
    this.categoryName = 'My tasks',
    this.selectedDotIndex,
  });

  const HomePageState.initial() : this._();

  HomePageState copyWith({
    String? categoryName,
    int? activeProjectId,
    int? selectedDotIndex,
  }) {
    return HomePageState._(
      categoryName: categoryName ?? this.categoryName,
      selectedDotIndex: selectedDotIndex ?? this.selectedDotIndex,
    );
  }

  @override
  List<Object?> get props => [categoryName, selectedDotIndex];
}
