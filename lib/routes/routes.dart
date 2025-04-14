import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_map_initializer/app_observer/navigator_observer.dart';
import 'package:google_map_initializer/keys/app_keys.dart';
import 'package:google_map_initializer/screens/home/cubit/home_cubit.dart';
import 'package:google_map_initializer/screens/home/home_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: AppKeys.navigatorKey,
    initialLocation: '/',
    observers: [MyNavigatorObserver()],
    debugLogDiagnostics: true,
    routes: [
      //** Splash Screen **/
      GoRoute(
        name: 'Home Screen',
        path: '/',
        builder: (context, state) => HomeScreen(),
      ),
    ],
    errorPageBuilder:
        (context, state) => MaterialPage(
          key: state.pageKey,
          canPop: true,
          name: 'Home Screen',
          child: BlocProvider(
            create: (context) => HomeCubit(),
            child: const HomeScreen(),
          ),
        ),
  );
}
