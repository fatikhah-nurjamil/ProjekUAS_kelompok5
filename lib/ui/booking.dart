import "package:flutter/material.dart";
import 'package:putri_domas/model/kost.dart';
import 'package:putri_domas/ui/kost.dart';
import 'package:putri_domas/ui/login.dart';

class Booking extends StatefulWidget {
  Kost? kost;
  Booking({Key? key, this.kost}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => KostPage())),
        ),
        backgroundColor: Colors.green.shade300,
      ),
      body: Container(
        child: Column(
          children: [
            Image.network(
              widget.kost!.gambar!, fit: BoxFit.cover,
              width: 500,
              height: 300,
              alignment: Alignment.center,
            ),
            Text("Nama Kost: ${widget.kost!.namaKost!}", style: TextStyle(fontSize: 20),),
            Text("Tipe Kost: ${widget.kost!.typeKost!}", style: TextStyle(fontSize: 20),),
            Text("Harga : ${widget.kost!.harga!}", style: TextStyle(fontSize: 20),),
            Text("Keterangan: ${widget.kost!.keterangan!}", style: TextStyle(fontSize: 20),),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: const Text("Booking",style: TextStyle(fontSize: 20)),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green.shade300),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
