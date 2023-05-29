// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  final List<ListBanner> listBanner;

  Product({
    required this.listBanner,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        listBanner: List<ListBanner>.from(
            json["listBanner"].map((x) => ListBanner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "listBanner": List<dynamic>.from(listBanner.map((x) => x.toJson())),
      };
}

class ListBanner {
  final int id;
  final String imagePath;

  ListBanner({
    required this.id,
    required this.imagePath,
  });

  factory ListBanner.fromJson(Map<String, dynamic> json) => ListBanner(
        id: json["id"],
        imagePath: json["image_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image_path": imagePath,
      };
}
