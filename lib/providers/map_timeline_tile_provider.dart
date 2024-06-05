import 'package:flutter/material.dart';

class MapTimelineTileProvider extends ChangeNotifier {
  bool flag;

  MapTimelineTileProvider({
    this.flag = true,
  });

  Color whatColor(BuildContext context) {
    if (flag) {
      flag = !flag;
      notifyListeners();
      return Theme.of(context).colorScheme.primary;
    } else {
      flag = !flag;
      notifyListeners();
      return Theme.of(context).colorScheme.secondary;
    }
  }
}
