import 'package:bloc_pattern_flutter_ornek/cubit/home_page_cubit.dart';
import 'package:bloc_pattern_flutter_ornek/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomePageCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        theme: ThemeData(
            appBarTheme:
                const AppBarTheme(titleTextStyle: TextStyle(color: Colors.black, fontSize: 24), color: Colors.amber)),
      ),
    );
  }
}
