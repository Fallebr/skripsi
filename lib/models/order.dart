import 'products.dart';

class Order {
  Product? product;
  String? qty;

  Order({this.product, this.qty});

  Order.fromJson(Map<String, dynamic> json) {
    product = json['product'] != null
        ? Product.fromSimpleJson(json['product'])
        : null;
    qty = json['qty'];
  }

  get tanggal => null;

  get pelanggan => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (product != null) {
      data['product'] = product!.toJson();
    }
    data['qty'] = qty;
    return data;
  }
}
