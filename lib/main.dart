import 'package:flutter/material.dart';
import 'package:sahala/core/theme/app_theme.dart';
import 'package:sahala/dependency_injection.dart';
import 'package:sahala/features/home/Presentation/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  setup();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: Home(),
    );
  }
}
