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
          status: args.status,
        ),
      );
    },
    MainScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MainScreenRouteArgs>();
      return MaterialPageX<void>(
        routeData: routeData,
        child: WrappedRoute(
            child: BottomNavBarPage(
          key: args.key,
          hiveRepository: args.hiveRepository,
          userRepository: args.userRepository,
        )),
      );
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<void>(
        routeData: routeData,
        child: WrappedRoute(child: const HomePage()),
      );
    },
    ToDoListRoute.name: (routeData) {
      return MaterialPageX<void>(
        routeData: routeData,
        child: const ToDoListPage(),
      );
    },
    NotificationsRoute.name: (routeData) {
      return MaterialPageX<void>(
        routeData: routeData,
        child: const NotificationsPage(),
      );
    },
    SearchRoute.name: (routeData) {
      return MaterialPageX<void>(
        routeData: routeData,
        child: const SearchPage(),
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
          MainScreenRoute.name,
          path: 'main_screen',
          children: [
            RouteConfig(
              '#redirect',
              path: '',
              parent: MainScreenRoute.name,
              redirectTo: 'home_page',
              fullMatch: true,
            ),
            RouteConfig(
              HomeRoute.name,
              path: 'home_page',
              parent: MainScreenRoute.name,
            ),
            RouteConfig(
              ToDoListRoute.name,
              path: 'to_do_list_page',
              parent: MainScreenRoute.name,
            ),
            RouteConfig(
              NotificationsRoute.name,
              path: 'notifications_page',
              parent: MainScreenRoute.name,
            ),
            RouteConfig(
              SearchRoute.name,
              path: 'search_page',
              parent: MainScreenRoute.name,
            ),
          ],
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
            status: status,
          ),
        );

  static const String name = 'AuthenticationRoute';
}

class AuthenticationRouteArgs {
  const AuthenticationRouteArgs({
    this.key,
    this.status = AuthenticationStatus.unknown,
  });

  final Key? key;

  final AuthenticationStatus status;

  @override
  String toString() {
    return 'AuthenticationRouteArgs{key: $key, status: $status}';
  }
}

/// generated route for
/// [BottomNavBarPage]
class MainScreenRoute extends PageRouteInfo<MainScreenRouteArgs> {
  MainScreenRoute({
    Key? key,
    required HiveRepository hiveRepository,
    required UserRepository userRepository,
    List<PageRouteInfo>? children,
  }) : super(
          MainScreenRoute.name,
          path: 'main_screen',
          args: MainScreenRouteArgs(
            key: key,
            hiveRepository: hiveRepository,
            userRepository: userRepository,
          ),
          initialChildren: children,
        );

  static const String name = 'MainScreenRoute';
}

class MainScreenRouteArgs {
  const MainScreenRouteArgs({
    this.key,
    required this.hiveRepository,
    required this.userRepository,
  });

  final Key? key;

  final HiveRepository hiveRepository;

  final UserRepository userRepository;

  @override
  String toString() {
    return 'MainScreenRouteArgs{key: $key, hiveRepository: $hiveRepository, userRepository: $userRepository}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home_page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [ToDoListPage]
class ToDoListRoute extends PageRouteInfo<void> {
  const ToDoListRoute()
      : super(
          ToDoListRoute.name,
          path: 'to_do_list_page',
        );

  static const String name = 'ToDoListRoute';
}

/// generated route for
/// [NotificationsPage]
class NotificationsRoute extends PageRouteInfo<void> {
  const NotificationsRoute()
      : super(
          NotificationsRoute.name,
          path: 'notifications_page',
        );

  static const String name = 'NotificationsRoute';
}

/// generated route for
/// [SearchPage]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute()
      : super(
          SearchRoute.name,
          path: 'search_page',
        );

  static const String name = 'SearchRoute';
}
