import '/features/shop/domain/entities/location.dart';

class LocationMapper {
  static Location fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
      );
}
