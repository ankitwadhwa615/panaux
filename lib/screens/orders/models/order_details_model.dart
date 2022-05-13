import 'dart:convert';

OrdersDetailsModel ordersDetailsModelFromJson(String str) =>
    OrdersDetailsModel.fromJson(json.decode(str));

String ordersDetailsModelToJson(OrdersDetailsModel data) =>
    json.encode(data.toJson());

class OrdersDetailsModel {
  OrdersDetailsModel({
    this.payment,
    this.status,
    this.amount,
    this.totalQuantity,
    this.id,
    this.vendor,
    this.client,
    this.prescription,
    this.product,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.processedAt,
    this.paidAt,
    this.paymentMode,
    this.dispatchedAt,
    this.driverName,
    this.driverNumber,
  });

  bool? payment;
  String? status;
  double? amount;
  int? totalQuantity;
  String? id;
  Vendor? vendor;
  Client? client;
  String? prescription;
  List<ProductElement>? product;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  DateTime? processedAt;
  DateTime? paidAt;
  String? paymentMode;
  DateTime? dispatchedAt;
  String? driverName;
  String? driverNumber;

  factory OrdersDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrdersDetailsModel(
        payment: json["payment"] == null ? null : json["payment"],
        status: json["status"] == null ? null : json["status"],
        amount: json["amount"] == null ? null : json["amount"].toDouble(),
        totalQuantity:
            json["totalQuantity"] == null ? null : json["totalQuantity"],
        id: json["_id"] == null ? null : json["_id"],
        vendor: json["vendor"] == null ? null : Vendor.fromJson(json["vendor"]),
        client: json["client"] == null ? null : Client.fromJson(json["client"]),
        prescription:
            json["prescription"] == null ? null : json["prescription"],
        product: json["product"] == null
            ? null
            : List<ProductElement>.from(
                json["product"].map((x) => ProductElement.fromJson(x))),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
        processedAt: json["processedAt"] == null
            ? null
            : DateTime.parse(json["processedAt"]),
        paidAt: json["paidAt"] == null ? null : DateTime.parse(json["paidAt"]),
        paymentMode: json["paymentMode"] == null ? null : json["paymentMode"],
        dispatchedAt: json["dispatchedAt"] == null
            ? null
            : DateTime.parse(json["dispatchedAt"]),
        driverName: json["driverName"] == null ? null : json["driverName"],
        driverNumber:
            json["driverNumber"] == null ? null : json["driverNumber"],
      );

  Map<String, dynamic> toJson() => {
        "payment": payment == null ? null : payment,
        "status": status == null ? null : status,
        "amount": amount == null ? null : amount,
        "totalQuantity": totalQuantity == null ? null : totalQuantity,
        "_id": id == null ? null : id,
        "vendor": vendor == null ? null : vendor?.toJson(),
        "client": client == null ? null : client?.toJson(),
        "prescription": prescription == null ? null : prescription,
        "product": product == null
            ? null
            : List<dynamic>.from(product!.map((x) => x.toJson())),
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "__v": v == null ? null : v,
        "processedAt":
            processedAt == null ? null : processedAt?.toIso8601String(),
        "paidAt": paidAt == null ? null : paidAt?.toIso8601String(),
        "paymentMode": paymentMode == null ? null : paymentMode,
        "dispatchedAt":
            dispatchedAt == null ? null : dispatchedAt?.toIso8601String(),
        "driverName": driverName == null ? null : driverName,
        "driverNumber": driverNumber == null ? null : driverNumber,
      };
}

class Client {
  Client({
    this.status,
    this.id,
    this.username,
    this.number,
    this.email,
    this.password,
    this.bloodGroup,
    this.joindate,
    this.addressess,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.wallet,
    this.profilePicture,
  });

