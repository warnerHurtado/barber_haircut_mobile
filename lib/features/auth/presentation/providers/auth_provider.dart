import 'package:barber_haircut_mobile/features/auth/domain/domain.dart';
import 'package:barber_haircut_mobile/features/auth/infrastructure/infrastructure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = AuthRepositoryImp();
  return AuthNotifier(authRepository: authRepository);
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;

  AuthNotifier({required this.authRepository}) : super(AuthState());

  Future<void> loginUser(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final user = await authRepository.login(email, password);
      _setLoggedUser(user);
    } on WrongCredentials {
      logout('Incorrect credentials');
    } on ConnectionTimeout {
      logout('Check intenernet connection');
    } on NextworkError {
      logout('Check intenernet connection');
    } catch (e) {
      logout('Unhandled error, notify this error to the admin.');
    }
  }

  Future<void> registerUser(String email, String password) async {}
  Future<void> checkAuthStatus() async {}

  Future<void> logout(String errorMessage) async {
    //TODO: CLEAN TOKEN

    state = state.copyWith(
        authStatus: AuthStatus.notAuthenticated,
        user: null,
        errorMessage: errorMessage);
  }

  void _setLoggedUser(User user) {
    //TODO: SAVE THE TOKEN WITH USER PREFERENCES
    state = state.copyWith(
      user: user,
      errorMessage: '',
      authStatus: AuthStatus.authenticated,
    );
  }
}

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthState {
  final AuthStatus authStatus;
  final User? user;
  final String errorMessage;

  AuthState(
      {this.authStatus = AuthStatus.checking,
      this.user,
      this.errorMessage = ''});

  AuthState copyWith(
          {AuthStatus? authStatus, User? user, String? errorMessage}) =>
      AuthState(
          authStatus: authStatus ?? this.authStatus,
          user: user ?? this.user,
          errorMessage: errorMessage ?? this.errorMessage);
}
