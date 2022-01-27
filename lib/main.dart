import 'package:evite/common/themes.dart';
import 'package:evite/cubit/theme_cubit.dart';
import 'package:evite/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Evite',
            debugShowCheckedModeBanner: false,
            theme: themeLight(context),
            darkTheme: themeDark(context),
            themeMode: state is ThemeDark ? ThemeMode.dark : ThemeMode.light,
            home: MyHomePage(),
          );
        },
      ),
    );
  }
}
