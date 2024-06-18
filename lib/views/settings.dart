import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rapid_pass/components/add_card_number.dart';
import 'package:rapid_pass/providers/get_information_provider.dart';
import 'package:rapid_pass/services/admob_services.dart';
import 'package:rapid_pass/views/about.dart';

class Settings extends StatefulWidget {
  Settings(this.infoData, {super.key});

  GetInformationProvider infoData;

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('সেটিংস'),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              widget.infoData.info?.cardNumber == ""
                  ? ElevatedButton(
                      onPressed: () {
                        _showInterstitialAd();
                        addCardNumber(context);
                      },
                      child: const Text('কার্ড নম্বর যোগ'),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        _showInterstitialAd();
                        addCardNumber(context);
                      },
                      child: const Text('কার্ড নম্বর পরিবর্তন'),
                    ),
              const SizedBox(
                height: 10,
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     context.read<ThemeProvider>().changeTheme();
              //   },
              //   child: const Text('থিম পরিবর্তন'),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // ElevatedButton(
              //   onPressed: () async {
              //     await clearAllInformation();
              //   },
              //   child: const Text('Clear All Information'),
              // ),

              // About Section
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const About(),
                  ),
                ),
                child: const Text('আমাদের সম্পর্কে'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
