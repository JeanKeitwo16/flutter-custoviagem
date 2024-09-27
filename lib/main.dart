import 'package:custoviagem/calculoTela.dart';
import 'package:custoviagem/carroTela.dart';
import 'package:custoviagem/destinoTela.dart';
import 'package:custoviagem/gasolinaTela.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AppCustoViagem());
}

class AppCustoViagem extends StatefulWidget {

  const AppCustoViagem({super.key});

  @override
  State<AppCustoViagem> createState() => _AppCustoViagemState();
}

class _AppCustoViagemState extends State<AppCustoViagem> {
  int telaSelecionada = 1;

  final List<Widget> listaTelas = <Widget>[
    CarroTela(),
    CalculoTela(),
    DestinoTela(),
    GasolinaTela(),
  ];

  void opcaoSelecionada(int opcao) {
    setState(() {
      telaSelecionada = opcao;
    });
  }

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "App Custo Viagem",
      home: Scaffold(
        body: Center(child: listaTelas[telaSelecionada]),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: const Color.fromARGB(255, 88, 88, 88),
          fixedColor: const Color.fromARGB(255, 255, 255, 255),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental_rounded),
            label: 'Carro',
            backgroundColor: Color.fromARGB(255, 0, 166, 255),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_rounded),
            label: 'Calculo',
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_rounded),
            label: 'Destinos',
            backgroundColor: Color.fromARGB(255, 255, 153, 0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gas_meter_rounded),
            label: 'Gasolina',
            backgroundColor: Color.fromARGB(255, 255, 17, 0),
          ),
        ],
        currentIndex: telaSelecionada,
        onTap: opcaoSelecionada,
      ),
    )
    );
  }
}