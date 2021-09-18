import 'package:flutter/material.dart';
import 'package:semana3noticias/Providers/articulo.provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final ArticuloProvider articuloProvider = ArticuloProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: _body(),
    );
  }

  _body() {
    articuloProvider.getArticulos();
    return Text("cuerpo de la aplicación");
  }
}