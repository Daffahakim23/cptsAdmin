import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_cpts/Screen/home_screen.dart';
import 'package:test_cpts/providers/transaction_provider.dart';
import 'package:test_cpts/providers/chat_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TransactionProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
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
      title: 'Flutter Demo',
      theme: ThemeData.light(), // Set your theme here
      darkTheme: ThemeData.dark(), // Set your dark theme here
      home: const HomeScreen(),
    );
  }
}
