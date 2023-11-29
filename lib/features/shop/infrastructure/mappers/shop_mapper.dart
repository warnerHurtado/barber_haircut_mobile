import '/features/shop/infrastructure/mappers/location_mapper.dart';
import '../../domain/entities/shop.dart';

class ShopMapper {
      static Shop fromJson(Map<String, dynamic> json) => Shop(
        location: LocationMapper.fromJson(json["location"]),
        user: json["user"],
        name: json["name"],
        description: json["description"],
        status: json["status"],
        uid: json["uid"],
    );
}