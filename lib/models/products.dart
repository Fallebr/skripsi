class Product {
  String? id;
  int? harga;
  String? nama;
  String? kategori;
  String? tipe;

  Product({this.id, this.harga, this.nama, this.kategori, this.tipe});

  Product.fromJson(Map<String, dynamic> json, String idDocument) {
    id = idDocument;
    harga = json['harga'];
    nama = json['nama'];
    kategori = json['kategori'];
    tipe = json['tipe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['harga'] = this.harga;
    data['nama'] = this.nama;
    data['kategori'] = this.kategori;
    data['tipe'] = this.tipe;
    return data;
  }
}
