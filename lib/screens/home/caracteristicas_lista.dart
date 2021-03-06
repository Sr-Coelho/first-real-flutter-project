import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:production_app/models/caracteristica.dart';
import 'package:production_app/screens/home/caracteristica_tile.dart';
import 'package:provider/provider.dart';

class CaracteristicasLista extends StatefulWidget {
  @override
  _CaracteristicasListaState createState() => _CaracteristicasListaState();
}

class _CaracteristicasListaState extends State<CaracteristicasLista> {
  @override
  Widget build(BuildContext context) {
    final caracteristicas = Provider.of<List<Caracteristica>>(context);
    return ListView.builder(
      itemCount: caracteristicas.length,
      itemBuilder: (context, index) {
        return CaracteristicaTile(caracteristica: caracteristicas[index]);
      },
    );
  }
}
