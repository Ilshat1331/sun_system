import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:android_studio_check/bloc/galaxy_bloc.dart';
import 'package:android_studio_check/screen/main_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GalaxyBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: const Color.fromARGB(255, 31, 5, 80),
          colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark,
            seedColor: const Color.fromARGB(255, 31, 5, 80),
            surface: const Color.fromARGB(255, 60, 19, 134),
          ),
        ),
        home: const MainScreen(),
      ),
    );
  }
}
