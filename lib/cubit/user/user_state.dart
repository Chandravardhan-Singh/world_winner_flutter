part of 'user_cubit.dart';

@immutable
abstract class UserState {}

abstract class UserActionState extends UserState {}

class UserInitial extends UserState {}

class UserCheckingAuth extends UserState {}

class UserSuccessAuth extends UserState {}

class UserFailedAuth extends UserState {}
