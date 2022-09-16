// part of 'login_bloc.dart';
//
// enum LoginStatus { initial, inProgress, failure }
//
// class LoginState extends Equatable {
//   final String pin;
//   final LoginStatus status;
//
//   const LoginState({this.status = LoginStatus.initial, String? pin})
//       : pin = pin ?? '';
//
//   LoginState copyWith(LoginStatus? status, String? pin) {
//     return LoginState(
//       status: status ?? this.status,
//       pin: pin ?? this.pin,
//     );
//   }
//
//   @override
//   List<Object?> get props => [pin, status];
// }
