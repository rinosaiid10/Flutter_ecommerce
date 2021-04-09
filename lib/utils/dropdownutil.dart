import 'package:country_pickers/countries.dart';
import 'package:country_pickers/country.dart';
import 'package:flutter/widgets.dart';

class CountryPickerUtils {
  static Country getCountryByIsoCode(String isoCode) {
    try {
      return countryList.firstWhere(
        (country) => country.isoCode.toLowerCase() == isoCode.toLowerCase(),
      );
    } catch (error) {
      throw Exception("La valeur initiale fournie n'est pas un code iso pris en charge!");
    }
  }

  static String getFlagImageAssetPath(String isoCode) {
    return "assets/${isoCode.toLowerCase()}.png";
  }

  static Widget getDefaultFlagImage(Country country) {
    return Image.asset(
      CountryPickerUtils.getFlagImageAssetPath(country.isoCode),
      height: 20.0,
      width: 30.0,
      fit: BoxFit.fill,
      package: "country_pickers",
    );
  }

  static Country getCountryByPhoneCode(String phoneCode) {
    try {
      return countryList.firstWhere(
        (country) => country.phoneCode.toLowerCase() == phoneCode.toLowerCase(),
      );
    } catch (error) {
      throw Exception(
          "La valeur initiale fournie n'est pas un code de téléphone pris en charge!");
    }
  }
}
