import 'package:flutter/material.dart';
import 'package:kuismobile_1/data_buku.dart';
import 'package:url_launcher/url_launcher.dart';

class HalamanDetail extends StatefulWidget {
  const HalamanDetail({super.key, required this.buku});
  final DataBuku buku;

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  bool isFavorite = false;

  void toggleFavorite(){
    setState(() {
      isFavorite = !isFavorite;
    });

    final snackBar = SnackBar(
      backgroundColor: (isFavorite)?Colors.green:Colors.red,
      content: Text(
        isFavorite ? 'Added to Bookmark' : 'Remove from Bookmark',
      ),
      duration: Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.buku.title),
        backgroundColor: Colors.blue,
        actions: <Widget>[

          IconButton(
            icon: Icon(isFavorite?Icons.bookmark:Icons.bookmark_border),
            onPressed: toggleFavorite,
          ),
        ],


      ),
      body: ListView(
        children: [
          SizedBox(height: 20,),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: Image.network(widget.buku.imageLink),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Judul Buku               : ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Text(
                      widget.buku.title,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Pengarang                : ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Text(
                      widget.buku.author,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Tahun Terbit             : ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Text(
                      widget.buku.year.toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Negara                       : ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Text(
                      widget.buku.country,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Bahasa                      : ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Text(
                      widget.buku.language,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Jumlah Halaman     : ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Text(
                      widget.buku.pages.toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 40,),
        ],

      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: (){
              _launcher(widget.buku.link);
            }, child: Icon(Icons.open_in_browser),
          ),
          SizedBox(height: 10,),
          FloatingActionButton(
            onPressed: (){
              _launcher("https://spada.upnyk.ac.id");
            }, child: Icon(Icons.link),
          ),
        ],
      ),
    );
  }

  Future<void> _launcher(String url) async{
    final Uri _url = Uri.parse(url);
    if(!await launchUrl(_url)){
      throw Exception("gagal membuka url : $_url");
    }
  }
}
