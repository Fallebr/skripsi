import 'order.dart';

class Nota {
  String? pelanggan;
  String? totalOrder;
  String? tanggal;
  String? uangPelanggan;
  List<Order>? orders;

  Nota(
      {this.pelanggan,
      this.totalOrder,
      this.tanggal,
      this.orders,
      this.uangPelanggan});

  Nota.fromJson(Map<String, dynamic> json) {
    pelanggan = json['pelanggan'];
    totalOrder = json['totalOrder'];
    tanggal = json['tanggal'];
    uangPelanggan = json['uangPelanggan'];
    if (json['orders'] != null) {
      orders = <Order>[];
      json['orders'].forEach((v) {
        orders!.add(Order.fromJson(v));
      });
    }
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
    data['uangPelanggan'] = uangPelanggan;
    // data['time'] = time;
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
