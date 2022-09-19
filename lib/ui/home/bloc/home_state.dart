part of 'home_bloc.dart';

class HomePageState extends Equatable {
  final ProjectsStorageStatus status;
  final User user;
  final List<Project>? projects;
  final List<Task>? tasks;
  final int categoryId;
  final int? activeProjectId;
  final int? selectedDotIndex;

  HomePageState._({
    this.status = ProjectsStorageStatus.loading,
    required this.user,
    this.projects,
    this.tasks,
    this.categoryId = 1,
    this.activeProjectId = 1,
    this.selectedDotIndex = 1,
  });

  HomePageState.loading() : this._(user: User(name: '', uuid: ''));
  HomePageState.empty(User user)
      : this._(user: user, status: ProjectsStorageStatus.empty);
  HomePageState.data({
    required User user,
    required List<Project> projects,
    required List<Task> tasks,
  }) : this._(
          user: user,
          status: ProjectsStorageStatus.initial,
          projects: projects,
          tasks: tasks,
        );

  HomePageState copyWith({
    ProjectsStorageStatus? status,
    User? user,
    List<Project>? projects,
    List<Task>? tasks,
    int? categoryId,
    int? activeProjectId,
    int? selectedDotIndex,
  }) {
    return HomePageState._(
      status: status ?? this.status,
      user: user ?? this.user,
      projects: projects ?? this.projects,
      tasks: tasks ?? this.tasks,
      categoryId: categoryId ?? this.categoryId,
      activeProjectId: activeProjectId ?? this.activeProjectId,
      selectedDotIndex: selectedDotIndex ?? this.selectedDotIndex,
    );
  }

  @override
  List<Object?> get props => [
        status,
        user,
        projects,
        tasks,
        categoryId,
        activeProjectId,
        selectedDotIndex
      ];
}
