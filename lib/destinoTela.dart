import 'package:custoviagem/cardDestino.dart';
import 'package:custoviagem/model/destinos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DestinoTela extends StatefulWidget {
  const DestinoTela({super.key});

  @override
  State<DestinoTela> createState() => _DestinoTelaState();
}

class _DestinoTelaState extends State<DestinoTela> {
   List<Destinos> listaDestinos = [
    Destinos(nomeDestino: "Durazno", distanciaDestino: 21.5),
  ];
  void removerItem(int index) {
    setState(() {
      listaDestinos.removeAt(index);
    });
  }
  final TextEditingController nomeDestinoController = TextEditingController();
  final TextEditingController distanciaDestinoController = TextEditingController();
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
                    controller: nomeDestinoController,
                    decoration: InputDecoration(label: Text("Nome do Destino")),
                  ),
                  TextField(
                    controller: distanciaDestinoController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      label: Text("Distância do Destino"),
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
                          listaDestinos.add(Destinos(
                              nomeDestino: nomeDestinoController.text,
                              distanciaDestino: double.parse(distanciaDestinoController.text),));
                        });
                        Navigator.pop(context);
                        nomeDestinoController.clear();
                        nomeDestinoController.clear();
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
        itemCount: listaDestinos.length,
        itemBuilder: (context, index) {
          return CardDestino(
            nomeDestino: listaDestinos[index].nomeDestino,
            distanciaDestino: listaDestinos[index].distanciaDestino,
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

