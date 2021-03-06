import 'package:flutter/material.dart';
import 'package:production_app/shared/constants.dart';

class ConfigForm extends StatefulWidget {
  @override
  _ConfigFormState createState() => _ConfigFormState();
}

class _ConfigFormState extends State<ConfigForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> titulos = [
    'Presidente',
    'Vice-Presidente',
    'Conselheiro',
    'Diretor',
    'Gerente',
    'Acessor'
  ];
  final List<String> diretorias = [
    'Presidencia',
    'Conselho',
    'Financeiro',
    'Projetos',
    'Gestão de Pessoas',
    'Makerting'
  ];

  //Valores
  String _nomeAtual;
  String _diretoriaAtual;
  String _tituloAtual;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Atualize seus dados',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Nome'),
            validator: (val) => val.isEmpty ? 'Por favor insira um nome' : null,
            onChanged: (val) => setState(() => _nomeAtual = val),
          ),
          SizedBox(height: 20.0),
          DropdownButtonFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Titulo'),
            onChanged: (val) => setState(() => _tituloAtual = val),
            items: titulos.map((titulo) {
              return DropdownMenuItem(
                value: titulo,
                child: Text(titulo),
              );
            }).toList(),
          ),
          SizedBox(height: 20.0),
          DropdownButtonFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Diretoria'),
            onChanged: (val) => setState(() => _diretoriaAtual = val),
            items: diretorias.map((diretoria) {
              return DropdownMenuItem(
                value: diretoria,
                child: Text(diretoria),
              );
            }).toList(),
          ),
          RaisedButton(
              color: Colors.blue[600],
              child: Text(
                'Atualizar',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                print(_nomeAtual);
                print(_diretoriaAtual);
                print(_tituloAtual);
              }),
        ],
      ),
    );
  }
}
