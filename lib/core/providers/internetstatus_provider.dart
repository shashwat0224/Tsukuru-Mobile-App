import 'dart:async';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:tsukuru/widgets/uihelper.dart';

class InternetStatusProvider extends ChangeNotifier {
  // how to integrate internet connection checker plus with provider in flutter app
  late final StreamSubscription<InternetStatus> _subscription;
  bool _isConnected = true;
  bool get isConnected => _isConnected;

  InternetStatusProvider() {
    startListening();
  }
  void startListening() {
    _subscription = InternetConnection().onStatusChange.listen((status) async {
      switch (status) {
        case InternetStatus.connected:
          
          break;
        case InternetStatus.disconnected:
          
          break;
      }
    });
  }

  

  void onPauseHide() {
    _subscription.pause();
    notifyListeners();
  }

  void onResume() {
    _subscription.resume();

    notifyListeners();
  }

  void onDetach() {
    _subscription.cancel();
    notifyListeners();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
