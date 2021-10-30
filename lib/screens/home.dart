import 'package:aulaflutter/model/clima_model.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late ClimaModel climaModel;

  final List<String> _cidades = [
    "Aracaju",
    "Belém",
    "Belo Horizonte",
    "Boa Vista",
    "Brasilia",
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
    "Rio de Janeiro",
    "Salvador",
    "São Luis",
    "São Paulo",
    "Teresina",
    "Vitória"
  ];

  String _cidadeSelecionada = "São Paulo";

  carregaClima() async {
    const String _apiURL = "api.openweathermap.org";
    const String _path = "/data/2.5/weather";
    const String _appid = ""; //SUA chave de API
    const String _units = "metric";
    const String _lang = "pt_br";

    final _parametros = {
      "q": _cidadeSelecionada,
      "appid": _appid,
      "units": _units,
      "lang": _lang
    };

    final tempoResponse = await http.get(Uri.https(_apiURL, _path, _parametros));

    print("URL Montada:" + tempoResponse.request!.url.toString());

    //paramos aqui.
    //o que falta: Verificar se deu ok, pegar o json e mandar para a fábrica de objetos

    if(tempoResponse.statusCode == 200){
      climaModel = ClimaModel.fromJson(jsonDecode(tempoResponse.body));
    }

  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;

    return Scaffold(
      appBar: AppBar(
        title: Text(_cidadeSelecionada),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            DropdownSearch<String>(
              mode: Mode.MENU,
              showSelectedItems: true,
              items: _cidades,
              showSearchBox: true,
              maxHeight: height - padding.top - padding.bottom - 25,
              onChanged: (value) {
                setState(() {
                  _cidadeSelecionada = value!;
                  carregaClima();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
