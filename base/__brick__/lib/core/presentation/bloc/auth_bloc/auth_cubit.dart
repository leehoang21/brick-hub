import 'package:equatable/equatable.dart';
import 'package:idolise/common/local_storage/local_storage.dart';
import 'package:idolise/features/auth/login/domain/entities/login_entity.dart';
import 'package:injectable/injectable.dart';
import '../base_bloc/base_bloc.dart';

part 'auth_state.dart';

@lazySingleton
class AuthenticationCubit extends BaseBloc<AuthenticationState> {
  AuthenticationCubit() : super(const AuthenticationState.unknown());

  @override
  void onInit() {}

  // Future<void> onAuthenticated() async {
  //   emit(const AuthenticationState.authenticated());
  // }

  // Future<void> updateUserProfile() async {
  //   emit(AuthenticationState.authenticated(user: user));
  // }

  Future<void> loginSuccess(UserAuthEntity user) async {
    LocalStorage.accessToken.val = user.token;
    emit(AuthenticationState.authenticated(user));
  }

  void logout() {
    emit(const AuthenticationState.unauthenticated());
  }

  // Future<void> onLogoutRequested() async {
  //   getIt.get<DialogBloc>().showOptionDialog(
  //       title: "Thông báo",
  //       message: "Bạn có chắc chắn muốn thoát?",
  //       acceptAction: () {
  //         LocalStorage.accessToken.val = '';
  //         emit(const AuthenticationState.unauthenticated());
  //       });
  // }

  // void navigatorInitRoute() {
  //   String accessToken = LocalStorage.accessToken.val;
  //   if (accessToken != '') {
  //     emit(const AuthenticationState.authenticated());
  //   } else {
  //     emit(const AuthenticationState.unauthenticated());
  //   }
  // }
}
