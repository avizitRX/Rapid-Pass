import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:web_scraper/web_scraper.dart';

class InformationApi {
  double balance = 0.0;
  String name = "";
  String cardStatus = "";

  get context => null;

  Future<String> fetchBalance() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final cardNumber = prefs.getString('cardNumber');
      final url = Uri.parse(
          'https://rapidpass.com.bd/bn/index.php/welcome/searchRegistraionInfo');
      final response = await http.post(
        url,
        body: {'search': cardNumber},
      );

      if (response.statusCode == 200) {
        if (response.body == "") {
          return "Error";
        } else {
          final webScraper = WebScraper();

          String cleanedResponseBody = response.body.replaceAllMapped(
              RegExp(r'<!--(.*?)-->', dotAll: true),
              (match) => match.group(1)!);

          if (await webScraper.loadFromString(cleanedResponseBody)) {
            List<Map<String, dynamic>> elements = webScraper.getElement(
                'div.table-responsive > table > tbody > tr > td', ['span']);

            // Name
            name = elements[1]['title'].trim();
            await prefs.setString('name', name);

            // Balance
            balance = double.parse(
                elements[5]['title'].replaceAll(RegExp(r"[^\d]"), ""));

            //Card Status
            cardStatus = elements[7]['title'].trim();
            await prefs.setString('cardStatus', cardStatus);

            return balance.toString();
          }
        }
      } else {
        print('Failed to send request. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
    return "Error";
  }
}
