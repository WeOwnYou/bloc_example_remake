import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:vedita_learning2/ui/authentication/widgets/widgets.dart';

class AuthenticationPage extends StatelessWidget {
  final AuthenticationStatus status;
  const AuthenticationPage({
    super.key,
    this.status = AuthenticationStatus.unknown,
  });

  @override
  Widget build(BuildContext context) {
    var enteringText = '';
    if (status == AuthenticationStatus.unauthenticated) {
      enteringText = 'Введите пин код';
    } else if (status == AuthenticationStatus.registering) {
      enteringText = 'Зарегестрируйте пин код';
    } else if (status == AuthenticationStatus.failure){
      enteringText = 'Неверный пин код';
    }
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SafeArea(
              child: Text(enteringText),
            ),
          ),
          const Expanded(
            flex: 2, //3?
            child: BuildPinDotesWidget(),
          ),
          const Expanded(
            flex: 12,
            child: BuildNumPadWidget(),
          ),
        ],
      ),
    );
  }
}

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('cool'),
      ),
    );
  }
}
