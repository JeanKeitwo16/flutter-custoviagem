import 'package:custoviagem/cardDestino.dart';
import 'package:custoviagem/model/destinos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CarroTela extends StatefulWidget {
  const CarroTela({super.key});

  @override
  State<CarroTela> createState() => _CarroTelaState();
}

class _CarroTelaState extends State<CarroTela> {
   List<Destinos> listaDestinos = [
    Destinos(nomeDestino: "Durazno", distanciaDestino: 21.5),
  ];
  void removerItem(int index) {
    setState(() {
      listaDestinos.removeAt(index);
    });
  }
  final TextEditingController nomeDestinoController = TextEditingController();
  final TextEditingController autonomiaController = TextEditingController();
  void openModal() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 500,
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(
                children: [
                  Text(
                    "Digite as informações necessárias",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 25),
                  TextField(
                    controller: nomeCarroController,
                    decoration: InputDecoration(label: Text("Nome do Destino")),
                  ),
                  TextField(
                    controller: autonomiaController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      label: Text("Autonomia"),
                    ),
                  ),
                  SizedBox(height: 35),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.blueAccent),
                          foregroundColor: WidgetStatePropertyAll(Colors.white),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          minimumSize: WidgetStatePropertyAll(Size(300, 50))),
                      onPressed: () {
                        setState(() {
                          listaCarros.add(Carros(
                              nomeCarro: nomeCarroController.text,
                              autonomia: double.parse(autonomiaController.text),));
                        });
                        Navigator.pop(context);
                        nomeCarroController.clear();
                        autonomiaController.clear();
                      },
                      child: Text("Cadastrar")),
                ],
              ),
            ),
          );
        });
        
  }
 Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: listaCarros.length,
        itemBuilder: (context, index) {
          return CardCarro(
            nomeCarro: listaCarros[index].nomeCarro,
            autonomia: listaCarros[index].autonomia,
            onRemove: () => removerItem(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openModal();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}

