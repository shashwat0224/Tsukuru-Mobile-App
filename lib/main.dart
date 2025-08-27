import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsukuru/core/providers/internetstatus_provider.dart';
import 'package:tsukuru/core/providers/navigation_provider.dart';
import 'package:tsukuru/core/lifecycle/applifecycle.dart';
import 'package:tsukuru/screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppLifeCycleHandler? _lifeCycleHandler;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _lifeCycleHandler = AppLifeCycleHandler(context);
    });
  }

  @override
  void dispose() {
    _lifeCycleHandler?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NaviagtionProvider(context: context),
        ),
        ChangeNotifierProvider(create: (context) => InternetStatusProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
