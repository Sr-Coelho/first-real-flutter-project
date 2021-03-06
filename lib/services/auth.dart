import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:production_app/models/usuario.dart';
import 'package:production_app/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Criar Usuario
  Usuario _userFromFirebaseUser(User user) {
    return user != null ? Usuario(uid: user.uid) : null;
  }

  // Auth change user stream
  Stream<Usuario> get user {
    return _auth
        .authStateChanges()
        .map((User user) => _userFromFirebaseUser(user));
  }

  // Logar anonimo

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Logar com Email e Senha
  Future logarComEmailESenha(String email, String senha) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: email, password: senha);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Registrar com Email e Senha
  Future registrarComEmailESenha(String email, String senha) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: senha);
      User user = result.user;

      // Criar novo documento para usuario com uid
      await DatabaseService(uid: user.uid)
          .updateUserData('Fulano', 'Membro', 'Ninja', 'Ej', 0, 'F', 0, 100);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Desconectar
  Future singOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
