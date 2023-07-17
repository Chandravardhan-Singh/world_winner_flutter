part of 'onboarding_cubit.dart';

@immutable
abstract class OnboardingState {}

abstract class OnboardingActionState extends OnboardingState {}

class OnboardingInitial extends OnboardingState {
  OnboardingInitial();
}

class OnboardingLoadingCountryCodesState extends OnboardingState {}

class OnboardingLoadedCountryCodesState extends OnboardingState {
  final List<CountryCode> countryCodes;
  OnboardingLoadedCountryCodesState(this.countryCodes);
}

class OnboardingFailedCountryCodesState extends OnboardingState {
  OnboardingFailedCountryCodesState();
}

class OnboardingSignupLoadingState extends OnboardingState {}

class OnboardingSignupDoneState extends OnboardingState {
  final SignupResponse status;
  OnboardingSignupDoneState(this.status);
}

class OnboardingSignupFailedState extends OnboardingState {
  OnboardingSignupFailedState();
}
