import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../components/segundospacio.dart';

class Prueba extends StatefulWidget {
  const Prueba({Key? key, required TextStyle style}) : super(key: key);

  @override
  _PruebaState createState() => _PruebaState();
}

class _PruebaState extends State<Prueba> {
  bool hidePassword = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(7)),
                        child: Image.network(
                          "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
                          width: 166,
                        ))
                  ]),
              Container(
                width: 200.0,
                margin: const EdgeInsets.all(4),
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: "nombre de usuario",
                      border: OutlineInputBorder(),
                      labelText: "Usuario"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'inserte usuario';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                width: 200.0,
                child: TextFormField(
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                        onTap: _toglePassword,
                        child: Icon(hidePassword
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    border: const OutlineInputBorder(),
                    labelText: 'Contraseña',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'inserte contraseña';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                width: 200,
                margin: const EdgeInsets.only(top: 5),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondRoute()),
                      );
                    }
                  },
                  child: const Text('enviar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toglePassword() {
    if (hidePassword == true) {
      hidePassword = false;
    } else {
      hidePassword = true;
    }
    setState(() {});
  }
}
