import 'package:flutter/material.dart';
import 'package:production_app/services/auth.dart';
import 'package:production_app/shared/constants.dart';
import 'package:production_app/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  //Texto
  String email = '';
  String senha = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.blue[600],
            appBar: AppBar(
              backgroundColor: Colors.blue[900],
              elevation: 0.0,
              title: Text('Entrar na RiseUp'),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.article_outlined),
                  label: Text('Registrar'),
                  onPressed: () async {
                    widget.toggleView();
                  },
                ),
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 0.0),
                    Image.asset('lib/assets/Logo.png'),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Email'),
                      validator: (val) =>
                          val.isEmpty ? 'Insira um email' : null,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Senha'),
                      validator: (val) => val.length < 6
                          ? 'Insira uma senha de +6 caracteres'
                          : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() {
                          senha = val;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.yellow[700])),
                      child:
                          Text('Logar', style: TextStyle(color: Colors.white)),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() => loading = true);
                          dynamic result =
                              await _auth.logarComEmailESenha(email, senha);
                          if (result == null) {
                            setState(() {
                              error = 'Porfavor insira um informações validas';
                              loading = false;
                            });
                          }
                        }
                      },
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
