import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_repository/hive_repository.dart';
import 'package:user_repository/user_repository.dart' hide User;

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomePageEvent, HomePageState> {
  final UserRepository _userRepository;
  final HiveRepository _hiveRepository;
  late final StreamSubscription<ProjectsStorageStatus> _homePageStatusSubscription;
  HomeBloc({
    required UserRepository userRepository,
    required HiveRepository hiveRepository,
  })  : _hiveRepository = hiveRepository,
        _userRepository = userRepository,
        super(HomePageState.loading()) {
    // on<ChangeUsername>()
    // on<AddProject>
    // _homePageStatusSubscription = state.status.
    on<HomePageStatusChanged>(_onAuthenticationStatusChanged);
    _homePageStatusSubscription = _hiveRepository.status.listen((status) {
      add(HomePageStatusChanged(status));
    });
  }

  Future<void>_onAuthenticationStatusChanged(
      HomePageStatusChanged event,
      Emitter<HomePageState> emit,
      ) async{
    print('!');
  }

  void dispose() {
    _homePageStatusSubscription.cancel();
    _hiveRepository.dispose();
  }
}
