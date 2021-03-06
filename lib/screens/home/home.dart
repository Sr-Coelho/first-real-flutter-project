import 'package:flutter/material.dart';
import 'package:production_app/models/caracteristica.dart';
import 'package:production_app/screens/home/caracteristicas_lista.dart';
import 'package:production_app/screens/home/config_form.dart';
import 'package:production_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:production_app/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showConfigPainel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: ConfigForm(),
            );
          });
    }

    return StreamProvider<List<Caracteristica>>.value(
        value: DatabaseService().caracteristicas,
        child: Scaffold(
          backgroundColor: Colors.yellow[600],
          appBar: AppBar(
            title: Text('Ninjas da RiseUp'),
            backgroundColor: Colors.yellow[700],
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person_pin_outlined),
                label: Text('Sair'),
                onPressed: () async {
                  await _auth.singOut();
                },
              ),
              FlatButton.icon(
                onPressed: () => _showConfigPainel(),
                icon: Icon(Icons.settings_applications),
                label: Text('Config'),
              ),
            ],
          ),
          body: CaracteristicasLista(),
        ));
  }
}
