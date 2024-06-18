import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  const About({super.key});

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Uri facebookUrl = Uri.parse('https://facebook.com/ovijaanIT');
    final Uri youtubeUrl = Uri.parse('https://youtube.com');

    int flag = 0;
    bool locked = true;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('আমাদের সম্পর্কে'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo/logo.png',
                    width: 100,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'অভিযান',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'ওয়েবসাইট ডেভেলপমেন্ট\nমোবাইল অ্যাপ ডেভেলপমেন্ট\nসফটওয়্যার ডেভেলপমেন্ট',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => launchUrl(facebookUrl),
                        child: Image.asset(
                          'assets/images/social_icon/facebook.png',
                          width: 50,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () => launchUrl(youtubeUrl),
                        child: Image.asset(
                          'assets/images/social_icon/youtube.png',
                          width: 50,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (flag > 8) {
                        locked = false;
                      }
                      flag++;
                      debugPrint(flag.toString());
                    },
                    onLongPress: () {
                      if (!locked) {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('About Us'),
                            content: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Concept and Design',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Prasenjit Datta\nWeb: dreamhomebd.com',
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Text(
                                    'Development',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Avizit Roy\nWeb: avizitRX.com',
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: const Text('Rapid Pass v1.0.0'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
