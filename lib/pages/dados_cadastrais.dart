// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:login_app/shared/widgets/text_label.dart';

import '../repository/nivel_repository.dart';

class DadosCadastrais extends StatefulWidget {
  const DadosCadastrais({
    Key? key,
  }) : super(key: key);

  @override
  State<DadosCadastrais> createState() => _DadosCadastraisState();
}

class _DadosCadastraisState extends State<DadosCadastrais> {
  var nomeController = TextEditingController(text: "");
  var dataNascimentoController = TextEditingController(text: "");

  DateTime? dataNascimento;
  var nivelRepository = NivelRepository();
  var niveis = [];
  var nivelSelecionado = "";

  @override
  void initState() {
    niveis = nivelRepository
        .retornaNiveis; //simula ainstancia de um banco de dados externo
    //em que niveis recebe os niveis do nivelRepository
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus dados"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextLabel(texto: "Nome"),
            TextField(
              controller: nomeController,
            ),
            const SizedBox(
              height: 10,
            ),
            const TextLabel(texto: "Data de nascimento"),
            TextField(
              readOnly: true,
              controller: dataNascimentoController,
              onTap: () async {
                var data = await showDatePicker(
                  context: context,
                  initialDate: DateTime(2000, 1,
                      1), //initial e lastDate funcionam como limitadores de datas
                  firstDate: DateTime(1900, 5, 20),
                  lastDate: DateTime(2023, 10, 23),
                );
                if (data != null) {
                  dataNascimentoController.text = data
                      .toString(); //se a data nao for nula, passa a data selecionada para o textField
                  dataNascimento = data; //recebe o valor da data
                }
                print(data);
              },
            ),
            const TextLabel(texto: "Nivel de experiencia"),
            Column(
              children:
                  niveis //para receber os niveis em cada radiobutton, é necessario fazer um map, que recebe nivel.toString
                      //e recebe cada item/nivel no titulo e valor, para exibir e transformar em lista(toList)
                      .map((nivel) => RadioListTile(
                          title: Text(
                            nivel.toString(),
                          ),
                          dense: true,
                          value: nivel.toString(),
                          groupValue:
                              nivelSelecionado, //recebe o nivel selecionado
                          selected: false,
                          onChanged: (nivel) {
                            setState(() {
                              nivelSelecionado = nivel
                                  .toString(); //nivelSelecionado recebe o valor selecionado
                            });
                            print(nivel);
                          }))
                      .toList(),
            ),
            TextButton(
                onPressed: () {
                  print(nomeController.text);
                  print(dataNascimento);
                },
                child: const Text("salvar"))
          ],
        ),
      ),
    );
  }
}
