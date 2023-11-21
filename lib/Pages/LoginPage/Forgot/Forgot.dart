import 'package:hackathon_unipac/Pages/LoginPage/Login/Login.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_unipac/Pages/LoginPage/Utils/WidgetUtils.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recuperar Senha'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              WidgetUtils.buildTextField('Insira seu email cadastrado'),
              SizedBox(height: 20.0),
              WidgetUtils.buildElevatedButton('Enviar', () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (context) => EnterCodePage(),
                   ),
                 );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class EnterCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inserir Código'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Insira o código fornecido no seu email',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  WidgetUtils.buildBoxOneItem(),
                  WidgetUtils.buildBoxOneItem(),
                  WidgetUtils.buildBoxOneItem(),
                  WidgetUtils.buildBoxOneItem(),
                ],
              ),
              SizedBox(height: 20.0),
              WidgetUtils.buildElevatedButton('Enviar', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                    //Tá completo esta porra não, é so uma demonstração do que seria este caralho de asa
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}