// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthenticationRoute.name: (routeData) {
      final args = routeData.argsAs<AuthenticationRouteArgs>(
          orElse: () => const AuthenticationRouteArgs());
      return MaterialPageX<void>(
        routeData: routeData,
        child: AuthenticationPage(
          key: args.key,
          status: args.authenticationStatus,
        ),
      );
    },
    TestRoute.name: (routeData) {
      return MaterialPageX<void>(
        routeData: routeData,
        child: const TestPage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'auth_screen',
          fullMatch: true,
        ),
        RouteConfig(
          AuthenticationRoute.name,
          path: 'auth_screen',
        ),
        RouteConfig(
          TestRoute.name,
          path: 'test',
        ),
      ];
}

/// generated route for
/// [AuthenticationPage]
class AuthenticationRoute extends PageRouteInfo<AuthenticationRouteArgs> {
  AuthenticationRoute({
    Key? key,
    AuthenticationStatus status = AuthenticationStatus.unknown,
  }) : super(
          AuthenticationRoute.name,
          path: 'auth_screen',
          args: AuthenticationRouteArgs(
            key: key,
            authenticationStatus: status,
          ),
        );

  static const String name = 'AuthenticationRoute';
}

class AuthenticationRouteArgs {
  const AuthenticationRouteArgs({
    this.key,
    this.authenticationStatus = AuthenticationStatus.unknown,
  });

  final Key? key;

  final AuthenticationStatus authenticationStatus;

  @override
  String toString() {
    return 'AuthenticationRouteArgs{key: $key, authenticationStatus: $authenticationStatus}';
  }
}

/// generated route for
/// [TestPage]
class TestRoute extends PageRouteInfo<void> {
  const TestRoute()
      : super(
          TestRoute.name,
          path: 'test',
        );

  static const String name = 'TestRoute';
}
