import 'package:flutter/material.dart';

class Buton extends StatelessWidget {
  const Buton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(onPressed: () {}, child: Text("data")),
        ElevatedButton(onPressed: () {}, child: Text("data")),
        ElevatedButton(onPressed: () {}, child: Text("data"))
      ],
    );
  }
}
