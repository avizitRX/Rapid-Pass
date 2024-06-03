import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapid_pass/providers/get_information_provider.dart';
import 'package:rapid_pass/services/clear_all_information.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String?> addCardNumber(BuildContext context) async {
  var cardNumberController = TextEditingController();
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('কার্ড নম্বর'),
      content: TextField(
        controller: cardNumberController,
        autofocus: true,
        decoration: const InputDecoration(
          // prefixText: 'RP',
          // prefixStyle: Theme.of(context).textTheme.bodyLarge,
          hintText: 'আপনার কার্ড নম্বর দিন',
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context, 'Cancel');
            cardNumberController.text = '';
          },
          child: const Text('বাতিল'),
        ),
        TextButton(
          onPressed: () async {
            if (cardNumberController.text.isNotEmpty) {
              await clearAllInformation();
              await prefs.setString('cardNumber', cardNumberController.text);
              Provider.of<GetInformationProvider>(context, listen: false)
                  .fetchInformation();
              Navigator.pop(context, 'Cancel');

              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  content: Text(
                    'আপনার কার্ড নম্বর সংরক্ষিত হয়েছে!',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, 'OK');
                        cardNumberController.text = '';
                      },
                      child: const Text('আচ্ছা'),
                    ),
                  ],
                ),
              );
              cardNumberController.text = '';
            }
          },
          child: const Text('সংরক্ষণ'),
        ),
      ],
    ),
  );
}