  String? status;
  String? id;
  String? username;
  String? number;
  String? email;
  String? password;
  String? bloodGroup;
  DateTime? joindate;
  List<Addressess>? addressess;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? wallet;
  String? profilePicture;

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        status: json["status"] == null ? null : json["status"],
        id: json["_id"] == null ? null : json["_id"],
        username: json["username"] == null ? null : json["username"],
        number: json["number"] == null ? null : json["number"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        bloodGroup: json["blood_group"] == null ? null : json["blood_group"],
        joindate:
            json["joindate"] == null ? null : DateTime.parse(json["joindate"]),
        addressess: json["addressess"] == null
            ? null
            : List<Addressess>.from(
                json["addressess"].map((x) => Addressess.fromJson(x))),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
        wallet: json["wallet"] == null ? null : json["wallet"],
        profilePicture:
            json["profilePicture"] == null ? null : json["profilePicture"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "_id": id == null ? null : id,
        "username": username == null ? null : username,
        "number": number == null ? null : number,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "blood_group": bloodGroup == null ? null : bloodGroup,
        "joindate": joindate == null ? null : joindate?.toIso8601String(),
        "addressess": addressess == null
            ? null
            : List<dynamic>.from(addressess!.map((x) => x.toJson())),
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "__v": v == null ? null : v,
        "wallet": wallet == null ? null : wallet,
        "profilePicture": profilePicture == null ? null : profilePicture,
      };
}

class Addressess {
  Addressess({
    this.id,
    this.addressLine1,
    this.pincode,
    this.city,
    this.state,
    this.country,
    this.latitude,
    this.longitude,
    this.addressLine2,
  });

  String? id;
  String? addressLine1;
  int? pincode;
  String? city;
  String? state;
  String? country;
  String? latitude;
  String? longitude;
  String? addressLine2;

