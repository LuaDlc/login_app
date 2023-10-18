// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:login_app/repository/linguagens_repository.dart';
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
  var linguagensRepository = LinguagensRepository();
  var niveis = [];
  var linguagens = [];
  var nivelSelecionado = "";
  var linguagensSelecionadas = [];
  double salarioEscolhido = 0;
  int tempoExperiencia = 0;
  bool loading = false;

  @override
  void initState() {
    niveis = nivelRepository
        .retornaNiveis; //simula ainstancia de um banco de dados externo
    //em que niveis recebe os niveis do nivelRepository
    linguagens = linguagensRepository.retornaLinguages();
    super.initState();
  }

//essa funcao recebe uma var int e fara um loop simples, pra cada item, adiciona mais um, enquanto for menor ou igual ao valor definido no itens
  List<DropdownMenuItem<int>> returnItens(int quantidademaxima) {
    var itens = <DropdownMenuItem<int>>[];
    for (var i = 0; i <= quantidademaxima; i++) {
      itens.add(DropdownMenuItem(
        value: i, //recebe o valor em cada loop
        child: Text(
            i.toString()), //retorna esse valor como texto dentr do dropdwon
      ));
    }
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus dados"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: loading
            ? const Center(child: CircularProgressIndicator())
            : ListView(
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
                                }))
                            .toList(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const TextLabel(texto: "Linguagens preferidas"),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: linguagens
                            .map(
                              (linguagem) => CheckboxListTile(
                                  title: Text(linguagem),
                                  value: linguagensSelecionadas
                                      .contains(linguagem),
                                  onChanged: (bool? value) {
                                    if (value!) {
                                      setState(() {
                                        linguagensSelecionadas.add(
                                            linguagem); //adiciona a liguagem selecionada a lista
                                      });
                                    } else {
                                      setState(() {
                                        linguagensSelecionadas.remove(
                                            linguagem); //remov a linguagem desmaracda da listya
                                      });
                                    }
                                  }),
                            )
                            .toList()),
                  ),
                  TextLabel(
                      texto: 'tempo de experiencia $tempoExperiencia anos'),
                  DropdownButton(
                      value: tempoExperiencia,
                      isExpanded: true,
                      items: returnItens(50),
                      onChanged: (value) {
                        setState(() {
                          tempoExperiencia = value!.toInt();
                        });

                        print(value);
                      }),
                  TextLabel(
                      texto:
                          "Pretensao salarial: R\$ ${salarioEscolhido.round()}"), //exibira o valor escolhido em cada alteracao
                  Slider(
                    min: 0,
                    max: 10000,
                    value: salarioEscolhido,
                    onChanged: (double value) {
                      setState(() {
                        salarioEscolhido =
                            value; //salarioEScolhido recebe o value para ser alterado
                      });
                    },
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          loading =
                              false; //sempre que clicar o botao, limpa a var pra ter certeza q ta falso
                        });
                        if (nomeController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('o nome precisa ser preenchido'),
                            ),
                          );
                          return;
                        } else {
                          print(nomeController.text);
                        }
                        if (dataNascimento == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('data de nascimento invalida'),
                            ),
                          );
                          return;
                        } else {
                          print(dataNascimento);
                        }
                        if (nivelSelecionado.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('selecione um nivel'),
                            ),
                          );
                          return;
                        } else {
                          print(nivelSelecionado);
                        }
                        if (linguagensSelecionadas.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('selecione ao menos uma linguagem'),
                            ),
                          );
                          return;
                        } else {
                          print(linguagensSelecionadas);
                        }
                        if (tempoExperiencia == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('selecione o tempo de experiencia'),
                            ),
                          );
                          return;
                        } else {
                          print(tempoExperiencia);
                        }
                        if (salarioEscolhido == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('vai trabalhar de graça?'),
                            ),
                          );
                          return;
                        } else {
                          print(salarioEscolhido.round());
                        }
                        //apos validar tudo, seta loading pra true e salva
                        setState(() {
                          loading = true;
                        });
                        // print('salvo');
                        //apos salvar executa o delayed com setstate e loading para de salvar/carregar
                        //e fecha a tela
                        Future.delayed(const Duration(seconds: 2), () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('dados salvos com sucesso'),
                            ),
                          );
                          //setstate aqui é desnecessario
                          // setState(() {
                          //   loading = false;
                          // });
                          Navigator.pop(context);
                        });
                      },
                      child: const Text("salvar"))
                ],
              ),
      ),
    );
  }
}
