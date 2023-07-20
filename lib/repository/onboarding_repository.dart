import 'package:world_winner_flutter/models/country_code.dart';
import 'package:world_winner_flutter/models/user.dart';
import 'package:world_winner_flutter/utils/storage/storage.dart';

enum SignupResponse { success, failed }

class UserOnboardingRepository {
  Future<List<CountryCode>> fetchCountryCodes() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        return [
          CountryCode(
            countryName: 'India',
            countryInitial: "IN",
            countryCode: "+91",
          ),
          CountryCode(
            countryName: 'United States',
            countryInitial: "US",
            countryCode: "+911",
          ),
          CountryCode(
            countryName: 'United Mars',
            countryInitial: "UM",
            countryCode: "+121",
          ),
          CountryCode(
            countryName: 'United Venus',
            countryInitial: "UV",
            countryCode: "+141",
          ),
          CountryCode(
            countryName: 'Kingdom of Jupiter',
            countryInitial: "KJ",
            countryCode: "+151",
          ),
        ];
      },
    );
  }

  Future<SignupResponse> userSignup(User user) {
    return Future.delayed(const Duration(seconds: 1), () {
      Storage.instance().add(
        'user',
        user.toString(),
      );

      return SignupResponse.success;
    });
  }
}

class NetworkException implements Exception {}
