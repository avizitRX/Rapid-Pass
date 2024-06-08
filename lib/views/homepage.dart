import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:rapid_pass/components/add_card_number.dart';
import 'package:rapid_pass/components/categories_section.dart';
import 'package:rapid_pass/models/categories.dart';
import 'package:rapid_pass/services/information_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial/tutorial.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String buttonText = 'ব্যালেন্স দেখুন';
  bool isLoading = false;

  String name = "";

  final keyBalanceCheck = GlobalKey();

  List<TutorialItem> items = [];

  @override
  void initState() {
    InformationApi().fetchBalance();
    loadData();
    tutorial();

    super.initState();
  }

  // Load data from SharedPreferences
  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name')!;
    });
  }

  Future<void> tutorial() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    items.addAll(
      {
        TutorialItem(
          globalKey: keyCardRegistration,
          touchScreen: true,
          top: 420,
          left: 30,
          children: [
            const Text(
              "আপনার কার্ডটি প্রথমে র‌্যাপিড পাস সার্ভারে রেজিস্টার করুন (আগেই রেজিস্ট্রেশন করে থাকলে দ্বিতীয়বার করতে হবেনা)",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            )
          ],
          widgetNext: const Text(
            "পরবর্তী",
            style: TextStyle(
              color: Colors.lightBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
          shapeFocus: ShapeFocus.oval,
        ),
        TutorialItem(
          globalKey: keyCardRegistration,
          touchScreen: true,
          top: 420,
          left: 30,
          children: [
            const Text(
              "অনলাইন রেজিষ্ট্রেশনের ২৪ ঘন্টা পর আপনার তথ্য যাচাই ও ব্যালেন্স দেখতে পারবেন",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            )
          ],
          widgetNext: const Text(
            "পরবর্তী",
            style: TextStyle(
              color: Colors.lightBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
          shapeFocus: ShapeFocus.oval,
        ),
        TutorialItem(
          globalKey: keyCardAdd,
          touchScreen: true,
          top: 420,
          left: 30,
          children: [
            const Text(
              "এবার আপনার কার্ডটি অ্যাপের সাথে সংযুক্ত করুন",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            )
          ],
          widgetNext: const Text(
            "পরবর্তী",
            style: TextStyle(
              color: Colors.lightBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
          shapeFocus: ShapeFocus.oval,
        ),
        TutorialItem(
          globalKey: keyBalanceCheck,
          touchScreen: true,
          top: 200,
          left: 50,
          children: [
            const Text(
              "তারপর আপনি চাইলে এখানে ক্লিক করে ব্যালেন্স দেখতে পারবেন",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
          widgetNext: const Text(
            "শেষ",
            style: TextStyle(
              color: Colors.lightBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
          shapeFocus: ShapeFocus.square,
        ),
      },
    );

    bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;

    if (isFirstLaunch) {
      Future.delayed(const Duration(microseconds: 200)).then((value) {
        Tutorial.showTutorial(context, items);
      });
      await prefs.setBool('isFirstLaunch', false);
    } else {
      isFirstLaunch = false;
    }
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
                      key: keyBalanceCheck,
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
                            addCardNumber(context);
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
