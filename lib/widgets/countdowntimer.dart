import 'dart:async';
import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({
    super.key,
    this.fontSize,
    this.onTimerFinished,
    required this.time,
  });

  final double? fontSize;
  final int time;
  final VoidCallback? onTimerFinished;

  @override
  State<CountdownTimer> createState() => CountdownTimerState();
}

class CountdownTimerState extends State<CountdownTimer> {
  Timer? _timer; // countdown seconds
  late int _current;

  @override
  void initState() {
    super.initState();
    _current = widget.time;
    startTimer(); // 👈 auto-start on build
  }

  void startTimer() {
    _timer?.cancel(); // cancel if running

    setState(() {
      _current = widget.time;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_current <= 0) {
        timer.cancel();
        widget.onTimerFinished?.call(); // do something when finished
      } else {
        setState(() {
          _current--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text("$_current", style: TextStyle(fontSize: widget.fontSize ?? 12));
  }
}
