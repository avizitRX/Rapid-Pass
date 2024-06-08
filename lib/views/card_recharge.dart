import 'package:flutter/material.dart';

class CardRecharge extends StatelessWidget {
  const CardRecharge({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('কার্ড রিচার্জ'),
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
                        text: '''Rapid Pass যেখানে রিচার্জ করবেন:''',
                        style: TextStyle(color: Colors.red),
                      ),
                      TextSpan(
                        text: '''

• ডাচ বাংলা ব্যাংকের নির্দিষ্ট ব্রাঞ্চ ও সাব-ব্রাঞ্চে।
• র‍্যাপিড পাস বিক্রির এজেন্ট পয়েন্টে।(ভ্রাম্যমাণ ক্যাম্পেইনে রিচার্জ হয়না)।
• মেট্রোরেল স্টেশনের টিকেট ভেন্ডিং মেশিন (TVM)থেকে।
• মেট্রোরেল স্টেশনের টিকেট কাউন্টার বা এক্সেস ফেয়ার অফিস (EFO) থেকে।
''',
                      ),
                    ],
                  ),
                ),
                InteractiveViewer(
                  panEnabled: true,
                  child: const Image(
                    image: AssetImage('assets/images/card_recharge/1.jpg'),
                  ),
                ),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: const [
                      TextSpan(
                        text:
                            '''মেট্রোরেলের প্রত্যেক স্টেশনেই দেখবেন Ticket Vending Machine আছে সেখান থেকে আপনার  Rapid Pass যেখানে রিচার্জ করতে পারবেন।
                            ''',
                      ),
                    ],
                  ),
                ),
                InteractiveViewer(
                  panEnabled: true,
                  child: const Image(
                    image: AssetImage('assets/images/card_recharge/2.jpg'),
                  ),
                ),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: const [
                      TextSpan(
                        text:
                            '''Ticket Vending Machine এর কার্ড রাখার নির্দিষ্ট ট্রে-তে (বাম পাশে) আপনার র‍্যাপিড পাস কার্ডটি রাখবেন।
                            ''',
                      ),
                    ],
                  ),
                ),
                InteractiveViewer(
                  panEnabled: true,
                  child: const Image(
                    image: AssetImage('assets/images/card_recharge/3.jpg'),
                  ),
                ),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: const [
                      TextSpan(
                        text: '''কার্ডটি রাখার পর টপ-আপ লিখাতে ক্লিক করুন।
                        ''',
                      ),
                    ],
                  ),
                ),
                InteractiveViewer(
                  panEnabled: true,
                  child: const Image(
                    image: AssetImage('assets/images/card_recharge/4.jpg'),
                  ),
                ),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: const [
                      TextSpan(
                        text:
                            '''আপনি কত টাকা রিচার্জ করবেন  তার  উপর ক্লিক করুন, তখন আপনাকে আপনার কার্ডের বর্তমান ব্যালেন্স ও রিচার্জ পরবর্তী ব্যালেন্স কত হবে তা দেখাবে।
                            ''',
                      ),
                    ],
                  ),
                ),
                InteractiveViewer(
                  panEnabled: true,
                  child: const Image(
                    image: AssetImage('assets/images/card_recharge/5.jpg'),
                  ),
                ),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: const [
                      TextSpan(
                        text:
                            '''এবার ডান পাশে টাকা ঢুকানোর স্থানে একটি করে নোট ভাঁজবিহীন ভাবে প্রবেশ করাবেন। কয়েক সেকেন্ড অপেক্ষা করবেন, আপনার কার্ড রিচার্জ প্রক্রিয়া শেষ হলে ডিসপ্লেতে দেখাবে এবং স্পিকারেও সাউন্ড শুনতে পাবেন, তা খেয়াল করুন। তারপর কার্ডটি ট্রে থেকে তুলুন।''',
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

সতর্কতাঃ ''',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text:
                            '''কোনোভাবেই কার্ডটি রিচার্জ সম্পন্ন হওয়ার আগে তুলবেন না, তাহলে আপনার কার্ড ব্ল্যাকলিস্টেড হওয়ার সম্ভাবনা থাকবে এবং তখন রিচার্জ সম্পন্ন হওয়ার আগে টাকা আটকে যাবে ও মেশিনটি তৎক্ষনাৎ সার্ভিস প্রদানের জন্য উপযুক্ত থাকবেনা। সুতরাং, পুরোপুরিভাবে রিচার্জ প্রক্রিয়া শেষ হওয়ার পরেই কার্ডটি ট্রে থেকে তুলুন , তার আগে না।''',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
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

এছাড়াও আপনি মেট্রোরেল স্টেশনের টিকেট কাউন্টার বা EFO থেকেও দায়িত্বরত অপারেটর দ্বারা কার্ড রিচার্জ করাতে পারবেন।

র‍্যাপিড পাসে প্রতি বারে সর্বোচ্চ ১০০০/- ও সর্বনিম্ন ২০/- করে রিচার্জ করা যাবে। অপরদিকে এমআরটি পাসে সর্বনিম্ন ২০/- ও সর্বোচ্চ ১০০০০/- রিচার্জ করা যাবে। তবে কোনো কার্ডেই মোট ব্যালেন্স ১০০০০/- এর বেশী ব্যালেন্স রাখা যাবেনা।''',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
