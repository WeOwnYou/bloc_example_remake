import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_repository/hive_repository.dart';
import 'package:user_repository/user_repository.dart';
import 'app.dart';

void main() async {
  Hive
    ..registerAdapter(TaskTypesAdapter())
    ..registerAdapter(TimeOfDayAdapter());
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(
      hiveRepository: HiveRepository(),
      authenticationRepository: AuthenticationRepository(),
      userRepository: UserRepository(),
    ),
  );
}
