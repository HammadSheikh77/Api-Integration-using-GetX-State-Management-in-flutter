import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  bool? status;
  String? message;
  List<Product>? products;

  ProductModel({
    this.status,
    this.message,
    this.products,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        status: json["status"],
        message: json["message"],
        products: json["Products"] == null
            ? []
            : List<Product>.from(
                json["Products"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "Products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Product {
  int? id;
  String? title;
  String? slug;
  String? summary;
  String? description;
  String? photo;
  String? image;
  dynamic mainImages;
  dynamic video;
  int? stock;
  String? size;
  Condition? condition;
  Status? status;
  int? price;
  int? discount;
  int? isFeatured;
  int? catId;
  int? childCatId;
  dynamic brandId;
  dynamic vendorId;
  String? isFavourite;
  DateTime? createdAt;
  DateTime? updatedAt;

  Product({
    this.id,
    this.title,
    this.slug,
    this.summary,
    this.description,
    this.photo,
    this.image,
    this.mainImages,
    this.video,
    this.stock,
    this.size,
    this.condition,
    this.status,
    this.price,
    this.discount,
    this.isFeatured,
    this.catId,
    this.childCatId,
    this.brandId,
    this.vendorId,
    this.isFavourite,
    this.createdAt,
    this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        summary: json["summary"],
        description: json["description"],
        photo: json["photo"],
        image: json["image"],
        mainImages: json["main_images"],
        video: json["video"],
        stock: json["stock"],
        size: json["size"],
        condition: conditionValues.map[json["condition"]]!,
        status: statusValues.map[json["status"]]!,
        price: json["price"],
        discount: json["discount"],
        isFeatured: json["is_featured"],
        catId: json["cat_id"],
        childCatId: json["child_cat_id"],
        brandId: json["brand_id"],
        vendorId: json["vendor_id"],
        isFavourite: json["is_favourite"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "summary": summary,
        "description": description,
        "photo": photo,
        "image": image,
        "main_images": mainImages,
        "video": video,
        "stock": stock,
        "size": size,
        "condition": conditionValues.reverse[condition],
        "status": statusValues.reverse[status],
        "price": price,
        "discount": discount,
        "is_featured": isFeatured,
        "cat_id": catId,
        "child_cat_id": childCatId,
        "brand_id": brandId,
        "vendor_id": vendorId,
        "is_favourite": isFavourite,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

enum Condition { DEFAULT, HOT, NEW }

final conditionValues = EnumValues(
    {"default": Condition.DEFAULT, "hot": Condition.HOT, "new": Condition.NEW});

enum Status { ACTIVE }

final statusValues = EnumValues({"active": Status.ACTIVE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
