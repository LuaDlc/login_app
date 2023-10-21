import 'package:flutter/material.dart';
import 'package:login_app/pages/dados_cadastrais.dart';
import 'package:login_app/pages/card_page.dart';
import 'package:login_app/pages/page2.dart';
import 'package:login_app/pages/page3.dart';
import 'package:login_app/shared/widgets/custom_drawer.dart';

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
      drawer: const CustomDrawer(),
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
                CardPage(),
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
