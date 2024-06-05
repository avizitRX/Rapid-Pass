import 'package:flutter/material.dart';
import 'package:rapid_pass/components/station_data_table.dart';

class Station extends StatelessWidget {
  const Station({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('স্টেশন'),
        ),
        body: StationDataTable().buildDataTable(),
      ),
    );
  }
}
