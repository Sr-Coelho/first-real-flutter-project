import 'package:flutter/material.dart';
import 'package:production_app/models/caracteristica.dart';

class CaracteristicaTile extends StatelessWidget {
  final Caracteristica caracteristica;
  CaracteristicaTile({this.caracteristica});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(10, 6, 10, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.yellow[caracteristica.forca],
          ),
          title: Text(
              '${caracteristica.titulo} ${caracteristica.nome}: nivel ${caracteristica.nivel}'),
          subtitle: Text(
              '${caracteristica.tituloNinja} rank: ${caracteristica.rank} / força: ${caracteristica.forca}'),
        ),
      ),
    );
  }
}
