import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_task/features/display_animals/presentation/cubit/fetch_breeds_cubit.dart';

import 'package:pagination_task/features/display_animals/presentation/pages/home_screen.dart';

import 'init.dart';

Future<void> main() async {
  runApp(const MyApp());
  await initDependency();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<FetchBreedsCubit>(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
