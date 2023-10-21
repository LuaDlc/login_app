import 'package:flutter/material.dart';
import 'package:login_app/pages/login_page.dart';

import '../../pages/dados_cadastrais.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //componente que cria tipo um containter com os dados inseridos ans propriedades
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: (BuildContext context) {
                    return Wrap(children: [
                      Column(
                        children: [
                          ListTile(
                            contentPadding: const EdgeInsets.all(8.0),
                            title: const Text('camera'),
                            leading: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.camera_alt_outlined)),
                          ),
                          ListTile(
                            contentPadding: const EdgeInsets.all(8.0),
                            title: const Text('album'),
                            leading: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.album_rounded)),
                          ),
                        ],
                      )
                    ]);
                  });
            },
            child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.deepPurple[400]),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.deepPurple,
                  child: Image.asset('assets/avatar.png'),
                ),
                accountName: const Text("Luana Dias"),
                accountEmail: const Text("Email@email.com")),
          ),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DadosCadastrais(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  const Icon(Icons.person_2_rounded),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    child: const Text('Dados'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              children: [
                const Icon(Icons.info_outlined),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 16),
                            child: const SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text(
                                    'Termos de uso e privacidade',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Ao contrário do que se acredita, Lorem Ipsum não é simplesmente um texto randômico. Com mais de 2000 anos, suas raízes podem ser encontradas em uma obra de literatura latina clássica datada de 45 AC. Richard McClintock, um professor de latim do Hampden-Sydney College na Virginia, pesquisou uma das mais obscuras palavras em latim, consectetur, oriunda de uma passagem de Lorem Ipsum, e, procurando por entre citações da palavra na literatura clássica, descobriu a sua indubitável origem. Lorem Ipsum vem das seções 1.10.32 e 1.10.33 do "de Finibus Bonorum et Malorum" (Os Extremos do Bem e do Mal), de Cícero, escrito em 45 AC. Este livro é um tratado de teoria da ética muito popular na época da Renascença. A primeira linha de Lorem Ipsum, "Lorem Ipsum dolor sit amet..." vem de uma linha na seção 1.10.32',
                                    style: TextStyle(fontSize: 12),
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: const Text(
                    'Termos de uso e privacidade',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              children: [
                const Icon(Icons.settings),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                    onTap: () {}, child: const Text('configuracoes')),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              children: [
                const Icon(Icons.exit_to_app_rounded),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              alignment: Alignment.centerLeft,
                              elevation: 8,
                              title: const Wrap(children: [Text('Sair')]),
                              content: const Text('Deseja sair do app?'),
                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginPage())); //usuario retorna á tela de login
                                      },
                                      child: const Text('Sair'),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('voltar'))
                                  ],
                                )
                              ],
                            );
                          });
                    },
                    child: const Text('Sair')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
