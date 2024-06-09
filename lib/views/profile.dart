import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapid_pass/components/profile_page_info_card.dart';
import 'package:rapid_pass/providers/get_information_provider.dart';
import 'package:rapid_pass/views/settings.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          FutureBuilder(
            future: Provider.of<GetInformationProvider>(context, listen: false)
                .fetchInformation(),
            builder: (ctx, snapshot) => snapshot.connectionState ==
                    ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<GetInformationProvider>(
                    builder: (ctx, infoData, _) => SingleChildScrollView(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.person_rounded,
                            size: 72,
                          ),
                          Text(
                            'প্রোফাইল',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          // Profile Information / Card Add
                          ProfilePageInfoCard(
                            infoData: infoData,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Settings(infoData),
                              ),
                            ),
                            child: const Text('সেটিংস'),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
          Text(
            '** নোট: Rapid Pass একটি অফলাইন কার্ড হওয়ায় লাইভ ব্যালেন্স দেখা সম্ভব নয়। সার্ভারের সর্বশেষ আপডেট অনুযায়ী ব্যালেন্স প্রদর্শিত হয়। সাধারণত প্রতি ২৪ ঘন্টায় সার্ভার আপডেট হয়।\nএছাড়াও অনেক সময় সার্ভার ডাউন থাকার কারণে ব্যালেন্স চেক ব্যর্থ হতে পারে। এক্ষেত্রে কিছুক্ষণ অপেক্ষা করে আবার চেষ্টা করুন।',
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.red,
                ),
          ),
        ],
      ),
    );
  }
}
