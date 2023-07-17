import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_winner_flutter/cubit/onboarding/onboarding_cubit.dart';
import 'package:world_winner_flutter/extensions/context.dart';
import 'package:world_winner_flutter/extensions/string.dart';
import 'package:world_winner_flutter/models/country_code.dart';
import 'package:world_winner_flutter/pages/otp-verification/otp_verification.dart';
import 'package:world_winner_flutter/repository/onboarding_repository.dart';
import 'package:world_winner_flutter/widget/button.dart';
import 'package:world_winner_flutter/widget/dialog.dart';
import 'package:world_winner_flutter/widget/loader.dart';

class OnboardingPhoneNumber extends StatefulWidget {
  const OnboardingPhoneNumber({super.key});

  @override
  State<OnboardingPhoneNumber> createState() => _OnboardingPhoneNumberState();
}

class _OnboardingPhoneNumberState extends State<OnboardingPhoneNumber> {
  bool termsAndConditionChecked = false;
  TextEditingController phoneNumber = TextEditingController();
  String phoneNumberError = "";
  String phoneCountryError = "";

  CountryCode? _selectedCountryCode;
  int _selectedCodeIndex = 0;

  final onboardingCubit = OnboardingCubit(UserOnboardingRepository());

  @override
  void initState() {
    onboardingCubit.getCountryCodes();
    super.initState();
  }

  @override
  void dispose() {
    phoneNumber.dispose();
    super.dispose();
  }

// FIXME proper validation
  void onSubmit() {
    if (phoneNumber.text == "" || phoneNumber.text.length != 10) {
      setState(() {
        phoneNumberError = "Phone number is invalid!";
      });
    } else if (_selectedCountryCode == null) {
      setState(() {
        phoneNumberError = "Country Code Required!";
      });
    } else if (!termsAndConditionChecked) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(context.localization!.error_terms_and_condition)));
      setState(() {
        phoneNumberError = "";
      });
    } else {
      setState(() {
        phoneNumberError = "";
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OTPVerification(
              phoneNumber:
                  '${_selectedCountryCode!.countryCode} ${phoneNumber.text}'),
        ),
      );
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
        body: BlocConsumer<OnboardingCubit, OnboardingState>(
          bloc: onboardingCubit,
          listenWhen: (previous, current) =>
              current is OnboardingLoadingCountryCodesState,
          buildWhen: (previous, current) => current is! OnboardingActionState,
          listener: (ctx, state) {},
          builder: (context, state) {
            return Stack(
              children: [
                Image.asset(
                  'assets/images/onboarding-phone-number-bg.png',
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 53),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            context.localization!.onboarding_phone_title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.72,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 69),
                      Text(
                        context.localization!.onboarding_phone_number,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 9),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            shape: BoxShape.rectangle,
                            border: Border.all(width: 0.5)),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                final successState =
                                    state as OnboardingLoadedCountryCodesState;
                                if (state.runtimeType ==
                                    OnboardingLoadedCountryCodesState) {
                                  const Dialogs().showDialog(
                                    context,
                                    CupertinoPicker(
                                      magnification: 1.4,
                                      squeeze: 1,
                                      useMagnifier: true,
                                      itemExtent: 24,
                                      // This sets the initial item.
                                      scrollController:
                                          FixedExtentScrollController(
                                        initialItem: _selectedCodeIndex,
                                      ),
                                      // This is called when selected item is changed.
                                      onSelectedItemChanged: (selectedItem) {
                                        setState(() {
                                          _selectedCountryCode = successState
                                              .countryCodes[selectedItem];
                                          _selectedCodeIndex = selectedItem;
                                        });
                                      },
                                      diameterRatio: 2,
                                      children: List<Widget>.generate(
                                          successState.countryCodes.length,
                                          (int index) {
                                        return Text(
                                          successState
                                              .countryCodes[index].countryName,
                                          style: const TextStyle(fontSize: 16),
                                        );
                                      }),
                                    ),
                                  );
                                }
                              },
                              child: Row(
                                children: [
                                  Text(
                                    _selectedCountryCode != null
                                        ? _selectedCountryCode!.countryCode
                                        : "+ 00",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Icon(Icons.keyboard_arrow_down),
                                ],
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                autocorrect: false,
                                controller: phoneNumber,
                                keyboardType: TextInputType.phone,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                ),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              top: 0,
                            ),
                            child: Text(
                              phoneNumberError,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.error,
                                fontSize: Theme.of(context)
                                        .inputDecorationTheme
                                        .errorStyle
                                        ?.fontSize ??
                                    12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                termsAndConditionChecked =
                                    !termsAndConditionChecked;
                              });
                            },
                            child: Icon(
                              termsAndConditionChecked
                                  ? Icons.check_circle_rounded
                                  : Icons.circle_outlined,
                              color: const Color.fromARGB(255, 255, 88, 0),
                            ),
                          ),
                          const SizedBox(width: 10),
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                              children: context.localization!
                                  .onboarding_phone_terms_and_conditions
                                  .addStyle(
                                style: const TextStyle(),
                                richText: [
                                  "Terms",
                                  "&",
                                  "Conditions",
                                  "\nPrivacy",
                                  "Policy",
                                ],
                                richStyle: const TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.black,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: Button(
                    text: context.localization!.button_next,
                    onPressed: onSubmit,
                    backgroundColor: const Color.fromARGB(255, 255, 88, 0),
                    textColor: Colors.white,
                  ),
                ),
                state is OnboardingLoadingCountryCodesState
                    ? const Loader()
                    : const SizedBox(),
              ],
            );
          },
        ),
      ),
    );
  }
}
