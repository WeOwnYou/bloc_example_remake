import 'package:authentication_repository/authentication_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vedita_learning2/authentication/authentication.dart';

class AuthenticationPage extends StatelessWidget {
  final AuthenticationStatus status;
  const AuthenticationPage({super.key, this.status = AuthenticationStatus.unknown});

  @override
  Widget build(BuildContext context) {
    final textEditingController = TextEditingController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: textEditingController,
          ),
          Text(status.toString()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context
              .read<AuthenticationBloc>()
              .add(PinSubmitted(textEditingController.text));
        },
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
