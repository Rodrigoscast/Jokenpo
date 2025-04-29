import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const JokenPoApp());
}

class JokenPoApp extends StatelessWidget {
  const JokenPoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JokenPoPage(),
    );
  }
}

class JokenPoPage extends StatefulWidget {
  @override
  _JokenPoPageState createState() => _JokenPoPageState();
}

class _JokenPoPageState extends State<JokenPoPage> {
  final List<String> opcoes = ["pedra", "papel", "tesoura"];
  String escolhaApp = "padrao";
  String resultado = "";

  void _jogar(String escolhaUsuario) {
    int indexApp = Random().nextInt(3);
    escolhaApp = opcoes[indexApp];

    if (escolhaUsuario == escolhaApp) {
      resultado = "Empate!";
    } else if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel")) {
      resultado = "Você venceu!";
    } else {
      resultado = "Você perdeu!";
    }

    setState(() {});
  }

  String _getImagem(String escolha) {
    switch (escolha) {
      case "pedra":
        return "assets/pedra.png";
      case "papel":
        return "assets/papel.png";
      case "tesoura":
        return "assets/tesoura.png";
      default:
        return "assets/padrao.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("JokenPô")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(_getImagem(escolhaApp), height: 100),
          SizedBox(height: 20),
          Text(resultado, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _botaoEscolha("pedra"),
              _botaoEscolha("papel"),
              _botaoEscolha("tesoura"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _botaoEscolha(String escolha) {
    return ElevatedButton(
      onPressed: () => _jogar(escolha),
      child: Image.asset(_getImagem(escolha), height: 50),
    );
  }
}