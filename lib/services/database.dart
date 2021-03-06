import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:production_app/models/caracteristica.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // Referencia de Coleções
  final CollectionReference caracteristicasCollection =
      FirebaseFirestore.instance.collection('caracteristicas');

  Future updateUserData(String nome, String titulo, String tituloNinja,
      String diretoria, int nivel, String rank, int pontos, int forca) async {
    return await caracteristicasCollection.doc(uid).set({
      'nome': nome,
      'titulo': titulo,
      'tituloNinja': tituloNinja,
      'diretoria': diretoria,
      'nivel': nivel,
      'rank': rank,
      'pontos': pontos,
      'forca': forca,
    });
  }

  // Lista de Caracteristicas do Snapshot
  List<Caracteristica> _caracteristicaListaDoSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Caracteristica(
        nome: doc.data()['nome'] ?? '',
        titulo: doc.data()['titulo'] ?? '',
        tituloNinja: doc.data()['tituloNinja'] ?? '',
        diretoria: doc.data()['diretoria'] ?? '',
        nivel: doc.data()['nivel'] ?? 0,
        rank: doc.data()['rank'] ?? '',
        pontos: doc.data()['pontos'] ?? 0,
        forca: doc.data()['forca'] ?? 0,
      );
    }).toList();
  }

  // Pegar Caracteristicas
  Stream<List<Caracteristica>> get caracteristicas {
    return caracteristicasCollection
        .snapshots()
        .map(_caracteristicaListaDoSnapshot);
  }
}
