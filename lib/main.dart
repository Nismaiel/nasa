import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa/blocs/images_cubit.dart';
import 'package:nasa/presentation/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider( providers: [
      BlocProvider(create: (context) => ImagesCubit(),),
    ],
      child: const MaterialApp(
        title: 'Nasa pictures',
        home: HomeScreen(),
      ),
    );
  }
}

