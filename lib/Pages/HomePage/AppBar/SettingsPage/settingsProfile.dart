import 'package:flutter/material.dart';


class SettingsProfile extends StatelessWidget {

  Color primaryColor = const Color(0xff2a068f);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ("Perfil"),
        backgroundColor: primaryColor,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(width: 0)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[ // Adicione a lista de widgets dentro do Column
            Image.asset("images/fotoperfil.png", width: 300,),
            Text(
              "Mude sua foto ou seu nome!",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 17, fontStyle: FontStyle.normal, color: Colors.black,
              ),
            ),


           TextField(
                decoration: InputDecoration(
                  labelText: 'Alterar Nome:',
                  border: OutlineInputBorder(),
                    icon: Icon(Icons.edit),
                ),
              ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: primaryColor,
                onPrimary: Colors.white,
                textStyle: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,

                ),
              ),
              onPressed: () {},
              child: Text("Salvar"),

            ),
          ],
        ),
      ),
    );
  }
}





