class ApiUrl {
  static const String baseUrl = 'http://192.168.100.22/putri-domas-api/public/';

  static const String registrasi = baseUrl + '/registrasi';
  static const String login = baseUrl + '/login';
  static const String listKost = baseUrl + '/list-kost';
  static const String createProduk = baseUrl + '/produk';

  static String updateProduk(int id) {
    return baseUrl + '/produk/' + id.toString() + '/update';
  }

  static String showProduk(int id) {
    return baseUrl + '/produk/' + id.toString();
  }

  static String deleteProduk(int id) {
    return baseUrl + '/produk/' + id.toString();
  }
}
