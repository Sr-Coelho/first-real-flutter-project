import 'package:flutter/material.dart';
import 'package:production_app/models/usuario.dart';
import 'package:production_app/screens/authenticate/authenticate.dart';
import 'package:production_app/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Usuario>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
