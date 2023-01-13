import 'package:flutter/material.dart';
import 'package:seleksi_suitmedia/services/my_service.dart';
import 'package:seleksi_suitmedia/view/first_screen.dart';
//FONT
import 'package:google_fonts/google_fonts.dart';
import 'package:seleksi_suitmedia/view/second_screen.dart';
import 'package:seleksi_suitmedia/view/third_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:seleksi_suitmedia/view_models/bloc/user_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(
            context.read<MyService>(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: const FirstScreen(),
      routes: {
        '/first': (context) => const FirstScreen(),
        '/second': (context) => const SecondScreen(),
        '/third': (context) => const ThirdScreen(),
      },
    );
  }
}
