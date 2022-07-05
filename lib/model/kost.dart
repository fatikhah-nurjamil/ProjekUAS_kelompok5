class Kost {
  String? code;
  int? id;
  String? namaKost;
  String? keterangan;
  String? typeKost;
  String? harga;
  String? gambar;

  Kost({this.id, this.namaKost, this.keterangan, this.code, this.typeKost, this.harga, this.gambar});

  factory Kost.fromJson(Map<String, dynamic> obj) {
    return Kost(
      code: obj['id_kost'],
      namaKost: obj['nama_kost'],
      keterangan: obj['keterangan'],
      typeKost: obj['type_kost'],
      harga: obj['harga'],
      gambar: obj['gambar'],
    );
  }
}
