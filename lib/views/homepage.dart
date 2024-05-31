import 'package:flutter/material.dart';
import 'package:rapid_pass/components/categories_section.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String buttonText = 'ব্যালেন্স দেখুন';
  double balance = 0.0;
  bool isLoading = false;

  Future<String> fetchBalance() async {
    await Future.delayed(const Duration(seconds: 1));
    return balance.toString();
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
                decoration:
                    BoxDecoration(color: Theme.of(context).colorScheme.primary),
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
                      'নাম',
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
                        setState(() {
                          isLoading = true;
                          buttonText = 'Loading...';
                        });

                        String fetchedBalance = await fetchBalance();

                        setState(() {
                          isLoading = false;
                          buttonText = fetchedBalance;

                          Future.delayed(const Duration(seconds: 4), () {
                            setState(() {
                              buttonText = 'ব্যালেন্স দেখুন';
                            });
                          });
                        });
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
