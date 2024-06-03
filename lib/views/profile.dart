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
    return FutureBuilder(
      future: Provider.of<GetInformationProvider>(context, listen: false)
          .fetchInformation(),
      builder: (ctx, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<GetInformationProvider>(
                  builder: (ctx, infoData, _) => Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
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
    );
  }
}
