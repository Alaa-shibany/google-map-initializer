import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      ensureScreenSize: true,
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      builder:
          (context, child) => MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Google map initializer',
            theme: themeData,
            routerConfig: AppRouter.router,
          ),
    );
  }
}
