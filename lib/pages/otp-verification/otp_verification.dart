import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:world_winner_flutter/extensions/context.dart';
import 'package:world_winner_flutter/pages/onboarding-user-details/onboarding_user_details.dart';
import 'package:world_winner_flutter/pages/onboarding-phone-number/onboarding_phone_number.dart';
import 'package:world_winner_flutter/widget/button.dart';
import 'package:world_winner_flutter/widget/timer_button.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({super.key});

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  String _otpValue = "";

  void submitOTP() {
    if (_otpValue.length == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const OnboardingUserDetails(),
        ),
      );
    }
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
                  TimerButton(
                      onTimerFinish: () {
                        print('callback here');
                      },
                      onResend: () {}),
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
