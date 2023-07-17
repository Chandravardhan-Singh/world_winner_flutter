import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:world_winner_flutter/models/country_code.dart';
import 'package:world_winner_flutter/models/user.dart';
import 'package:world_winner_flutter/repository/onboarding_repository.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final UserOnboardingRepository _userOnboardingRepository;

  OnboardingCubit(this._userOnboardingRepository) : super(OnboardingInitial());
  Future<void> getCountryCodes() async {
    try {
      emit(OnboardingLoadingCountryCodesState());

      final countryCodes = await _userOnboardingRepository.fetchCountryCodes();

      emit(OnboardingLoadedCountryCodesState(countryCodes));
    } on NetworkException {
      emit(OnboardingFailedCountryCodesState());
    } catch (error) {
      emit(OnboardingFailedCountryCodesState());
    }
  }

  Future<void> onboardingSignup(User user) async {
    try {
      emit(OnboardingSignupLoadingState());
      final response = await _userOnboardingRepository.userSignup(user);

      emit(OnboardingSignupDoneState(response));
    } on NetworkException {
      emit(OnboardingSignupFailedState());
    } catch (error) {
      emit(OnboardingSignupFailedState());
    }
  }
}
