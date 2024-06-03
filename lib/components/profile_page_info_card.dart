import 'package:flutter/material.dart';
import 'package:rapid_pass/components/add_card_number.dart';
import 'package:rapid_pass/providers/get_information_provider.dart';

class ProfilePageInfoCard extends StatelessWidget {
  const ProfilePageInfoCard({
    super.key,
    required this.infoData,
  });

  final GetInformationProvider infoData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        infoData.info!.cardNumber == ""
            ? ElevatedButton(
                onPressed: () => addCardNumber(context),
                child: const Text('কার্ড নম্বর যোগ'),
              )
            : Column(
                children: [
                  // Name
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 20,
                    ),
                    child: Column(
                      children: [
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'নাম',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                infoData.info!.name,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Card Number
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 20,
                    ),
                    child: Column(
                      children: [
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'কার্ড নম্বর',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                infoData.info!.cardNumber,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Card Status
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 20,
                    ),
                    child: Column(
                      children: [
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'কার্ড স্ট্যাটাস',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                infoData.info!.cardStatus,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}
