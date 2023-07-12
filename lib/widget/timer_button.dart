import 'dart:async';

import 'package:flutter/material.dart';
import 'package:world_winner_flutter/extensions/context.dart';

class TimerButton extends StatefulWidget {
  final Function() onTimerFinish;
  final Function() onResend;

  const TimerButton({
    super.key,
    required this.onTimerFinish,
    required this.onResend,
  });

  @override
  State<TimerButton> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TimerButton> {
  int _start = 60;
  String _timerString = '01:00';
  Timer? _timer;
  bool _canResend = false;

  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    setState(() {
      _canResend = false;
    });
    _start = 60;
    _timerString = '01:00';
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_start < 1) {
          timer.cancel();
          _onTimerFinish(); // Call your function here when the timer finishes
        } else {
          _start -= 1;
          _timerString = _getTimeString(_start);
        }
      });
    });
  }

  String _getTimeString(int time) {
    int minutes = (time / 60).floor();
    int seconds = time % 60;
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }

  void _onTimerFinish() {
    // Perform actions here after the timer finishes
    print('Timer finished!');
    setState(() {
      _canResend = true;
    });
    widget.onTimerFinish();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer to prevent it from continuing to run
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
        splashFactory: NoSplash.splashFactory,
      ),
      onPressed: _canResend ? widget.onResend : null,
      child: Text(
        _canResend
            ? context.localization!.otp_resend
            : context.localization!.otp_resend_in(_timerString),
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 16,
          color: _canResend
              ? const Color.fromARGB(255, 255, 88, 0)
              : Theme.of(context).colorScheme.onSurface.withAlpha(150),
        ),
      ),
    );
  }
}
