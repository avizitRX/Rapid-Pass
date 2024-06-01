import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:rapid_pass/components/categories_section.dart';
import 'package:rapid_pass/services/information_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  get cardNumberController => null;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String buttonText = 'ব্যালেন্স দেখুন';
  bool isLoading = false;

  String name = "";

  final cardNumberController = TextEditingController();

  @override
  void initState() {
    InformationApi().fetchBalance();
    loadData();
    super.initState();
  }

  // Load data from SharedPreferences
  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              // Header Balance Check Area
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryFixedDim),
                child: Column(
                  children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.person_rounded,
                        size: 40,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      name,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                    ),

                    const SizedBox(
                      height: 5,
                    ),

                    // Balance Check Button
                    ElevatedButton(
                      onPressed: () async {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        final List<ConnectivityResult> connectivityResult =
                            await (Connectivity().checkConnectivity());

                        // Internet Connection Check
                        if (connectivityResult
                            .contains(ConnectivityResult.none)) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              content: Text(
                                'দয়া করে ইন্টারনেট সংযোগ দিন!',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, 'OK');
                                    const Homepage().cardNumberController.text =
                                        '';
                                  },
                                  child: const Text('আচ্ছা'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          if (prefs.getString('cardNumber') != null) {
                            setState(() {
                              isLoading = true;
                              buttonText = 'Loading...';
                            });

                            String fetchedBalance =
                                await InformationApi().fetchBalance();

                            if (fetchedBalance == "Failed") {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  content: Text(
                                    'Operation Failed!',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'OK');
                                      },
                                      child: const Text('আচ্ছা'),
                                    ),
                                  ],
                                ),
                              );

                              setState(() {
                                isLoading = false;
                                buttonText = 'ব্যালেন্স দেখুন';
                              });
                            }

                            if (fetchedBalance == "Error") {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  content: Text(
                                    'আপনি ভুল কার্ড নম্বর দিয়েছেন!',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'OK');
                                        const Homepage()
                                            .cardNumberController
                                            .text = '';
                                      },
                                      child: const Text('আচ্ছা'),
                                    ),
                                  ],
                                ),
                              );
                              setState(() {
                                isLoading = false;
                                buttonText = 'ব্যালেন্স দেখুন';
                              });
                            } else {
                              setState(() {
                                isLoading = false;
                                buttonText = fetchedBalance;

                                Future.delayed(const Duration(seconds: 4), () {
                                  setState(() {
                                    buttonText = 'ব্যালেন্স দেখুন';
                                  });
                                });
                              });
                            }
                          } else {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('কার্ড নম্বর'),
                                content: TextField(
                                  controller: cardNumberController,
                                  autofocus: true,
                                  decoration: const InputDecoration(
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
                                      if (cardNumberController
                                          .text.isNotEmpty) {
                                        await prefs.setString('cardNumber',
                                            cardNumberController.text);
                                        Navigator.pop(context, 'Cancel');

                                        setState(() {
                                          initState();
                                        });

                                        showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            content: Text(
                                              'আপনার কার্ড নম্বর সংরক্ষিত হয়েছে!',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge,
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context, 'OK');
                                                  cardNumberController.text =
                                                      '';
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
                        }
                      },
                      child: isLoading
                          ? Container(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 0.3),
                              child: const SizedBox(
                                height: 15.0,
                                width: 15.0,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            )
                          : Text(buttonText),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        // Categories Section
        const SizedBox(
          height: 15,
        ),

        const CategoriesSection(),
      ],
    );
  }
}
