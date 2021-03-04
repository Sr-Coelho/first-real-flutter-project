import 'package:flutter/material.dart';
import 'package:production_app/models/usuario.dart';
import 'package:production_app/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:production_app/services/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Usuario>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
