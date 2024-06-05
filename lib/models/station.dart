class Station {
  final String name;
  final String fare;
  final bool startTile;
  final bool endTile;

  Station({
    required this.name,
    required this.fare,
    this.startTile = false,
    this.endTile = false,
  });
}
