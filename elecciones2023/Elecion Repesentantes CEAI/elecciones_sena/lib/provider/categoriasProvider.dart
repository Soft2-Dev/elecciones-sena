import 'dart:convert';

import 'package:elecciones_sena/api/AllApi.dart';
import 'package:elecciones_sena/model/modeloElectos.dart';
import 'package:elecciones_sena/model/modelocandidatos.dart';
import 'package:flutter/material.dart';

class CategoriasProvider extends ChangeNotifier {
  List<Candidato> candidatos = [];
  List<CandidatoElecto> candiElecto = [];

  bool isDate = false;
  bool isVoto = false;
  bool isElecto = false;
  String jornada = '';

  getcandidatos(String votante) async {
    isVoto = false;
    isDate = false;
    final resp = await AllApi.httpGet('/EleccionesApi.php?case=1&usu=$votante');
    print(resp);
    final dataMap = jsonDecode(resp);
    final Candidatos candidatos = new Candidatos.fromlist(dataMap['rpta']);
    this.candidatos = candidatos.dato;

    if (candidatos.dato[0].rp == 'existe') {
      jornada = candidatos.dato[0].jornada;
      isVoto = true;
    } else {
      if (candidatos.dato[0].rp == 'ok') {
        jornada = candidatos.dato[0].jornada;

        print('>aaaaaaaaaa ');
        isDate = true;
      }
    }
    print('jornada  $jornada ');
    notifyListeners();
    //print(publicidad.dato);
  }

  getVotos(String idVotante, String idCandidato) async {
    isVoto = false;
    isDate = false;
    final resp = await AllApi.httpGet(
        '/EleccionesApi.php?case=2&idVotante=$idVotante&idcandidato=$idCandidato');
    print(resp);
    final dataMap = jsonDecode(resp);
    final Candidatos candidatos = new Candidatos.fromlist(dataMap['rpta']);
    this.candidatos = candidatos.dato;
    if (candidatos.dato[0].rp == 'ok') {
      print('>aaaaaaaaaa ');
      isDate = false;
      isVoto = true;
      notifyListeners();
    }
    //print(publicidad.dato);
  }

  getElectos() async {
    isVoto = false;
    isDate = false;
    final resp =
        await AllApi.httpGet('/EleccionesApi.php?case=4&jornada=$jornada');
    print(resp);
    final dataMap = jsonDecode(resp);
    final CandidatosElectos candiElecto =
        new CandidatosElectos.fromlist(dataMap['rpta']);
    this.candiElecto = candiElecto.dato;
    print(this.candiElecto.length);
    if (candiElecto.dato[0].rp == 'ok') {
      print('>aaaaaaaaaa ');
      isElecto = true;
    }
    notifyListeners();
    //print(publicidad.dato);
  }
}
