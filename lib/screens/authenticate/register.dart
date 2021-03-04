import 'package:flutter/material.dart';
import 'package:production_app/services/auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  //Texto
  String email = '';
  String senha = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0.0,
        title: Text('Registrar na RiseUp'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 5.0),
              Image.asset('lib/assets/Logo.png'),
              SizedBox(height: 20.0),
              TextFormField(
                initialValue: 'Email',
                keyboardType: TextInputType.emailAddress,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                initialValue: 'Senha',
                onChanged: (val) {
                  setState(() {
                    senha = val;
                  });
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.yellow[700])),
                child: Text('Registrar', style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  print(email);
                  print(senha);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
