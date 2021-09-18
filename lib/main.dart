import 'package:flutter/material.dart';

import 'Pages/home.page.dart';

void main(){
  runApp(MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  const MiAplicacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplicación de noticias",
      theme:  ThemeData.light(),
      home: HomePage(),
    );
  }
}