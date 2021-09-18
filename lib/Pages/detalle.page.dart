import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:semana3noticias/Models/articulo.model.dart';
import 'package:flutter_share/flutter_share.dart';

class DetallePage extends StatelessWidget {
  final Articulo articulo;
  const DetallePage({Key? key, required this.articulo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(articulo.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xffd2d2d2),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(DateFormat("dd-MM-yyyy").format(articulo.publishedAt)),
                  GestureDetector(
                    onTap: share,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.share),
                    ),
                  )
                ],
              ),
              // SizedBox(
              //   height: 50,
              // ),
              articulo.urlToImage == ''
                  ? Image(image: AssetImage('assets/no-image.png'))
                  : FadeInImage(
                      placeholder: AssetImage('assets/loanding.gif'),
                      image: NetworkImage(articulo.urlToImage)),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(articulo.author),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(articulo.title),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(articulo.description),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(articulo.content),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(articulo.url),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: articulo.title,
        text: articulo.description,
        linkUrl: articulo.url,
        chooserTitle: articulo.title);
  }
}
