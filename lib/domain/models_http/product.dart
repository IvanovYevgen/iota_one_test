import 'package:injectable/injectable.dart';
import 'package:iota_one_test/domain/models_http/price.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  String? id;
  String? sKU;
  String? name;
  String? brandName;
  String? mainImage;
  Price? price;
  List<String>? sizes;
  String? stockStatus;
  String? colour;
  String? description;

  Product(
      {this.id,
        this.sKU,
        this.name,
        this.brandName,
        this.mainImage,
        this.price,
        this.sizes,
        this.stockStatus,
        this.colour,
        this.description});

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
