part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final User user;
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    User? user,
  }) : user = user ?? User.defaultUser;

  const AuthenticationState.unknown() : this._();
  const AuthenticationState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);
  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);
  const AuthenticationState.registering()
      : this._(status: AuthenticationStatus.registering);
  const AuthenticationState.failure()
      : this._(status: AuthenticationStatus.failure);

  @override
  List<Object?> get props => [status, user];
}
