import 'package:flutter/material.dart';
import 'package:racionais/src/controller/racionais_controller.dart';
import 'package:racionais/src/model/racionais_model.dart';

class InicioView extends StatefulWidget {
  const InicioView({super.key});

  @override
  State<InicioView> createState() => _InicioViewState();
}

class _InicioViewState extends State<InicioView> {
  // Declarar o Controller:
  var controller = InicioController();
  Racionais? frase;
  @override
  void initState() {
    super.initState();

    controller.buscarFrase().then((resultado) {
      setState(() {
        frase = resultado;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(title: Text('Frases do dia')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          
              Image.asset('assets/img/racionais_logo.png'),
          
              Text(
                frase?.frase ?? '',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
          
              Text(
                frase?.autor ?? '',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white
                ),
              ),
              
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          controller.buscarFrase().then((resultado) {
            setState(() {
              frase = resultado;
            });
          });
        },

        child: const Icon(Icons.replay_outlined),
      ),
    );
  }
}
