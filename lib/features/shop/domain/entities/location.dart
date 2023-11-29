class Location {
  final double lat;
  final double lon;

  Location({
    required this.lat,
    required this.lon,
  });

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
      };
}
