class Product {
  String? id;
  int? harga;
  String? nama;
  String? kategori;
  String? tipe;
  String? uangPelanggan;

  Product(
      {this.id,
      this.harga,
      this.nama,
      this.kategori,
      this.tipe,
      this.uangPelanggan});

  Product.fromJson(Map<String, dynamic> json, String idDocument) {
    id = idDocument;
    harga = json['harga'];
    nama = json['nama'];
    kategori = json['kategori'];
    tipe = json['tipe'];
    uangPelanggan = json['uangPelanggan'];
  }

  Product.fromSimpleJson(Map<String, dynamic> json) {
    harga = json['harga'];
    nama = json['nama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['harga'] = harga;
    data['nama'] = nama;
    data['kategori'] = kategori;
    data['tipe'] = tipe;
    data['uangPelanggan'] = uangPelanggan;
    return data;
  }
}
