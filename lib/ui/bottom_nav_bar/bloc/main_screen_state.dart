part of 'main_screen_bloc.dart';

class MainScreenState extends Equatable {
  final StorageStatus status;
  final User user;
  final List<Project>? projects;
  final List<Task>? tasks;
  final int? activeProjectId;

  const MainScreenState._({
    this.status = StorageStatus.loading,
    required this.user,
    this.projects,
    this.tasks,
    this.activeProjectId,
  });

  MainScreenState.loading() : this._(user: User(name: 'default', uuid: '-'));
  const MainScreenState.empty(User user)
      : this._(user: user, status: StorageStatus.empty);
  MainScreenState.data({
    required User user,
    required List<Project> projects,
    required List<Task> tasks,
  }) : this._(
          user: user,
          status: StorageStatus.initial,
          projects: projects,
          tasks: tasks,
          activeProjectId: projects.first.id,
        );

  MainScreenState copyWith({
    StorageStatus? status,
    User? user,
    List<Project>? projects,
    List<Task>? tasks,
    int? categoryId,
    int? activeProjectId,
    int? selectedDotIndex,
  }) {
    return MainScreenState._(
      status: status ?? this.status,
      user: user ?? this.user,
      projects: projects ?? this.projects,
      tasks: tasks ?? this.tasks,
      activeProjectId: activeProjectId ?? this.activeProjectId,
    );
  }

  @override
  List<Object?> get props => [
        status,
        user,
        projects,
        tasks,
        activeProjectId,
      ];
}
