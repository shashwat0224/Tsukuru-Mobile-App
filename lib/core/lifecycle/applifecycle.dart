import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsukuru/core/providers/internetstatus_provider.dart';
import 'package:tsukuru/core/providers/navigation_provider.dart';

class AppLifeCycleHandler {
  final BuildContext context;
  late final AppLifecycleListener _listener;

  AppLifeCycleHandler(this.context) {
    _listener = AppLifecycleListener(
      onResume: () => context.read<InternetStatusProvider>().onResume,
      onHide: () => context.read<InternetStatusProvider>().onPauseHide,
      onPause: () => context.read<InternetStatusProvider>().onPauseHide,
      onDetach: () => context.read<InternetStatusProvider>().onDetach,
      onExitRequested: () => context.read<NaviagtionProvider>().exitPopUp(),
    );
  }

  void dispose() {
    _listener.dispose();
  }
}
