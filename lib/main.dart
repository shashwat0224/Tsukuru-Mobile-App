import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
// import 'package:tsukuru/api/api_func.dart';
import 'package:tsukuru/core/providers/internetstatus_provider.dart';
import 'package:tsukuru/core/providers/navigation_provider.dart';
import 'package:tsukuru/core/lifecycle/applifecycle.dart';
import 'package:tsukuru/screens/splashscreen.dart';
import 'package:tsukuru/widgets/status_snackbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NaviagtionProvider()),
        ChangeNotifierProvider(create: (_) => InternetStatusProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
    return MaterialApp(
      scaffoldMessengerKey: SnackbarService.messengerKey,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
