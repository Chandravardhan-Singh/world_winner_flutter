import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:world_winner_flutter/repository/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository _userRepository;

  UserCubit(this._userRepository) : super(UserInitial());

  checkAuthentication() async {
    emit(UserCheckingAuth());
    final user = await _userRepository.getUserFromStorage();
    print(user);
    if (user != null) {
      emit(UserSuccessAuth());
    } else {
      emit(UserFailedAuth());
    }
  }
}
