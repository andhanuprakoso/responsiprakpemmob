import 'package:flutter/material.dart';
import 'package:responsiprakpemmob/bloc/ikan_bloc.dart';
import 'package:responsiprakpemmob/model/ikan.dart';
import 'package:responsiprakpemmob/ui/ikan_detail.dart';
import 'package:responsiprakpemmob/ui/ikan_form.dart';
import 'package:flutter/material.dart';

class IkanPage extends StatefulWidget {
  const IkanPage({Key? key}) : super(key: key);

  @override
  _IkanPageState createState() => _IkanPageState();
}

class _IkanPageState extends State<IkanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('List Ikan'),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                child: const Icon(Icons.add, size: 26.0),
                onTap: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => IkanForm()));
                },
              ))
        ],
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     children: [
      //       ListTile(
      //         title: const Text('Logout'),
      //         trailing: const Icon(Icons.logout),
      //         onTap: () async {
      //           await LogoutBloc.logout().then((value) => {
      //                 Navigator.pushReplacement(context,
      //                     MaterialPageRoute(builder: (context) => LoginPage()))
      //               });
      //         },
      //       )
      //     ],
      //   ),
      // ),
      body: FutureBuilder<List>(
        future: IkanBloc.getIkans(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListIkan(
                  list: snapshot.data,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ListIkan extends StatelessWidget {
  final List? list;
  const ListIkan({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list!.length,
        itemBuilder: (context, i) {
          return ItemIkan(
            ikan: list![i],
          );
        });
  }
}

class ItemIkan extends StatelessWidget {
  final Ikan ikan;

  const ItemIkan({Key? key, required this.ikan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => IkanDetail(
                      ikan: ikan,
                    )));
      },
      child: Card(
        child: ListTile(
          title: Text(ikan.namaIkan!),
          subtitle: Text(ikan.jenisIkan!),
        ),
      ),
    );
  }
}
