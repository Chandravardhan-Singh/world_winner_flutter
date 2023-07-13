import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:world_winner_flutter/extensions/context.dart';
import 'package:world_winner_flutter/extensions/string.dart';
import 'package:world_winner_flutter/pages/notification-permission/notification-permission.dart';
import 'package:world_winner_flutter/widget/button.dart';
import 'package:world_winner_flutter/widget/input.dart';
import 'package:world_winner_flutter/widget/timer_button.dart';

class OnboardingUserDetails extends StatefulWidget {
  const OnboardingUserDetails({super.key});

  @override
  State<OnboardingUserDetails> createState() => _OnboardingUserDetailsState();
}

class _OnboardingUserDetailsState extends State<OnboardingUserDetails> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  String birthDay = "";
  bool birthDayError = false;
  bool formValidated = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController emailVerificationCodeController =
      TextEditingController();

  bool _verificationSent = false;

  void submitPressed() {
    setState(() {
      birthDayError = birthDay == "";
    });

    if (_formKey.currentState!.validate() && birthDay != "") {
      setState(() {
        birthDayError = false;
        formValidated = true;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const NotificationPermission(),
        ),
      );
    }
  }

  void editEmail() {
    setState(() {
      _verificationSent = false;
    });
  }

  void sentVerificationCode() {
    setState(() {
      _verificationSent = true;
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(context.localization!.code_sent_to_mail),
      ),
    );
  }

  void onBirthDateClick(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(2000),
      lastDate: DateTime(DateTime.now().year),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        birthDay = formattedDate;
      });
    }
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
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
              top: 0, bottom: MediaQuery.of(context).viewInsets.bottom + 0),
          child: Stack(
            children: [
              Image.asset(
                'assets/images/signup-bg.png',
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
                          context.localization!.signup_title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.72,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Input(
                            controller: firstNameController,
                            label: context.localization!.first_name,
                            validator: (firstName) {
                              if (firstName == null || firstName.isEmpty) {
                                return context.localization?.first_name_error;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          Input(
                            controller: lastNameController,
                            label: context.localization!.last_name,
                            validator: (lastName) {
                              if (lastName == null || lastName.isEmpty) {
                                return context.localization?.last_name_error;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () => onBirthDateClick(context),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 18,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                    color: birthDayError
                                        ? Theme.of(context).colorScheme.error
                                        : Colors.black38,
                                    width: 1,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                  )),
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                birthDay == ""
                                    ? context.localization!.birthday_label
                                    : birthDay,
                              ),
                            ),
                          ),
                          birthDayError
                              ? Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 8),
                                      child: Text(
                                        context.localization!.birth_date_error,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .error,
                                          fontSize: Theme.of(context)
                                                  .inputDecorationTheme
                                                  .errorStyle
                                                  ?.fontSize ??
                                              12,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                          const SizedBox(height: 20),
                          Input(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            label: context.localization!.email_label,
                            disable: _verificationSent,
                            validator: (email) {
                              if (email == null || email.isEmpty) {
                                return context.localization?.email_error;
                              } else if (!email.isValidEmail()) {
                                return context
                                    .localization?.email_validation_error;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 5),
                          TextButton(
                            style: const ButtonStyle(
                              splashFactory: NoSplash.splashFactory,
                            ),
                            onPressed: _verificationSent
                                ? editEmail
                                : sentVerificationCode,
                            child: Text(
                              _verificationSent
                                  ? context.localization!.edit_email
                                  : context.localization!.send_verification,
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                color: Color.fromARGB(255, 255, 88, 0),
                              ),
                            ),
                          ),
                          Text(
                            context.localization!.code_sent_to_mail,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Input(
                            controller: emailVerificationCodeController,
                            label: context.localization!.enter_code,
                            disable: !_verificationSent,
                            validator: (emailCode) {
                              if (!_verificationSent) {
                                return null;
                              }
                              if (emailCode == null || emailCode.isEmpty) {
                                return context.localization?.email_code_error;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          _verificationSent
                              ? Column(
                                  children: [
                                    Text(
                                      context
                                          .localization!.otp_code_not_received,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 16,
                                      ),
                                    ),
                                    TimerButton(
                                      onResend: sentVerificationCode,
                                      onTimerFinish: () {},
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                    Button(
                      // type: birthDay != "" && _formKey.currentState!.validate()
                      //     ? ButtonType.contained
                      //     : ButtonType.disable,
                      type: ButtonType.contained,
                      text: context.localization!.button_submit,
                      // onPressed: formValidated ? submitPressed : () {},
                      onPressed: submitPressed,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
