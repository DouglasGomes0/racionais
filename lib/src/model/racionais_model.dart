import 'dart:convert';
import 'package:http/http.dart' as http;

class Racionais {
  String? frase;
  String? autor;

  Racionais({this.frase, this.autor});

  Racionais.fromJson(Map<String, dynamic> json) {
    frase = json['frase'];
    autor = json['autor'];
  }

  Map<String, dynamic> toJson() {
    return {'frase': frase, 'autor': autor};
  }

  Future<Racionais> buscarFrase() async {
    final response = await http.get(
      Uri.parse('https://estevaorada.com/aulas/api/frases/'),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Racionais.fromJson(data);
    } else {
      throw Exception('Falha ao carregar a frase');
    }
  }
}
