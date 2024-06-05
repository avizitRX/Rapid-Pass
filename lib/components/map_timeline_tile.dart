import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapid_pass/providers/map_timeline_tile_provider.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MapTimelineTile extends StatelessWidget {
  MapTimelineTile(
      {super.key,
      required this.stationName,
      required this.fare,
      required this.startTile,
      required this.endTile});

  final String stationName;
  final String fare;
  bool startTile = false;
  bool endTile = false;

  @override
  Widget build(BuildContext context) {
    Color mainColor =
        context.read<MapTimelineTileProvider>().whatColor(context);

    return TimelineTile(
      isFirst: startTile,
      isLast: endTile,
      alignment: TimelineAlign.start,
      indicatorStyle: IndicatorStyle(
        width: 40,
        color: mainColor,
        padding: const EdgeInsets.all(8),
        iconStyle: IconStyle(
          color: Colors.white,
          iconData: Icons.train_rounded,
        ),
      ),
      beforeLineStyle: LineStyle(
        color: mainColor,
      ),
      afterLineStyle: LineStyle(
        color: mainColor,
      ),
      endChild: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(vertical: 10),
        constraints: const BoxConstraints(
          minHeight: 80,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: mainColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              stationName,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
            Text(
              '৳ $fare',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.lightGreenAccent,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
