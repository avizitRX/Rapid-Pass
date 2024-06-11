import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rapid_pass/components/station_data_table.dart';
import 'package:rapid_pass/services/admob_services.dart';

class Station extends StatefulWidget {
  const Station({super.key});

  @override
  State<Station> createState() => _StationState();
}

class _StationState extends State<Station> {
  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
    _createBannerAd();
  }

  void _createBannerAd() {
    _bannerAd = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: AdmobServices.bannerAdUnitId!,
      listener: AdmobServices.bannerListener,
      request: const AdRequest(),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('স্টেশন'),
        ),
        body: StationDataTable().buildDataTable(),
        bottomNavigationBar: _bannerAd == null
            ? Container()
            : SizedBox(
                width: _bannerAd!.size.width.toDouble(),
                height: _bannerAd!.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd!),
              ),
      ),
    );
  }
}
