import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:semana3noticias/Models/articulo.model.dart';

class ArticuloProvider{

  Future<List<Articulo>> getArticulos({int page = 1}) async {

    List<Articulo> listaArticulos  = [];

    Map<String, String> parametros = {
      'q': 'tesla',
      'from': '2021-08-18',
      'sortBy': 'publishedAt',
      'apiKey': '89009ac73341418593a1dafa0869a8d6',
      'pageSize': '20',
      'page': '${page}',
      
    };

    var response = await http.get(Uri.https('newsapi.org', '/v2/everything', parametros));
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      jsonResponse["articles"].forEach( (item) => listaArticulos.add(Articulo.fromJson(item)));
    }
    return listaArticulos;
  }
}