  factory Addressess.fromJson(Map<String, dynamic> json) => Addressess(
        id: json["_id"] == null ? null : json["_id"],
        addressLine1:
            json["addressLine1"] == null ? null : json["addressLine1"],
        pincode: json["pincode"] == null ? null : json["pincode"],
        city: json["city"] == null ? null : json["city"],
        state: json["state"] == null ? null : json["state"],
        country: json["country"] == null ? null : json["country"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        addressLine2:
            json["addressLine2"] == null ? null : json["addressLine2"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "addressLine1": addressLine1 == null ? null : addressLine1,
        "pincode": pincode == null ? null : pincode,
        "city": city == null ? null : city,
        "state": state == null ? null : state,
        "country": country == null ? null : country,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "addressLine2": addressLine2 == null ? null : addressLine2,
      };
}

class ProductElement {
  ProductElement({
    this.id,
    this.product,
    this.quantity,
  });

  String? id;
  ProductProduct? product;
  int? quantity;

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        id: json["_id"] == null ? null : json["_id"],
        product: json["product"] == null
            ? null
            : ProductProduct.fromJson(json["product"]),
        quantity: json["quantity"] == null ? null : json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "product": product == null ? null : product?.toJson(),
        "quantity": quantity == null ? null : quantity,
      };
}

class ProductProduct {
  ProductProduct({
    this.featured,
    this.image,
    this.tags,
    this.status,
    this.id,
    this.title,
    this.description,
    this.soldCount,
    this.tax,
    this.price,
    this.salePrice,
    this.sku,
    this.quantity,
    this.trackQuantity,
    this.continueSelling,
    this.category,
    this.brand,
    this.vendor,
    this.unit,
    this.featuredImage,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Featured? featured;
  List<String>? image;
  List<dynamic>? tags;
  bool? status;
  String? id;
  String? title;
  String? description;
  int? soldCount;
  Tax? tax;
  int? price;
  int? salePrice;
  String? sku;
  String? quantity;
  bool? trackQuantity;
  bool? continueSelling;
  String? category;
  String? brand;
  String? vendor;
  String? unit;
  String? featuredImage;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory ProductProduct.fromJson(Map<String, dynamic> json) => ProductProduct(
        featured: json["featured"] == null
            ? null
            : Featured.fromJson(json["featured"]),
        image: json["image"] == null
            ? null
            : List<String>.from(json["image"].map((x) => x)),
        tags: json["tags"] == null
            ? null
            : List<dynamic>.from(json["tags"].map((x) => x)),
        status: json["status"] == null ? null : json["status"],
        id: json["_id"] == null ? null : json["_id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        soldCount: json["soldCount"] == null ? null : json["soldCount"],
        tax: json["tax"] == null ? null : Tax.fromJson(json["tax"]),
        price: json["price"] == null ? null : json["price"],
        salePrice: json["sale_price"] == null ? null : json["sale_price"],
        sku: json["sku"] == null ? null : json["sku"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        trackQuantity:
            json["track_quantity"] == null ? null : json["track_quantity"],
        continueSelling:
            json["continue_selling"] == null ? null : json["continue_selling"],
        category: json["category"] == null ? null : json["category"],
        brand: json["brand"] == null ? null : json["brand"],
        vendor: json["vendor"] == null ? null : json["vendor"],
        unit: json["unit"] == null ? null : json["unit"],
        featuredImage:
            json["featuredImage"] == null ? null : json["featuredImage"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "featured": featured == null ? null : featured?.toJson(),
        "image":
            image == null ? null : List<dynamic>.from(image!.map((x) => x)),
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((x) => x)),
        "status": status == null ? null : status,
        "_id": id == null ? null : id,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "soldCount": soldCount == null ? null : soldCount,
        "tax": tax == null ? null : tax?.toJson(),
        "price": price == null ? null : price,
        "sale_price": salePrice == null ? null : salePrice,
        "sku": sku == null ? null : sku,
        "quantity": quantity == null ? null : quantity,
        "track_quantity": trackQuantity == null ? null : trackQuantity,
        "continue_selling": continueSelling == null ? null : continueSelling,
        "category": category == null ? null : category,
        "brand": brand == null ? null : brand,
        "vendor": vendor == null ? null : vendor,
        "unit": unit == null ? null : unit,
        "featuredImage": featuredImage == null ? null : featuredImage,
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "__v": v == null ? null : v,
      };
}

class Featured {
  Featured({
    this.status,
  });

  bool? status;

  factory Featured.fromJson(Map<String, dynamic> json) => Featured(
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
      };
}

class Tax {
  Tax({
    this.id,
    this.name,
    this.tax,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? name;
  int? tax;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Tax.fromJson(Map<String, dynamic> json) => Tax(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        tax: json["tax"] == null ? null : json["tax"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "tax": tax == null ? null : tax,
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "__v": v == null ? null : v,
      };
}

class Vendor {
  Vendor({
    this.address,
    this.status,
    this.id,
    this.storeName,
    this.ownerName,
    this.number,
    this.email,
    this.type,
    this.password,
    this.openingTime,
    this.closingTime,
    this.profilePicture,
    this.storeImage,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.document,
    this.wallet,
  });

  Addressess? address;
  bool? status;
  String? id;
  String? storeName;
  String? ownerName;
  int? number;
  String? email;
  String? type;
  String? password;
  String? openingTime;
  String? closingTime;
  String? profilePicture;
  String? storeImage;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? document;
  String? wallet;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        address: json["address"] == null
            ? null
            : Addressess.fromJson(json["address"]),
        status: json["status"] == null ? null : json["status"],
        id: json["_id"] == null ? null : json["_id"],
        storeName: json["storeName"] == null ? null : json["storeName"],
        ownerName: json["ownerName"] == null ? null : json["ownerName"],
        number: json["number"] == null ? null : json["number"],
        email: json["email"] == null ? null : json["email"],
        type: json["type"] == null ? null : json["type"],
        password: json["password"] == null ? null : json["password"],
        openingTime: json["openingTime"] == null ? null : json["openingTime"],
        closingTime: json["closingTime"] == null ? null : json["closingTime"],
        profilePicture:
            json["profilePicture"] == null ? null : json["profilePicture"],
        storeImage: json["storeImage"] == null ? null : json["storeImage"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
        document: json["document"] == null ? null : json["document"],
        wallet: json["wallet"] == null ? null : json["wallet"],
      );

  Map<String, dynamic> toJson() => {
        "address": address == null ? null : address?.toJson(),
        "status": status == null ? null : status,
        "_id": id == null ? null : id,
        "storeName": storeName == null ? null : storeName,
        "ownerName": ownerName == null ? null : ownerName,
        "number": number == null ? null : number,
        "email": email == null ? null : email,
        "type": type == null ? null : type,
        "password": password == null ? null : password,
        "openingTime": openingTime == null ? null : openingTime,
        "closingTime": closingTime == null ? null : closingTime,
        "profilePicture": profilePicture == null ? null : profilePicture,
        "storeImage": storeImage == null ? null : storeImage,
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "__v": v == null ? null : v,
        "document": document == null ? null : document,
        "wallet": wallet == null ? null : wallet,
      };
}
