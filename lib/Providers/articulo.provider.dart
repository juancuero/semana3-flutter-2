import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:semana3noticias/Models/articulo.model.dart';

class ArticuloProvider{

  Future<List<Articulo>> getArticulos() async {

    List<Articulo> listaArticulos  = [];

    Map<String, String> parametros = {
      'q': 'tesla',
      'from': '2021-08-18',
      'sortBy': 'publishedAt',
      'apiKey': '89009ac73341418593a1dafa0869a8d6',
    };

    var response = await http.get(Uri.https('newsapi.org', '/v2/everything', parametros));
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      jsonResponse["articles"].forEach( (item) {
        Articulo temp = Articulo.fromJson(item);
        listaArticulos.add(Articulo.fromJson(item));
        print(temp.source);
      });
    }
    return listaArticulos;
  }
}