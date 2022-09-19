part of 'home_bloc.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();
  @override
  List<Object?> get props => [];
}

class HomePageStatusChanged extends HomePageEvent {
  final ProjectsStorageStatus status;
  const HomePageStatusChanged (this.status);
  @override
  List<Object?> get props => [status];
}

class ChangeUsername extends HomePageEvent {
  final String newUsername;
  const ChangeUsername(this.newUsername);
  @override
  List<Object?> get props => [newUsername];
}

class AddProject extends HomePageEvent {
  final Project project;
  const AddProject(this.project);
  @override
  List<Object?> get props => [project];
}

class ScrollProjectLine extends HomePageEvent {
  final double pixelsScrolled;
  const ScrollProjectLine(this.pixelsScrolled);
  @override
  List<Object?> get props => [pixelsScrolled];
}

class ChangeSelectedDot extends HomePageEvent {
  final int newSelectedDot;
  const ChangeSelectedDot(this.newSelectedDot);
  @override
  List<Object?> get props => [newSelectedDot];
}

class ChangeProject extends HomePageEvent {
  final int newProjectId;
  const ChangeProject(this.newProjectId);
  @override
  List<Object?> get props => [newProjectId];
}

class RemoveProject extends HomePageEvent {
  final int projectId;
  const RemoveProject(this.projectId);
  @override
  List<Object?> get props => [projectId];
}

class ChangeCategory extends HomePageEvent {
  final int categoryId;
  const ChangeCategory(this.categoryId);
  @override
  List<Object?> get props => [categoryId];
}
