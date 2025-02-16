import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/review_bloc.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // BlocProvider proporciona el ReviewBloc a toda la aplicación.
      // create: (context) => ReviewBloc() → Se crea una instancia de ReviewBloc.
      // Todos los widgets dentro de BlocProvider pueden acceder al Bloc.
      create: (context) => ReviewBloc(),
      child: MaterialApp(
        title: 'Flutter Bloc App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomeScreen(),
      ),
    );
  }
}
