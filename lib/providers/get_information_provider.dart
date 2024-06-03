import 'package:flutter/material.dart';
import 'package:rapid_pass/models/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetInformationProvider with ChangeNotifier {
  UserProfile? _info;

  UserProfile? get info => _info;

  Future<void> fetchInformation() async {
    final prefs = await SharedPreferences.getInstance();

    _info = UserProfile(
      cardNumber: prefs.getString('cardNumber') ?? '',
      name: prefs.getString('name') ?? '',
      cardStatus: prefs.getString('cardStatus') ?? '',
    );
    notifyListeners();
  }
}
