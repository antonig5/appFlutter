import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:untitled/agregados/buton.dart';

void main() => runApp(SecondRoute());

/// This is the main application widget.
class SecondRoute extends StatelessWidget {
  static const String _title = "Pedidos";
  final List<Pedidos> _pedido = [
    Pedidos("Nombre del pedido", "fecha del pedido", "direccion del pedido",
        "Numero de asignacion"),
    Pedidos("Nombre del pedido", "fecha del pedido", "direccion del pedido",
        "Numero de asignacion"),
    Pedidos("Nombre del pedido", "fecha del pedido", "direccion del pedido",
        "Numero de asignacion"),
    Pedidos("Nombre del pedido", "fecha del pedido", "direccion del pedido",
        "Numero de asignacion")
  ];

  SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: ListView.builder(
          itemCount: _pedido.length,
          itemBuilder: (context, index) {
            return (Container(
                width: 200,
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(1),
                child: ListTile(
                  title: Column(
                    children: [
                      Text(_pedido[index].name),
                    ],
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(_pedido[index].date),
                      Text(_pedido[index].direction),
                      Text(_pedido[index].asignation)
                    ],
                  ),
                  trailing: Column(
                    children: <Widget>[
                      Expanded(
                          flex: 3,
                          child: TextButton.icon(
                            icon: const Icon(Icons.verified),
                            style: TextButton.styleFrom(
                                primary: Colors.green,
                                side: const BorderSide(
                                  color: Colors.green,
                                )),
                            label: const Text('Aceptar'),
                            onPressed: () {},
                          )),
                      Expanded(
                          flex: 4.bitLength,
                          child: TextButton.icon(
                            icon: const Icon(Icons.unpublished),
                            style: TextButton.styleFrom(
                              primary: Colors.red,
                              side: const BorderSide(
                                color: Colors.red,
                              ),
                            ),
                            label: const Text('Cancelar'),
                            onPressed: () {},
                          )),
                    ],
                  ),
                )));
          },
        ),
      ),
    ));
  }
}

class Pedidos {
  late String name;
  late String date;
  late String direction;
  late String asignation;

  Pedidos(name, date, direction, asignation) {
    this.name = name;
    this.date = date;
    this.direction = direction;
    this.asignation = asignation;
  }
}
