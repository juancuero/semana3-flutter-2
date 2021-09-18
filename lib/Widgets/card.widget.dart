import 'package:flutter/material.dart';
import 'package:semana3noticias/Models/articulo.model.dart';
import 'package:intl/intl.dart';
import 'package:semana3noticias/Pages/detalle.page.dart';

class CardWidget extends StatelessWidget {
  final Articulo articulo;
  const CardWidget({Key? key, required this.articulo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetallePage(articulo: articulo)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // SizedBox(
                //   height: 50,
                // ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Text(DateFormat("dd-MM-yyyy")
                          .format(articulo.publishedAt)),
                    ],
                  ),
                ),
                articulo.urlToImage == ''
                    ? Image(image: AssetImage('assets/no-image.png'))
                    : FadeInImage(
                        placeholder: AssetImage('assets/loanding.gif'),
                        image: NetworkImage(articulo.urlToImage)),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(articulo.title),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
              color: Color(0xffd2d2d2),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
