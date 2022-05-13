import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.featured,
    required this.image,
    required this.tags,
    required this.status,
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    this.subCategory,
    required this.brand,
    required this.unit,
    required this.tax,
    this.delievery,
    required this.price,
    required this.salePrice,
    required this.sku,
    required this.quantity,
    required this.continueSelling,
    required this.trackQuantity,
    required this.featuredImage,
    this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.vendor,
  });

  Featured featured;
  List<String> image;
  List<String> tags;
  bool status;
  String id;
  String title;
  String description;
  String category;
  String? subCategory;
  String brand;
  String unit;
  Tax tax;
  String? delievery;
  int price;
  int salePrice;
  String sku;
  String quantity;
  bool continueSelling;
  bool trackQuantity;
  String featuredImage;
  String? userId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String vendor;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    featured: Featured.fromJson(json["featured"]),
    image: List<String>.from(json["image"].map((x) => x)),
    tags: List<String>.from(json["tags"].map((x) => x)),
    status: json["status"],
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    category: json["category"],
    subCategory: json["subCategory"]==null?"":json["subCategory"],
    brand: json["brand"],
    unit: json["unit"],
    tax: Tax.fromJson(json["tax"]),
    delievery: json["delievery"]==null?"":json["delievery"],
    price: json["price"],
    salePrice: json["sale_price"],
    sku: json["sku"],
    quantity: json["quantity"],
    continueSelling: json["continue_selling"],
    trackQuantity: json["track_quantity"],
    featuredImage: json["featuredImage"],
    userId: json["userID"]== null?"":json["userID"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    vendor: json["vendor"],
  );

  Map<String, dynamic> toJson() => {
    "featured": featured.toJson(),
    "image": List<dynamic>.from(image.map((x) => x)),
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "status": status,
    "_id": id,
    "title": title,
    "description": description,
    "category": category,
    "subCategory": subCategory,
    "brand": brand,
    "unit": unit,
    "tax": tax.toJson(),
    "delievery": delievery,
    "price": price,
    "sale_price": salePrice,
    "sku": sku,
    "quantity": quantity,
    "continue_selling": continueSelling,
    "track_quantity": trackQuantity,
    "featuredImage": featuredImage,
    "userID": userId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "vendor": vendor,
  };
}

class Featured {
  Featured({
    required this.status,
  });

  bool status;

  factory Featured.fromJson(Map<String, dynamic> json) => Featured(
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
  };
}

class Tax {
  Tax({
    required this.id,
    required this.name,
    required this.tax,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String name;
  int tax;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Tax.fromJson(Map<String, dynamic> json) => Tax(
    id: json["_id"],
    name: json["name"],
    tax: json["tax"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "tax": tax,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
