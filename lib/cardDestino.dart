import 'package:flutter/material.dart';

class CardCarro extends StatelessWidget {
  final String nomeDestino;
  final double distanciaDestino;
  final Function() onRemove;

  const CardCarro({
    required this.nomeDestino,
    required this.distanciaDestino,
    required this.onRemove
    });
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(25),
              child: Column(
                children: [
                  Text(
                    "$nomeDestino",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text("$distanciaDestino", style: TextStyle(color: Colors.grey, fontSize: 14)),
                ],
              ),
            ),
            Expanded(child: Container()),
            IconButton(onPressed: () {onRemove();}, icon: Icon(Icons.delete)),
          ],
        ));
  }
}