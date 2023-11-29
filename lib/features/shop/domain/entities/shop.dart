import '/features/shop/domain/entities/location.dart';

class Shop {
  final Location location;
  final String user;
  final String name;
  final String description;
  final bool status;
  final String uid;

  Shop({
    required this.location,
    required this.user,
    required this.name,
    required this.description,
    required this.status,
    required this.uid,
  });

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "user": user,
        "name": name,
        "description": description,
        "status": status,
        "uid": uid,
      };
}
