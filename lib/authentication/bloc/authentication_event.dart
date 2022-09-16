part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object?> get props => [];
}

class AuthenticationStatusChanged extends AuthenticationEvent {
  final AuthenticationStatus status;

  const AuthenticationStatusChanged(this.status);

  @override
  List<Object?> get props => [status];
}

class PinSubmitted extends AuthenticationEvent{
  final String pin;

  const PinSubmitted(this.pin);

  @override
  List<Object?> get props => [pin];
}

class AuthenticationLogoutRequested extends AuthenticationEvent {}
