class Candidatos {
  List<Candidato> dato = [];
  Candidatos();

  Candidatos.fromlist(List<dynamic> datos) {
    if (datos == null) return;

    for (var item in datos) {
      final detalle = new Candidato.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

class Candidato {
  String rp;
  String idcandidato;
  String nombre;
  String apellidos;
  String identificacion;
  String ficha;
  String programa;
  String jornada;
  String postulacion;
  String foto;
  String idvotante;

  String votante;
  String votanteAp;
  String fichaAp;
  String programaAp;

  Candidato({
    this.rp,
    this.idcandidato,
    this.nombre,
    this.apellidos,
    this.identificacion,
    this.ficha,
    this.programa,
    this.jornada,
    this.postulacion,
    this.foto,
    this.idvotante,
    this.votante,
    this.votanteAp,
    this.fichaAp,
    this.programaAp,
  });

  Candidato.fromJsonMap(Map<String, dynamic> datos) {
    rp = datos['rp'];
    idcandidato = datos['idcandidato'];
    nombre = datos['nombre'];
    apellidos = datos['apellidos'];
    identificacion = datos['identificacion'];
    ficha = datos['ficha'];
    programa = datos['programa'];
    jornada = datos['jornada'];
    postulacion = datos['postulacion'];
    foto = datos['foto'];
    idvotante = datos['idvotante'];

    votante = datos['votante'];
    votanteAp = datos['votanteAp'];
    fichaAp = datos['fichaAp'];
    programaAp = datos['programaAp'];
  }
}
