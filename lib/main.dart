import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_change_notifier_provider.dart';
import 'change_and_future_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const AppChangeNotifierProvider(),
      home: const ChangeAndFutureProvider(),
    );
  }
}
