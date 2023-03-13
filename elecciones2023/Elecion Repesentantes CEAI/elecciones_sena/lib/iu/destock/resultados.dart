import 'package:elecciones_sena/provider/categoriasProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultadosPages extends StatefulWidget {
  const ResultadosPages({Key key}) : super(key: key);

  @override
  _ResultadosPagesState createState() => _ResultadosPagesState();
}

class _ResultadosPagesState extends State<ResultadosPages> {
  @override
  void initState() {
    super.initState();
    Provider.of<CategoriasProvider>(context, listen: false).getElectos();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final repre = Provider.of<CategoriasProvider>(context).candiElecto;
    final provider = Provider.of<CategoriasProvider>(context);

    List<Widget> itemMap = [];

    if (provider.isElecto) {
      itemMap = repre
          .map((e) => Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black, offset: Offset(1, 1), blurRadius: 3)
                ], color: Colors.white),
                margin: EdgeInsets.all(30),
                width: size.width * 0.2,
                height: size.height * 0.5,
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
                    Flexible(
                      child: Container(
                          margin: EdgeInsets.only(top: 10),
                          // color: Colors.red,
                          child: Text(
                            e.programa,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                    ),
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
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey),
                      child: Text(
                        e.votos,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    )
                    // Container(
                    //   color: Color(0xff238276),
                    //   width: size.width * 0.15,
                    //   height: 40,
                    //   margin: EdgeInsets.only(top: 30),
                    //   child: ElevatedButton.icon(
                    //       style: ElevatedButton.styleFrom(
                    //           primary: Color(0xff238276)),
                    //       onPressed: () {},
                    //       icon: Icon(Icons.save_outlined),
                    //       label: Text('Votar')),
                    // )
                  ],
                ),
              ))
          .toList();
    }

    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.3),
      body: ListView(
        // itemExtent: (!provider.isDate) ? size.width * 1 : size.width * 0.33,
        scrollDirection: Axis.horizontal,
        children: [
          ...itemMap,
        ],
      ),
    );
  }
}

class _BuscarDocumento extends StatefulWidget {
  const _BuscarDocumento({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

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
      child: Container(
        height: widget.size.height * 0.17,
        child: Row(
          children: [
            Container(
                //color: Colors.red,
                width: widget.size.width * 0.6,
                child: Text('Resultados Elección de Representante CEAI 2022')),
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
    );
  }
}
