import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive_repository/hive_repository.dart';
import 'package:user_repository/user_repository.dart';
import 'package:vedita_learning2/navigation/router.dart';

class BottomNavBarPage extends StatelessWidget {
  final HiveRepository hiveRepository;
  final UserRepository userRepository;
  const BottomNavBarPage({
    super.key,
    required this.hiveRepository,
    required this.userRepository,
  });

  @override
  Widget build(BuildContext context) {
    // print((hiveRepository == null).toString() + (userRepository == null).toString());
    // print(hiveRepository, userRepository)
    return AutoTabsScaffold(
      routes: [
        HomeRoute(
          // hiveRepository: hiveRepository,
          // userRepository: userRepository,
        ),
        const ToDoListRoute(),
        const NotificationsRoute(),
        const SearchRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.grey,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Schedule',
              icon: Icon(Icons.calendar_month),
            ),
            BottomNavigationBarItem(
              label: 'Notifications',
              icon: Icon(Icons.notifications),
            ),
            BottomNavigationBarItem(
              label: 'Search',
              icon: Icon(Icons.search),
            ),
          ],
        );
      },
    );
  }
}
