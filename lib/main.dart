import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartix_husam/features/home/home.dart';
import 'package:smartix_husam/observers/device_observer.dart';
import 'package:smartix_husam/style/theme.dart';

void main() {
  Bloc.observer = MainObserver();
  runApp(const SmartixApp());
}

class SmartixApp extends StatelessWidget {
  const SmartixApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smartix-Husam',
      theme: AppTheme.APP_THEME,
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
