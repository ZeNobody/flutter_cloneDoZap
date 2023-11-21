import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_unipac/Pages/LoginPage/Utils/WidgetUtils.dart';
import 'package:hackathon_unipac/Pages/LoginPage/Login/Login.dart';

import '../../../model/Usuario.dart';

class CadPage extends StatefulWidget {
  const CadPage({super.key});

  @override
  State<CadPage> createState() => _CadUserState();
}

class _CadUserState extends State<CadPage> {
  //Controladores
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  String _mensagemErro = "";

  _validarCampos() {
    String nome = _controllerNome.text;
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

    if (nome.isNotEmpty) {
      if (email.isNotEmpty && email.contains("@")) {
        if (senha.isNotEmpty && senha.length >= 6) {
          setState(() {
            _mensagemErro = "";
          });

          Usuario newUser = Usuario(nome, email, senha);

          // Move a chamada para _cadastrarUsuario para o final do método
          _cadastrarUsuario(newUser);
        } else {
          setState(() {
            _mensagemErro =
            "Preencha a Senha! Senha deve conter mais de 6 caracteres.";
          });
        }
      } else {
        setState(() {
          _mensagemErro = "Preencha o E-mail usando o @";
        });
      }
    } else {
      setState(() {
        _mensagemErro = "Preencha o Nome";
      });
    }
  }

  _cadastrarUsuario(Usuario newUser) {
    FirebaseAuth auth = FirebaseAuth.instance;

    auth
        .createUserWithEmailAndPassword(
      email: newUser.email,
      password: newUser.senha,
    )
        .then((firebaseUser) {
      //salvar dados do usuário
      FirebaseFirestore db = FirebaseFirestore.instance;
      User? user = FirebaseAuth.instance.currentUser;
      db.collection("usuarios")
          .doc(user?.uid)
          .set(newUser.toMap());

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CadCompleted())
      );
    }).catchError((onError) {
      setState(() {
        _mensagemErro = "Erro ao cadastrar usuário: $onError";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 150),
              WidgetUtils.buildTextField(
                  'Nome',
                  controller: _controllerNome,
              ),
              SizedBox(height: 20),
              WidgetUtils.buildTextField(
                'Email',
                controller: _controllerEmail,
              ),
              SizedBox(height: 20),
              WidgetUtils.buildTextField(
                'Senha',
                controller: _controllerSenha,
              ),
              SizedBox(height: 20),
              Text(
                _mensagemErro,
                style: TextStyle(color: Colors.red, fontSize: 16.0),
              ),
              SizedBox(height: 200.0),
              WidgetUtils.buildElevatedButton('Cadastrar', () {
                _validarCampos();
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class CadCompleted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Espaço para o GIF
              Image.asset(
                'images/giphy.gif', // Substitua pelo caminho do seu GIF
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),

              SizedBox(height: 20),
              Text(
                'Cadastro concluído com sucesso!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20),
              WidgetUtils.buildElevatedButton('Voltar ao login', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
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
