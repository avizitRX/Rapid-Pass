import 'package:flutter/material.dart';
import 'package:rapid_pass/models/categories.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  // InterstitialAd? _interstitialAd;

  @override
  void initState() {
    super.initState();
    // _createInterstitialAd();
  }

  // void _createInterstitialAd() {
  //   InterstitialAd.load(
  //     adUnitId: AdmobServices.interstitialAdUnitId!,
  //     request: const AdRequest(),
  //     adLoadCallback: InterstitialAdLoadCallback(
  //       onAdLoaded: (ad) => _interstitialAd = ad,
  //       onAdFailedToLoad: (LoadAdError error) => _interstitialAd = null,
  //     ),
  //   );
  // }

  // void _showInterstitialAd(url) {
  //   if (_interstitialAd != null) {
  //     _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
  //       onAdDismissedFullScreenContent: (ad) {
  //         ad.dispose();
  //         _createInterstitialAd();

  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => url,
  //           ),
  //         );
  //       },
  //       onAdFailedToShowFullScreenContent: (ad, error) {
  //         ad.dispose();
  //         _createInterstitialAd();
  //       },
  //     );
  //     _interstitialAd!.show();
  //     _interstitialAd = null;
  //   }
  // }

  @override
  void dispose() {
    super.dispose();
    // _interstitialAd!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (_, index) {
          var category = categories[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    category.name,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),

                const SizedBox(
                  height: 5,
                ),

                // Sub Category
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 0,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: category.subcategories.length,
                        itemBuilder: (context, subIndex) {
                          final subcategory = category.subcategories[subIndex];
                          return GestureDetector(
                            onTap: () {
                              // _showInterstitialAd(subcategory.url);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => subcategory.url!),
                              );
                            },
                            child: Column(
                              key: subcategory.key,
                              children: [
                                Card(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryFixedDim,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 54,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(subcategory.icon),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  subcategory.name,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
