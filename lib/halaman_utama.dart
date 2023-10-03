import 'package:flutter/material.dart';
import 'package:kuismobile_1/halaman_detail.dart';
import 'package:kuismobile_1/data_buku.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Book List'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: listBuku.length,
        itemBuilder: (context, index) {
          final DataBuku informasi = listBuku[index];
          return InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HalamanDetail(buku: informasi,),
                ),
              );
            },
            child: Card(
              child: SizedBox(
                height: 300,
                width: MediaQuery.of(context).size.width / 4,
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: Image.network(
                        informasi.imageLink,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(height: 15,),
                    Text(
                      informasi.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
