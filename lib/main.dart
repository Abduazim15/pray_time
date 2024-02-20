import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam/bloc/data_bloc.dart';
import 'package:islam/dio/pray_service.dart';
import 'package:islam/pages/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => DataBloc(PrayDioService())
          ..add(FetchDataEvent(month: DateTime.now().month)),
        child: const MainPage(),
      ),
      theme: ThemeData(
          textTheme: const TextTheme(
            bodyText2: TextStyle(
              fontFamily: 'WinterStorm'
            ),
          )),
    );
  }
}
