/// Flutter code sample for Card

// This sample shows creation of a [Card] widget that shows album information
// and two actions.

import 'package:flutter/material.dart';
import 'animation.dart';
import '../agregados/newtajet.dart';

/// This is the main application widget.
class Cardt extends StatefulWidget {
  const Cardt({Key? key, required TextStyle style}) : super(key: key);

  @override
  _CardtState createState() => _CardtState();
}

class _CardtState extends State<Cardt> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const HeroExample(),
              const ListTile(
                title: Text('Buho'),
                subtitle: Text(
                    'Las rapaces nocturnas o estrigiformes son un orden de aves compuesto por la familias Tytonidae, y la familia Strigidae que incluye búhos, mochuelos, tecolotes, autillos, cárabos, el ñacurutú y el chuncho, entre otras.'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
              ),
              const TTSPlaybuttonRecipe()
            ],
          ),
        ),
      ),
    );
  }
}
