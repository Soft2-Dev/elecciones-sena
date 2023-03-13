import 'dart:html';

import 'package:elecciones_sena/provider/categoriasFromProvider.dart';
import 'package:elecciones_sena/provider/categoriasProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Destock extends StatefulWidget {
  const Destock({Key key}) : super(key: key);

  @override
  _DestockState createState() => _DestockState();
}

class _DestockState extends State<Destock> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fromProvider =
        Provider.of<CategoriasFromProvider>(context, listen: false);

    final provider = Provider.of<CategoriasProvider>(context);
    final repre = Provider.of<CategoriasProvider>(context).candidatos;
    List<Widget> itemMap = [];

    if (provider.isDate) {
      itemMap = repre
          .map((e) => Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black, offset: Offset(1, 1), blurRadius: 3)
                ], color: Colors.white),
                margin: EdgeInsets.all(30),
                width: size.width * 0.2,
                height: size.height * 0.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(60),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(2, 3),
                                blurRadius: 7)
                          ]),
                      height: size.width * 0.15,
                      width: size.width * 0.15,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(e.foto),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        //color: Colors.red,
                        child: Text(
                          e.nombre,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        // color: Colors.red,
                        child: Text(
                          e.programa,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 5),
                        //color: Colors.green,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Ficha: ' + e.ficha,
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Jornada: ' + e.jornada,
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        )),
                    Container(
                      color: Color(0xff238276),
                      width: size.width * 0.15,
                      height: 40,
                      margin: EdgeInsets.only(top: 30),
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xff238276)),
                          onPressed: () {
                            provider.getVotos(e.idvotante, e.idcandidato);
                          },
                          icon: Icon(Icons.save_outlined),
                          label: Text('Votar')),
                    )
                  ],
                ),
              ))
          .toList();
    }

    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.3),
      body: Column(
        children: [
          _BuscarDocumento(
              size: size, fromProvider: fromProvider, provider: provider),
          Container(
            //margin: EdgeInsets.symmetric(horizontal: size.width * 0.10),
            alignment: Alignment.center,
            //color: Colors.amber,
            height: size.height * 0.70,
            child: ListView(
              itemExtent:
                  (!provider.isDate) ? size.width * 1 : size.width * 0.33,
              scrollDirection: Axis.horizontal,
              children: [
                if (!provider.isDate && !provider.isVoto)
                  Container(
                    height: size.height * 0.5,
                    width: size.width * 0.9,
                    alignment: Alignment.center,
                    child: Text(
                      'Representantes',
                      style: TextStyle(
                          color: Color(0xff238276),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                if (provider.isDate && !provider.isVoto) ...itemMap,
                if (provider.isVoto)
                  Container(
                    height: size.height * 0.5,
                    width: size.width * 0.9,
                    //color: Colors.red,
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Ya fue Registrado un voto con este Documento',
                          style: TextStyle(
                              color: Color(0xff238276),
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Container(
                        //   height: 43,
                        //   width: 200,
                        //   child: ElevatedButton.icon(
                        //       //Color(0xff067b75)
                        //       style: ButtonStyle(
                        //           backgroundColor:
                        //               MaterialStateProperty.all<Color>(
                        //                   Color(0xfffc590e))),
                        //       onPressed: () {
                        //         Navigator.pushNamed(context, 'ResultadosPages');
                        //       },
                        //       icon: Icon(
                        //         Icons.search_outlined,
                        //         color: Colors.white,
                        //       ),
                        //       label: Text('Ver resultados')),
                        // ),
                      ],
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _BuscarDocumento extends StatefulWidget {
  const _BuscarDocumento({
    Key key,
    @required this.size,
    @required this.fromProvider,
    @required this.provider,
  }) : super(key: key);

  final Size size;
  final CategoriasFromProvider fromProvider;
  final CategoriasProvider provider;

  @override
  __BuscarDocumentoState createState() => __BuscarDocumentoState();
}

class __BuscarDocumentoState extends State<_BuscarDocumento> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xff238276), boxShadow: [
        BoxShadow(color: Colors.black, offset: Offset(1, 1), blurRadius: 5)
      ]),
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              width: double.infinity,
              color: Color(0xff238276),
              child: Text(
                'Elección de Representante CEAI 2022',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )),
          Container(
            height: widget.size.height * 0.17,
            child: Row(
              children: [
                Container(
                  //color: Colors.red,
                  width: widget.size.width * 0.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: widget.size.width * 0.2,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Form(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            onChanged: (value) =>
                                widget.fromProvider.documento = value,
                            style: TextStyle(color: Colors.grey, fontSize: 25),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                hintText: 'Documento Identidad',
                                hintStyle: TextStyle(fontSize: 20),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 43,
                        child: ElevatedButton.icon(
                            //Color(0xff067b75)
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xfffc590e))),
                            onPressed: () {
                              setState(() {
                                print(widget.fromProvider.documento);
                                widget.provider.getcandidatos(
                                    widget.fromProvider.documento);
                                // widget.provider.getcandidatos('1089294247');
                              });
                            },
                            icon: Icon(
                              Icons.search_outlined,
                              color: Colors.white,
                            ),
                            label: Text('Buscar')),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: widget.size.width * 0.3,
                  padding: EdgeInsets.only(top: 10, left: 50),
                  alignment: Alignment.centerRight,
                  //color: Colors.green,
                  child: Image(
                    image: AssetImage('img/logoBlanco.png'),
                  ),
                )
              ],
            ),
          ),
          if (widget.provider.isDate)
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                widget.provider.candidatos[0].votante +
                    ' ' +
                    widget.provider.candidatos[0].votanteAp,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
        ],
      ),
    );
  }
}
