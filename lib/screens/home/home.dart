import 'package:flutter/material.dart';
import 'package:production_app/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[600],
      appBar: AppBar(
        title: Text('RiseUp'),
        backgroundColor: Colors.yellow[700],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person_pin_outlined),
            label: Text('Desconectar'),
            onPressed: () async {
              await _auth.singOut();
            },
          ),
        ],
      ),
    );
  }
}
