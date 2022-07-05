import 'package:flutter/material.dart';
import 'package:putri_domas/ui/login.dart';
import 'package:putri_domas/ui/register.dart';

class Landing extends StatefulWidget {
  Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Putri Domas Kost",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
            const Text(
                "Reservasi kost secara online dengan mudah menggunakan aplikasi Putri Domas Kost",
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: const Text("Login"),
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
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Register()));
                },
                child: const Text("Register"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green.shade300),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
