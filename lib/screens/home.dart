import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _cidades = [
    "Aracaju",
    "Balém",
    "Belo Horizonte",
    "Boa Vista",
    "Brasília",
    "Campo Grande",
    "Cuiaba",
    "Curitiba",
    "Florianópolis",
    "Fortaleza",
    "Goiânia",
    "João Pessoa",
    "Macapá",
    "Maceió",
    "Manaus",
    "Natal",
    "Palmas",
    "Porto Alegre",
    "Porto Velho",
    "Recife",
    "Rio Branco",
    "Rio de Janeira",
    "Salvador",
    "São Luís",
    "São Paulo",
    "Teresina",
    "Vitória"

  ];

  String _cidadeSelecionada = "São Paulo";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;

    return Scaffold(
      appBar: AppBar(
        title: Text("Uniclima"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            DropdownSearch<String>(
              mode: Mode.MENU,
              showSelectedItems: true,
              items: _cidades,
              maxHeight: height - padding.top - padding.bottom - 25,
              onChanged: (value) {
                setState(){
                  _cidadeSelecionada = value!;
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
