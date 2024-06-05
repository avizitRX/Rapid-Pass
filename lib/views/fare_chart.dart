import 'package:flutter/material.dart';
import 'package:rapid_pass/components/fare_chart_data_table.dart';

class FareChart extends StatelessWidget {
  const FareChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ভাড়ার তালিকা'),
        ),
        body: FareChartDataTable().buildDataTable(),
      ),
    );
  }
}
