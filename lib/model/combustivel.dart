import 'package:flutter/material.dart';

class Combustivel {
  String precoCombustivel="";
  String tipoCombustivel="";
  DateTime dataPreco;
  Combustivel(
    {
      required this.precoCombustivel,
      required this.tipoCombustivel,
      required this.dataPreco,
    }
  );
  
}