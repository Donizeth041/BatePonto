import 'package:flutter/material.dart';

class PontoScreen extends StatefulWidget {
  @override
  _PontoScreenState createState() => _PontoScreenState();
}

class _PontoScreenState extends State<PontoScreen> {
  bool pontoAberto = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Bater Ponto', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            pontoAberto
                ? ElevatedButton(
                    onPressed: () {
                      setState(() {
                        pontoAberto = false;
                      });
                      // Lógica para fechar ponto
                    },
                    child: Text('Fechar Ponto',
                        style: TextStyle(color: Colors.white)),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  )
                : ElevatedButton(
                    onPressed: () {
                      setState(() {
                        pontoAberto = true;
                      });
                      // Lógica para abrir ponto
                    },
                    child: Text('Abrir Ponto',
                        style: TextStyle(color: Colors.white)),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  ),
          ],
        ),
      ),
    );
  }
}
