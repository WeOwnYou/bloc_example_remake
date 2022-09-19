import 'package:hive/hive.dart';
part 'project.g.dart';

@HiveType(typeId: 1)
class Project extends HiveObject {
  @HiveField(0)
  String projectTitle;
  @HiveField(1)
  bool? isDone = false;
  @HiveField(2)
  DateTime dateTime;

  Project({required this.projectTitle, this.isDone, required this.dateTime});
}
