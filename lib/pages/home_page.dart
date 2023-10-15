import 'package:flutter/material.dart';
import 'package:login_app/pages/dados_cadastrais.dart';
import 'package:login_app/pages/page1.dart';
import 'package:login_app/pages/page2.dart';
import 'package:login_app/pages/page3.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int positionPage = 0;
  PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu app'),
      ),
      drawer: Drawer(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DadosCadastrais(
                          texto: 'Meus dados',
                          dados: ['name', 'endereco'],
                        ),
                      ),
                    );
                  },
                  child: const Text('Dados'),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    print('sasa');
                  },
                  child: const Text('Termos de uso e privacidade'),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                    onTap: () {
                      print('sasa');
                    },
                    child: const Text('configuracoes')),
                const SizedBox(
                  height: 20,
                ),
                const Divider(),
              ],
            )),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  positionPage = value;
                });
              },
              //navegacao entre paginas/telas
              children: const [
                Page1(),
                Page2(),
                Page3(),
              ],
            ),
          ),
          BottomNavigationBar(
              onTap: (value) {
                controller.jumpToPage(value);
              },
              currentIndex: positionPage,
              items: const [
                BottomNavigationBarItem(
                  label: 'Page1',
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  label: 'Page2',
                  icon: Icon(Icons.add),
                ),
                BottomNavigationBarItem(
                  label: 'Page',
                  icon: Icon(Icons.person),
                )
              ])
        ],
      ),
    );
  }
}
