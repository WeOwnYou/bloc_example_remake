import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_repository/hive_repository.dart';
import 'package:hive_repository/src/hive_provider.dart';
import 'package:hive_repository/src/models/models.dart';

enum ProjectsStorageStatus { empty, initial, loading }

class HiveRepository {
  final _controller = StreamController<ProjectsStorageStatus>();
  ValueListenable<Box<Project>>? _projectListenable;
  ValueListenable<Box<Task>>? _taskListenable;
  late final Future<Box<Project>> _projectBox;
  late final Future<Box<Task>> _taskBox;
  List<Project> _projects = [];
  List<Task> _tasks = [];
  int? _activeProjectKey;

  HiveRepository() {
    print('da');
    _loadData();
  }

  Stream<ProjectsStorageStatus> get status async*{
    print('load');
    yield ProjectsStorageStatus.loading;

    if(_projects.isEmpty) {
      print('netu');
      yield ProjectsStorageStatus.empty;
    } else {
      print('est');
      yield ProjectsStorageStatus.initial;
    }
    yield* _controller.stream;
  }

  int? get activeProjectKey => _activeProjectKey;
  List<Task> get tasks => _tasks;
  List<Project> get projects => _projects;

  Stream<ProjectsStorageStatus> _loadData() async* {
    await _setProjectBox();
    if ((await _projectBox).isEmpty) return;
    await _readProjectsFromHive();
    _activeProjectKey = (await _projectBox).keys.cast<int>().first;
    await _setTaskBox();
    await _readTasksFromHive();
  }

  Future<void> _setProjectBox() async {
    _projectBox = HiveProvider.instance.openProjectBox();
    _projectListenable = (await _projectBox).listenable();
    _projectListenable?.addListener(_readProjectsFromHive);
  }

  Future<void> _readProjectsFromHive() async {
    _projects = (await _projectBox).values.toList(); //кинуть евент?
    _activeProjectKey ??= (await _projectBox).keys.cast<int>().first;
  }

  Future<void> _setTaskBox() async {
    _taskBox = HiveProvider.instance.openTaskBox(_activeProjectKey!);
    await _readTasksFromHive();
    _taskListenable = (await _taskBox).listenable();
    _taskListenable?.addListener(_readTasksFromHive);
  }

  Future<void> _readTasksFromHive() async {
    _tasks = (await _taskBox).values.toList(); //кидать евент
  }

  Future<void> addProject(Project newProject) async {
    //кидать ошибки или еще че
    if (newProject.projectTitle == '') return;
    for (final project in _projects) {
      if (project.projectTitle == newProject.projectTitle) return;
    }
    await (await _projectBox).add(newProject);
    await (await _projectBox).compact();
    await _readProjectsFromHive();
    // await HiveProvider.instance.openProjectBox(); //?
  }

  Future<void> removeProject() async {
    if (_activeProjectKey == null) return;
    await (await _taskBox).clear();
    await (await _taskBox).deleteFromDisk();
    await (await _projectBox).deleteAt(_activeProjectKey!);
    await _setTaskBox();
  }

  Future<void> changeProject(int newProjectKey) async {
    if (newProjectKey == _activeProjectKey) return;
    _activeProjectKey = newProjectKey;
    await _setTaskBox();
  }

  Future<void> addTask(Task newTask) async {
    if (_activeProjectKey == null) return;
    await (await _taskBox).add(newTask);
    await (await _taskBox).compact();
    await _readTasksFromHive();
  }

  Future<void> removeTask(int index) async {
    await (await _taskBox).deleteAt(index);
    await (await _taskBox).compact();
  }

  void dispose() => _controller.close();
}
