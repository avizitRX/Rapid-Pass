import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rapid_pass/components/map_timeline_tile.dart';
import 'package:rapid_pass/models/station.dart';
import 'package:rapid_pass/services/admob_services.dart';

class FareMap extends StatefulWidget {
  const FareMap({super.key});

  @override
  State<FareMap> createState() => _FareMapState();
}

class _FareMapState extends State<FareMap> {
  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();

    _createBannerAd();

    for (var station in stationsInformation) {
      timelineTiles.add(
        MapTimelineTile(
          stationName: station.name,
          fare: station.fare,
          startTile: station.startTile,
          endTile: station.endTile,
        ),
      );
    }
  }

  void _createBannerAd() {
    _bannerAd = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: AdmobServices.bannerAdUnitId!,
      listener: AdmobServices.bannerListener,
      request: const AdRequest(),
    )..load();
  }

  final List<Station> stationsInformation = [
    Station(name: "উত্তরা উত্তর", fare: "০", startTile: true),
    Station(name: "উত্তরা সেন্টার", fare: "২০"),
    Station(name: "উত্তরা দক্ষিণ", fare: "২০"),
    Station(name: "পল্লবী", fare: "৩০"),
    Station(name: "মিরপুর ১১", fare: "৩০"),
    Station(name: "মিরপুর ১০", fare: "৪০"),
    Station(name: "কাজীপাড়া", fare: "৪০"),
    Station(name: "শেওড়াপাড়া", fare: "৫০"),
    Station(name: "আগারগাঁও", fare: "৬০"),
    Station(name: "বিজয় সরণি", fare: "৬০"),
    Station(name: "ফার্মগেট", fare: "৭০"),
    Station(name: "কারওয়ান বাজার", fare: "৮০"),
    Station(name: "শাহবাগ", fare: "৮০"),
    Station(name: "ঢাকা বিশ্ববিদ্যালয়", fare: "৯০"),
    Station(name: "বাংলাদেশ সচিবালয়", fare: "৯০"),
    Station(name: "মতিঝিল", fare: "১০০"),
    Station(name: "কমলাপুর", fare: "১০০", endTile: true),
  ];

  List<Widget> timelineTiles = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ম্যাপ'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: timelineTiles,
            ),
          ),
        ),
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
