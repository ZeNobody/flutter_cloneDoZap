import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_unipac/Pages/LoginPage/Utils/WidgetUtils.dart';
import 'package:hackathon_unipac/Pages/LoginPage/Register/Register.dart';
import 'package:hackathon_unipac/Pages/LoginPage/Forgot/Forgot.dart';
import '../../../model/Usuario.dart';
import '../../HomePage/Home.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  String _mensagemErro = "";

  _validarCampos() {
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

    if (email.isNotEmpty && email.contains("@")) {
      if (senha.isNotEmpty) {
        setState(() {
          _mensagemErro = "";
        });

        Usuario usuario = Usuario("", email, senha);

        _logarUsuario(usuario);
      } else {
        setState(() {
          _mensagemErro = "Preencha a senha!";
        });
      }
    } else {
      setState(() {
        _mensagemErro = "Preencha o E-mail utilizando @";
      });
    }
  }

  _logarUsuario(Usuario usuario) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.signInWithEmailAndPassword(
        email: usuario.email,
        password: usuario.senha,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (error) {
      setState(() {
        _mensagemErro =
        "Dados incorretos! Tente novante";
      });
    }
  }

  Future _verificarUsuarioLogado() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? usuarioLogado = await auth.currentUser;

    if (usuarioLogado != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }


  @override
  void initState() {
    _verificarUsuarioLogado();
    super.initState();
  }

  static const primaryColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UaiZap'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 10.0),
              Image.asset(
                'images/android.png',
                height: 200,
                width: 200,
              ),
              SizedBox(height: 80.0),
              WidgetUtils.buildTextField(
                'Email',
                hintText: 'SeuEmail@Email.com',
                controller: _controllerEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20.0),
              WidgetUtils.buildTextField(
                'Senha',
                controller: _controllerSenha,
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(height: 20.0),
              Text(
                _mensagemErro, // Exibe a mensagem de erro aqui
                style: TextStyle(color: Colors.red, fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              WidgetUtils.buildElevatedButton('Login', () {
                _validarCampos();
              }),
              SizedBox(height: 20.0),
              WidgetUtils.buildElevatedButton('Cadastro', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CadPage(),
                  ),
                );
              }),
              SizedBox(height: 10.0),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgotPasswordPage(),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  textStyle: TextStyle(decoration: TextDecoration.underline),
                ),
                child: Text('Esqueci minha senha'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}