import 'package:shared_preferences/shared_preferences.dart';

Future<void> clearAllInformation() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('cardNumber');
  await prefs.remove('name');
  await prefs.remove('cardStatus');
}
