import 'order.dart';

class Nota {
  String? id;
  String? pelanggan;
  String? totalOrder;
  String? tanggal;
  String? kasir;
  List<Order>? orders;
  bool? status;

  Nota({
    this.id,
    this.pelanggan,
    this.totalOrder,
    this.tanggal,
    this.kasir,
    this.orders,
    this.status,
  });

  Nota.fromJson(Map<String, dynamic> json, String idNota) {
    id = idNota;
    pelanggan = json['pelanggan'];
    totalOrder = json['totalOrder'];
    tanggal = json['tanggal'].toString();
    kasir = json['kasir'].toString();
    if (json['orders'] != null) {
      orders = <Order>[];
      json['orders'].forEach((v) {
        orders!.add(Order.fromJson(v));
      });
    }
    status = json['status'];
    // time = json['time'];
    // if (json['orders'].foreach((v) {
    //   orders!.add(Order.fromJson(v));
    // })) ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pelanggan'] = pelanggan;
    data['totalOrder'] = totalOrder;
    data['tanggal'] = tanggal;
    data['kasir'] = kasir;
    // data['time'] = time;
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}
