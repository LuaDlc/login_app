import 'package:flutter/material.dart';

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
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple[400]),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.deepPurple,
                child: Image.asset('assets/avatar.png'),
              ),
              accountName: const Text("Luana Dias"),
              accountEmail: const Text("Email@email.com")),
          const SizedBox(
            height: 20,
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
            height: 20,
          ),
          const Divider(),
          const SizedBox(
            height: 20,
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
                    print('sasa');
                  },
                  child: const Text('Termos de uso e privacidade'),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          const SizedBox(
            height: 20,
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
                    onTap: () {
                      print('sasa');
                    },
                    child: const Text('configuracoes')),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
