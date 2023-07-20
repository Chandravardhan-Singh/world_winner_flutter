import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_winner_flutter/cubit/user/user_cubit.dart';
import 'package:world_winner_flutter/pages/home/home.dart';
import 'package:world_winner_flutter/pages/landing-page/landing_page.dart';
import 'package:world_winner_flutter/repository/user_repository.dart';
import 'package:world_winner_flutter/widget/loader.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final UserCubit userCubit = UserCubit(UserRepository());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userCubit.checkAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      bloc: userCubit,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final authSuccess = state is UserSuccessAuth;
        final authFailed = state is UserFailedAuth;
        final authLoading = state is UserCheckingAuth;
        return Stack(children: [
          authLoading ? const Loader() : const SizedBox(), // TODO : Add Splash
          authSuccess ? const Home() : const SizedBox(),
          authFailed ? const LandingPage() : const SizedBox(),
        ]);
      },
    );
  }
}
