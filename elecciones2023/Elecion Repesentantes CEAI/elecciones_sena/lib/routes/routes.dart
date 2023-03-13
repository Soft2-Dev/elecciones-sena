import 'package:elecciones_sena/iu/destock/resultados.dart';
import 'package:elecciones_sena/iu/homepages.dart';
import 'package:flutter/material.dart';

import '../construcion_page.dart';

Map<String, WidgetBuilder> getRutas() {
  return <String, WidgetBuilder>{
    'home': (BuildContext context) => HomePages(),
    'ResultadosPages': (BuildContext context) => ResultadosPages(),
  };
}

Map<String, WidgetBuilder> getNoRutas() {
  return <String, WidgetBuilder>{
    'construccion': (BuildContext context) => Construccion(),
  };
}
