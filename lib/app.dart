import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';
import 'package:vedita_learning2/authentication/authentication.dart';
import 'package:vedita_learning2/navigation/router.dart';

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  final AuthenticationRepository authenticationRepository;
  const MyApp({
    super.key,
    required this.userRepository,
    required this.authenticationRepository,
  });
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthenticationRepository>.value(
      value: authenticationRepository,
      child: BlocProvider<AuthenticationBloc>(
        create: (_) => AuthenticationBloc(
          authenticationRepository: authenticationRepository,
          userRepository: userRepository,
        ),
        child: MaterialApp.router(
          routerDelegate: AppRouter.instance().delegate(),
          routeInformationParser: AppRouter.instance().defaultRouteParser(),
          builder: buildBlocListener,
        ),
      ),
    );
  }

  Widget buildBlocListener(BuildContext context, Widget? child) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        switch (state.status) {
          case AuthenticationStatus.unknown:
            break;
          case AuthenticationStatus.authenticated:
            AppRouter.instance().replace(const TestRoute());
            break;
          case AuthenticationStatus.unauthenticated:
            AppRouter.instance().replace(AuthenticationRoute(status: state.status));
            break;
          case AuthenticationStatus.registering:
            AppRouter.instance().replace(AuthenticationRoute(status: state.status));
            break;
          case AuthenticationStatus.failure:
            print('fail');
            AppRouter.instance().replace(AuthenticationRoute(status: state.status));
            break;
        }
      },
      child: child,
    );
  }
}
