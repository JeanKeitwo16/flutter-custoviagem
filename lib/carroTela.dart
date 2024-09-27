import 'package:custoviagem/model/carros.dart';
import 'package:flutter/material.dart';

class CarroTela extends StatefulWidget {
  final String nomeCarro;
  final double autonomia;
  final Function() onRemove;
  const CarroTela({required this.nomeCarro, required this.autonomia, required this.onRemove});

  @override
  State<CarroTela> createState() => _CarroTelaState();
}

class _CarroTelaState extends State<CarroTela> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
