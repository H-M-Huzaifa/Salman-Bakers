class Cart {
  late final int? id;
  final String? productId;
  final String? productName;
  final int? productPrices;
  final int? quantity;
  final String? image;

  Cart({
    required this.id,
    required this.productId,
    required this.productName,
    required this.productPrices,
    required this.quantity,
    required this.image,
  });

  Cart.fromMap(Map<dynamic , dynamic> res)
  : id = res['id'],
        productId = res["productId"],
        productName = res["productName"],
        productPrices = res["productPrices"],
        quantity = res["quantity"],
        image = res["image"];

  Map<String , Object?> toMap() {
    return {
      'id':id,
    'productId':productId,
    'productName':productName,
    'productPrices':productPrices,
    'quantity':quantity,
    'image':image,


    };
  }

}