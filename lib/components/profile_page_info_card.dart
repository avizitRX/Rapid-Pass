import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rapid_pass/components/add_card_number.dart';
import 'package:rapid_pass/providers/get_information_provider.dart';
import 'package:rapid_pass/services/admob_services.dart';

class ProfilePageInfoCard extends StatefulWidget {
  const ProfilePageInfoCard({
    super.key,
    required this.infoData,
  });

  final GetInformationProvider infoData;

  @override
  State<ProfilePageInfoCard> createState() => _ProfilePageInfoCardState();
}

class _ProfilePageInfoCardState extends State<ProfilePageInfoCard> {
  InterstitialAd? _interstitialAd;

  @override
  void initState() {
    super.initState();
    _createInterstitialAd();
  }

  void _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdmobServices.interstitialAdUnitId!,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) => _interstitialAd = ad,
        onAdFailedToLoad: (LoadAdError error) => _interstitialAd = null,
      ),
    );
  }

  void _showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _createInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _createInterstitialAd();
        },
      );
      _interstitialAd!.show();
      _interstitialAd = null;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _interstitialAd!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.infoData.info!.cardNumber == ""
            ? Column(
                children: [
                  InteractiveViewer(
                    panEnabled: true,
                    child: const Image(
                      image: AssetImage(
                          'assets/images/card_add/rapid_pass_card_back.jpg'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showInterstitialAd();

                      addCardNumber(context);
                    },
                    child: const Text('কার্ড নম্বর যোগ'),
                  ),
                ],
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
                                widget.infoData.info!.name,
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
                                widget.infoData.info!.cardNumber,
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
                                widget.infoData.info!.cardStatus,
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
