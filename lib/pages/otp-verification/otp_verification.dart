import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:world_winner_flutter/extensions/context.dart';
import 'package:world_winner_flutter/pages/onboarding-phone-number/onboarding_phone_number.dart';
import 'package:world_winner_flutter/widget/button.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({super.key});

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  int _start = 60;
  bool _isActive = false;
  String _timerString = '01:00';
  Timer? _timer;
  bool _canResend = false;
  String _otpValue = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  void startTimer() {
    setState(() {
      _canResend = false;
    });
    _isActive = true;
    _start = 60;
    _timerString = '01:00';
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_start < 1) {
          timer.cancel();
          _isActive = false;
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
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer to prevent it from continuing to run
    super.dispose();
  }

  void submitOTP() {
    if (_otpValue.length < 4) {}
  }

  void changeNumber() {
    Navigator.pop(
      context,
      MaterialPageRoute(
        builder: (context) => const OnboardingPhoneNumber(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 14, 30, 103),
          elevation: 0,
          toolbarHeight: 0,
        ),
        body: Stack(
          children: [
            Image.asset(
              'assets/images/otp-bg.png',
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 53),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.localization!.otp_title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.72,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    context.localization!.otp_on_number('+917737506961'),
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: changeNumber,
                    child: Text(
                      context.localization!.otp_tap_to_change,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: Color.fromARGB(255, 255, 88, 0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  OTPTextField(
                    length: 4,
                    textFieldAlignment: MainAxisAlignment.center,
                    width: MediaQuery.of(context).size.width,
                    fieldWidth: 60,
                    fieldStyle: FieldStyle.box,
                    outlineBorderRadius: 60,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                    ),
                    spaceBetween: 10,
                    onCompleted: (pin) {
                      setState(() {
                        _otpValue = pin;
                      });
                    },
                    onChanged: (pin) {
                      print(pin);
                      setState(() {
                        _otpValue = pin;
                      });
                    },
                    keyboardType: TextInputType.number,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 23,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    context.localization!.otp_code_not_received,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    style: const ButtonStyle(
                      splashFactory: NoSplash.splashFactory,
                    ),
                    onPressed: _canResend ? () {} : null,
                    child: Text(
                      _canResend
                          ? context.localization!.otp_resend
                          : context.localization!.otp_resend_in(_timerString),
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: _canResend
                            ? const Color.fromARGB(255, 255, 88, 0)
                            : Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withAlpha(150),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Button(
                type: _otpValue.length == 4
                    ? ButtonType.contained
                    : ButtonType.disable,
                text: context.localization!.button_submit,
                onPressed: submitOTP,
              ),
            )
          ],
        ),
      ),
    );
  }
}
