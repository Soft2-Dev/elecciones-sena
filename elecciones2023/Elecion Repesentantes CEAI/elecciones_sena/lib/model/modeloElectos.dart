class CandidatosElectos {
  List<CandidatoElecto> dato = [];
  CandidatosElectos();

  CandidatosElectos.fromlist(List<dynamic> datos) {
    if (datos == null) return;

    for (var item in datos) {
      final detalle = new CandidatoElecto.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

// $result["rp"]      ='ok';

// $result["nombre"]      =$registro['nombre'];
// $result["ficha"]      =$registro['ficha'];
// $result["programa"]      =$registro['programa'];
// $result["jornada"]      =$registro['jornada'];
// $result["foto"]      =$registro['foto'];
// $result["votos"]      =$registro['votos'];
// $json['rpta'][]     =$result;

class CandidatoElecto {
  String rp;
  // String idvotacion;
  String nombre;
  String ficha;
  String programa;
  String jornada;
  String foto;
  String votos;

  CandidatoElecto({
    this.rp,
    this.nombre,
    this.programa,
    this.ficha,
    this.jornada,
    this.foto,
    this.votos,
  });

  CandidatoElecto.fromJsonMap(Map<String, dynamic> datos) {
    rp = datos['rp'];
    nombre = datos['nombre'];
    programa = datos['programa'];
    ficha = datos['ficha'];
    jornada = datos['jornada'];
    foto = datos['foto'];
    votos = datos['votos'];
  }
}
