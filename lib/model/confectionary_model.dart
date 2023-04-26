class ConfectionaryModel {
    ConfectionaryModel({
        this.categoryItems,
    });

    final List<CategoryItem>? categoryItems;

    factory ConfectionaryModel.fromJson(Map<String, dynamic> json) => ConfectionaryModel(
        categoryItems: List<CategoryItem>.from(json["categoryItems"].map((x) => CategoryItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "categoryItems": List<dynamic>.from(categoryItems!.map((x) => x.toJson())),
    };
}

class CategoryItem {
    CategoryItem({
        this.productName,
        this.price,
        this.quantity,
    });

    final String? productName;
    final String? price;
    final int? quantity;

    factory CategoryItem.fromJson(Map<String, dynamic> json) => CategoryItem(
        productName: json["productName"],
        price: json["price"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "productName": productName,
        "price": price,
        "quantity": quantity,
    };
}
