import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rapid_pass/services/admob_services.dart';

class Fine extends StatefulWidget {
  const Fine({super.key});

  @override
  State<Fine> createState() => _FineState();
}

class _FineState extends State<Fine> {
  static bannerAds(BuildContext context) {
    return Builder(
      builder: (ctx) {
        final BannerAd myBanner = BannerAd(
          size: AdSize.fullBanner,
          adUnitId: AdmobServices.bannerAdUnitId!,
          listener: AdmobServices.bannerListener,
          request: const AdRequest(),
        )..load();

        return SizedBox(
          width: myBanner.size.width.toDouble(),
          height: myBanner.size.height.toDouble(),
          child: AdWidget(ad: myBanner),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('জরিমানা'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: const [
                      TextSpan(
                        text:
                            '''বাংলাদেশের প্রথম মেট্রোরেল ‘ঢাকা মেট্রোরেল’। অনেকেই মেট্রোরেল ভ্রমণে অভ্যস্ত নাই বিধায় জরিমানা সংক্রান্ত বিষয়ে কম অবগত থাকেন। এখানে ঢাকা মেট্রোরেলের সব ধরনের জরিমানা নিয়ে আলোচনা করা হয়েছে।''',
                      ),
                      TextSpan(
                        text: '''


১) এক ঘন্টা ওভারটাইম ১০০ টাকা। অর্থাৎ, আপনি টিকেট কেটে বা আপনার MRT or Rapid Pass দিয়ে এন্ট্রি গেইট থেকে ঢুকলেই টাইম কাউন্টিং শুরু হবে। এরপর ১ ঘন্টা বা ৬০ মিনিটসের বেশী টাইম পেইড জোনে থাকলেই জরিমানা হবে। সুতরাং, অযথা সময় নষ্ট করা যাবেনা। (ভাড়া তো কাটবেই সাথে জরিমানা)
''',
                      ),
                    ],
                  ),
                ),
                bannerAds(context),
                const SizedBox(
                  height: 5,
                ),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: const [
                      TextSpan(
                        text:
                            '''২) SJT (Single Journey Ticket) কার্ড হারিয়ে ফেললে ২০০ টাকা। অর্থাৎ আপনি টিকেট কেটে ভিতরে যাওয়ার পর অসাবধানতায় কার্ডটি হারিয়ে ফেললে অথবা টিকেট ছাড়া পেইড জোনে কাউকে পাওয়া গেলে ২০০ টাকা জরিমানা গুনতে হবে।
                            ''',
                      ),
                    ],
                  ),
                ),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: const [
                      TextSpan(
                        text:
                            '''৩) MRT / Rapid Pass এন্ট্রি করে এক্সিট ঠিকভাবে না করে বের হয়ে গেলে যদি ঐদিনের মধ্যে EFO (Excess Fare Office) থেকে ঠিক করিয়ে নেন তাহলে আপনার এন্ট্রি অবস্থান সময় অনুযায়ী ৭৮/৯৬ টাকা কাটবে। আর যদি পরের দিন এক্সিট করেন তাহলে ২০০ টাকা (ভাড়া + জরিমানা মিলে মোট) কাটবে।
                        ''',
                      ),
                    ],
                  ),
                ),
                bannerAds(context),
                const SizedBox(
                  height: 5,
                ),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: const [
                      TextSpan(
                        text:
                            '''৪) MRT pass দিয়ে এন্ট্রি করে একই স্টেশনে ৫ মিনিট অতিবাহিত হওয়ার পরে এক্সিট করলে ৬০ টাকা কাটবে। যদি ট্রেন না পাওয়া যায় বা বিশেষ প্রয়োজনে আপনি ট্রাভেল না করে চলে আসেন তাহলে যথোপযুক্ত প্রমাণ দেখিয়ে EFO কাউন্টার ইনচার্জের কাছে যথোপযুক্ত কারণ বলবেন উনি কার্ড আপডেট করে দিবেন এবং আপনি এক্সিট হবেন তাহলে কোন টাকা কাটবেনা। কার্ড আপডেট না করে এক্সিট হলে আর টাকা কেটে নিলে এরপর তর্ক করে লাভ হবেনা। সুতরাং, আগেই EFO কাউন্টারে জানান।
                            ''',
                      ),
                    ],
                  ),
                ),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: const [
                      TextSpan(
                        text:
                            '''৫) অনেক সময় ট্রেন শিডিউল বিপর্যয় হতে পারে তখন পিজি এক্সিট গেটে এক্সিট এক্সামশন মোড করা থাকে। তখন গেট দিয়ে পাঞ্চ করে বের হলে অতিরিক্ত টাকা কাটার কথা না। যদি টাকা কাটে তখন আপনি অভিযোগ দিয়ে প্রতিকার চাইতে পারবেন। সেক্ষেত্রে আপনাকে এক্সিট গেইটের ডিসপ্লেতে খেয়াল করতে হবে, কত টাকা কেটেছে!
                            ''',
                      ),
                    ],
                  ),
                ),
                bannerAds(context),
                const SizedBox(
                  height: 5,
                ),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: const [
                      TextSpan(
                        text: '''
৬) SJT (Single Journey Ticket) এর ক্ষেত্রে আগের মতই, ভাড়ার অতিরিক্ত ট্রাভেল করলে বাকি টাকা জরিমানা দিতে হবে।''',
                      ),
                    ],
                  ),
                ),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: const [
                      TextSpan(
                        text: '''

৭) একটা MRT pass দিয়ে শুধুমাত্র একজন যেতে পারবেন। এছাড়া অন্যদের টিকেট লাগবে। যদি কাউকে এক পাসের বিপরীতে একাধিক জনের এন্ট্রি পাওয়া যায় তাহলে কার্ডধারী ব্যতীত বাকি সবার জন্য ১২০ টাকা করে জরিমানা দিতে হবে।''',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: bannerAds(context),
      ),
    );
  }
}
