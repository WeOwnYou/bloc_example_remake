import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_repository/hive_repository.dart';
import 'package:user_repository/user_repository.dart';
import 'package:vedita_learning2/ui/home/bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  final UserRepository userRepository;
  final HiveRepository hiveRepository;
  const HomePage({
    super.key,
    required this.userRepository,
    required this.hiveRepository,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<HomeBloc>(
        create: (_) => HomeBloc(
          userRepository: userRepository,
          hiveRepository: hiveRepository,
        ),
        child: const Center(
          child: Text('HomePage'),
        ),
      ),
    );
  }
}
