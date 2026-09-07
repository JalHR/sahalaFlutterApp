import 'dart:async';

import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({super.key, required this.duration, this.onFinished});

  final Duration duration;
  final VoidCallback? onFinished;

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late DateTime _endTime;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _endTime = DateTime.now().add(widget.duration);

    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _updateTimer());
  }

  void _updateTimer() {
    final remaining = _endTime.difference(DateTime.now());

    if (remaining <= Duration.zero) {
      _timer?.cancel();

      setState(() {});

      widget.onFinished?.call();
      return;
    }

    setState(() {});
  }

  String get _formattedTime {
    final remaining = _endTime.difference(DateTime.now());

    final totalSeconds = remaining.inSeconds.clamp(0, double.infinity).toInt();

    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;

    return '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text('Resend in : $_formattedTime');
  }
}
