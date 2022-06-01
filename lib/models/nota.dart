import 'order.dart';

class Nota {
  String? pelanggan;
  String? total;
  String? tanggal;
  List<Order>? orders;

  Nota({this.pelanggan, this.total, this.tanggal, this.orders});

  Nota.fromJson(Map<String, dynamic> json) {
    pelanggan = json['pelanggan'];
    total = json['total'];
    tanggal = json['tanggal'];
    if (json['orders'] != null) {
      orders = <Order>[];
      json['orders'].forEach((v) {
        orders!.add(Order.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pelanggan'] = pelanggan;
    data['total'] = total;
    data['tanggal'] = tanggal;
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
