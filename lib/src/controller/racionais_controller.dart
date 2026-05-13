import 'package:flutter/material.dart';
import 'package:racionais/src/model/racionais_model.dart';

class InicioController {
  var fraseTextEditingController = TextEditingController();
  Future<Racionais> buscarFrase() async {
    Racionais frase = await Racionais().buscarFrase();
    return frase;
  }
}