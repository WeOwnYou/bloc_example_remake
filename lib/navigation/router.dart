import 'package:authentication_repository/authentication_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vedita_learning2/authentication/authentication.dart';
import 'package:vedita_learning2/authentication/view/authentication_page.dart';

part 'router.gr.dart';

abstract class Routes {
  static const authScreen = 'auth_screen';
}

@MaterialAutoRouter(
  replaceInRouteName: 'Page|View|Screen,Route',
  routes: [
    AutoRoute<void>(
      path: Routes.authScreen,
      initial: true,
      page: AuthenticationPage,
    ),
    AutoRoute<void>(
      path: 'test',
      page: TestPage,
    )
  ],
)
class AppRouter extends _$AppRouter {
  static final AppRouter _router = AppRouter._();

  AppRouter._();

  factory AppRouter.instance() => _router;
}
