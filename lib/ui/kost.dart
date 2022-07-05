import 'package:flutter/material.dart';
import 'package:putri_domas/bloc/kost_bloc.dart';

import '../model/kost.dart';

class KostPage extends StatefulWidget {
  const KostPage({Key? key}) : super(key: key);

  @override
  State<KostPage> createState() => _KostPageState();
}

class _KostPageState extends State<KostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kost Putri Domas"),
        backgroundColor: Colors.green.shade300, // appbar color.
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('logout'),
              trailing: const Icon(Icons.logout),
              onTap: () async {},
            )
          ],
        ),
      ),
      body: FutureBuilder<List>(
              future: KostBloc.getKost(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? 
                    ListKost(
                        list: snapshot.data,
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              }),
    );
  }
}

class ListKost extends StatelessWidget {
  final List? list;

  const ListKost({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list!.length,
      itemBuilder: (context, i) {
        return ItemKost(
          kost: list![i],
        );
      },
    );
  }
}

class ItemKost extends StatelessWidget {
  final Kost kost;

  const ItemKost({Key? key, required this.kost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) =>
          //   )
          // )
        },
        child: Card(
          child: ListTile(
            title: Text("Nama Kost: ${kost.namaKost!}"),
            subtitle: Text("Harga: Rp.${kost.harga!}"),
            leading: Image.network(kost.gambar!,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        ));
  }
}
