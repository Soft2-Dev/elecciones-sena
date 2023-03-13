import 'package:elecciones_sena/iu/destock/desck.dart';
import 'package:elecciones_sena/iu/movil/movil.dart';
import 'package:flutter/material.dart';

class HomePages extends StatelessWidget {
  const HomePages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: (size.width > 600) ? Destock() : Movil(),
    );
  }
}
