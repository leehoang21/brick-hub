part of 'auth_cubit.dart';

enum AuthenticationStatus { unknown, authenticated, unAuthenticated }

class AuthenticationState extends Equatable {
  const AuthenticationState._(this.user, {this.status = AuthenticationStatus.unknown});

  const AuthenticationState.unknown() : this._(null);

  const AuthenticationState.unauthenticated() : this._(null, status: AuthenticationStatus.unAuthenticated);

  const AuthenticationState.authenticated(UserAuthEntity user)
      : this._(user, status: AuthenticationStatus.authenticated);

  final AuthenticationStatus status;
  final UserAuthEntity? user;

  @override
  List<Object?> get props => [status, user];
}
