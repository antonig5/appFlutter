

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';


class TTSPlaybuttonRecipe extends StatefulWidget {
  const TTSPlaybuttonRecipe({Key? key}) : super(key: key);

  @override
  _TTSPlaybuttonRecipeState createState() => _TTSPlaybuttonRecipeState();
}

class _TTSPlaybuttonRecipeState extends State<TTSPlaybuttonRecipe> {


  String description =
      'Buhho..'
      'Las rapaces nocturnas o estrigiformes son un orden de aves compuesto por la familias Tytonidae, y la familia Strigidae que incluye búhos, mochuelos, tecolotes, autillos, cárabos, el ñacurutú y el chuncho, entre otras...' ;
  bool isPlaying = false;
  late FlutterTts _flutterTts;


  @override
  void initState() {
    super.initState();
    initializeTts();
  }

  @override
  void dispose() {
    super.dispose();
    _flutterTts.stop();
  }

  initializeTts() {
    _flutterTts = FlutterTts();




    _flutterTts.setStartHandler(() {
      setState(() {
        isPlaying = true;
      });
    });

    _flutterTts.setCompletionHandler(() {
      setState(() {
        isPlaying = false;
      });
    });

    _flutterTts.setErrorHandler((err) {
      setState(() {
        if (kDebugMode) {
          print("error occurred: " + err);
        }
        isPlaying = false;
      });
    });
  }
  void setTtsLanguage() async {
    await _flutterTts.setLanguage("es");
  }

  void speechSettings1() {

    _flutterTts.setPitch(1.2);
    _flutterTts.setSpeechRate(0.7);
  }

  void speechSettings2() {

    _flutterTts.setPitch(2);
    _flutterTts.setSpeechRate(0.7);
  }

  Future _speak(String text) async {
    if (text.isNotEmpty) {
      var result = await _flutterTts.speak(text);
      if (result == 1) {
        setState(() {
          isPlaying = true;
        });
      }
    }
  }

  Future _stop() async {
    var result = await _flutterTts.stop();
    if (result == 1) {
      setState(() {
        isPlaying = false;
      });
    }
  }



@override
Widget build(BuildContext context) {
  return Stack(

    children: <Widget>[

      Container(
        padding:
        const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
        margin: const EdgeInsets.only(
            top: 30, left: 30.0, right: 30.0, bottom: 20.0),
        child: TextButton(

          onPressed: () {
            //fetch another image
            setState(() {
              //speechSettings1();
              isPlaying ? _stop() : _speak(description);
            });
          },

          child: isPlaying
              ?

          const Text('Parar')
              : const Text('Reproducir'),
        ),
      ),
    ],
  );
}



}