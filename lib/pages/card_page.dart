import 'package:flutter/material.dart';
import 'package:login_app/model/card_detail.dart';
import 'package:login_app/pages/card_detail.dart';
import 'package:login_app/repository/card_detail_repository.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  CardDetail? cardDetail; //precisa de um repository inicializado e um initState
  var cardDetailRepository = CardDetailRepository();

  @override
  void initState() {
    super.initState();
    carregarDados(); //precisa chamar a funcao aqui pra iniciar o carregamento de dados
  }

  void carregarDados() async {
    cardDetail =
        await cardDetailRepository.get(); //a funcao pode ser future, com async
    //initsatet nao pode ser, por isso a funcao foi criada. aguardar o carregamento dos dados
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: cardDetail == null
              ? const LinearProgressIndicator()
              : GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => CardDetailPage(
                                cardDetail:
                                    cardDetail!))); //usamos o ! pois nao pode ser nulo
                  },
                  child: Hero(
                    tag: cardDetail!.id ?? '',
                    child: Card(
                      elevation: 8,
                      shadowColor: Colors.grey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              children: [
                                Image.network(
                                  cardDetail!.url ?? '',
                                  height: 20,
                                  width: 20,
                                ),
                                Text(
                                  cardDetail!.title!,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12),
                            child: Text(
                              cardDetail!.text ?? '',
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        )
      ],
    );
  }
}
