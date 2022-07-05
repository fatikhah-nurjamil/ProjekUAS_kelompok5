import 'dart:convert';

import 'package:putri_domas/helpers/api.dart';
import 'package:putri_domas/helpers/api_url.dart';
import 'package:putri_domas/model/kost.dart';

class KostBloc {
  static Future<List<Kost>> getKost() async {
    String apiUrl = ApiUrl.listKost;
    var response = await Api().get(Uri.parse(apiUrl));
    var jsonObj = json.decode(response.body);
    List<dynamic> listKost = (jsonObj as Map<String, dynamic>)['data'];
    List<Kost> kosts = [];
    for (int i = 0; i < listKost.length; i++) {
      kosts.add(Kost.fromJson(listKost[i]));
    }
    return kosts;
  }

  // static Future addKost({Kost? produk}) async {
  //   String apiUrl = ApiUrl.createKost;

  //   var body = {
  //     "kode_produk": produk!.kodeKost,
  //     "nama_produk": produk.namaKost,
  //     "harga": produk.hargaKost.toString()
  //   };

  //   var response = await Api().post(apiUrl, body);
  //   var jsonObj = json.decode(response.body);
  //   return jsonObj['status'];
  // }
}
