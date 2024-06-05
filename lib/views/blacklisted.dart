import 'package:flutter/material.dart';

class Blacklisted extends StatelessWidget {
  const Blacklisted({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'ব্ল্যাকলিস্টেড',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'মেট্রোরেল যাত্রাকে নির্বিঘ্ন করতে আপনার প্রয়োজন হবে একটি কার্ড । যেসব কারণে এমআরটি/র‌্যাপিড পাস কার্ড ব্লাকলিস্টেড হয় তা এখানে আলোচনা করা হয়েছে',
                style: Theme.of(context).textTheme.bodyLarge,
                children: const [
                  TextSpan(
                    text: '''
            
            
১) বারবার কার্ড পাঞ্চ করা''',
                    style: TextStyle(color: Colors.red),
                  ),
                  TextSpan(
                    text: '''
            
এন্ট্রি বা এক্সিট গেইটে বারবার পাঞ্চ করার কারণে হতে পারে। অর্থাৎ, আপনার সামনের ব্যক্তি যাওয়ার পরে একটু সময় দিন, এরপর আপনার কার্ড পাঞ্চ করুন একবারই, তারপর এন্ট্রি/এক্সিট হন।''',
                  ),
                  TextSpan(
                    text: '''
            
            
২) রি-ইস্যু আবেদন করা কার্ড পরবর্তীতে ব্যবহার চেষ্টা না করা''',
                    style: TextStyle(color: Colors.red),
                  ),
                  TextSpan(
                    text: '''
            
আপনার কার্ড হারিয়ে গেলে তা আবার রি-ইস্যু আবেদন (কার্ড রিপ্লেসমেন্ট) করার পর  হারানো কার্ডটি ফিরে পেলে তা ব্যবহার চেষ্টা করা যাবেনা। হারানো কার্ড খুঁজে পেলে তা জমা দিয়ে জামানতের টাকা ফেরত নেয়া যাবে, কিন্তু ব্যবহারের জন্য পাঞ্চ করা যাবেনা।''',
                  ),
                  TextSpan(
                    text: '''
            
            
৩) এন্ট্রি ক্যানসেল করা''',
                    style: TextStyle(color: Colors.red),
                  ),
                  TextSpan(
                    text: '''
            
কোনো কারণে যাত্রা বাতিল হলে বা ট্রেন বিলম্ব হলে এন্ট্রি ক্যানসেল করতে হয়, সেক্ষেত্রেও কার্ড ব্লাকলিস্টেড হওয়ার সম্ভাবনা থাকে। বার বার বা রেগুলার এটি করলে কার্ডের ক্ষতি হতে পারে। (মোবাইলের মেমোরি কার্ড যেমন বার বার ফরম্যাট করলে Health ক্ষতিগ্রস্ত হয় ঠিক তেমন।)''',
                  ),
                  TextSpan(
                    text: '''
            
            
৪) কার্ড পাঞ্চ না করেই বের হয়ে যাওয়া''',
                    style: TextStyle(color: Colors.red),
                  ),
                  TextSpan(
                    text: '''
            
অনেক সময় তাড়াহুড়োতে কার্ড পাঞ্চ না করেই অনেকে বের হয়ে যান। পরবর্তীতে কার্ড আপডেট করতে হয় জরিমানা প্রদান করে। সেক্ষেত্রে কার্ড ব্লাকলিস্টেড হতে পারে। এছাড়াও রিচার্জ / এন্ট্রি / এক্সিটের সময় তাড়াহুড়ো করলে অসমাপ্ত ট্রানজেকশনের ফলেও কার্ডটি ব্ল্যাকলিস্টেড হতে পারে।''',
                  ),
                  TextSpan(
                    text: '''
            
            
৫) NFC চেক করার চেষ্টা''',
                    style: TextStyle(color: Colors.red),
                  ),
                  TextSpan(
                    text: '''
            
এটি একটি NFC Technology’র অফলাইন স্টোর ভ্যালুড কার্ড। কার্ডের যাবতীয় তথ্য কার্ডের ভেতরের চিপে সংরক্ষিত থাকে এবং ব্যবহারের সময় অথোরাইজড ডিভাইসের মাধ্যমে এতে ডাটা রিড/রাইট হয়। সুতরাং, আন-অথোরাইজড কোনো NFC Device/App এর মাধ্যমে MRT/Rapid Pass ক্লোন/রিড/রাইট করার চেষ্টা করলে কার্ডটি বাতিল / ব্ল্যাকলিস্টেড হতে পারে।''',
                  ),
                  TextSpan(
                    text: '''
            
            
৬) অসংবেদনশীল তাপ ও চাপ প্রয়োগ''',
                    style: TextStyle(color: Colors.red),
                  ),
                  TextSpan(
                    text: '''
            
অতিরিক্ত তাপমাত্রায় কার্ড সংরক্ষণ করা যাবেনা। ওয়ালেটে রেখে অতিরিক্ত চাপ প্রয়োগ করা যাবেনা।''',
                  ),
                  TextSpan(
                    text: '''
            
            
৭) কার্ড নাম্বার শেয়ার না করা''',
                    style: TextStyle(color: Colors.red),
                  ),
                  TextSpan(
                    text: '''
            
আপনার ব্যবহৃত কার্ডের নাম্বার, NID number ইত্যাদি ব্যক্তিগত তথ্যাদি কারো সাথে শেয়ার করবেন না।''',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
