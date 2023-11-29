import '../mappers/shop_mapper.dart';
import '../../domain/entities/shop.dart';


class ShopsResponse {
    final int total;
    final List<Shop> companies;

    ShopsResponse({
        required this.total,
        required this.companies,
    });

    factory ShopsResponse.fromJson(Map<String, dynamic> json) => ShopsResponse(
        total: json["total"],
        companies: List<Shop>.from(json["companies"].map((x) => ShopMapper.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "companies": List<dynamic>.from(companies.map((x) => x.toJson())),
    };
}