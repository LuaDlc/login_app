import 'package:flutter/material.dart';
import 'package:login_app/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  //ao inves de variaves, usamos o texteditingcontroller para salvar oq foi digitado no input
  TextEditingController senhaController = TextEditingController();
  String errorMsg = '';

  String? validadeLogin(String? value) {
    if (emailController.text.isEmpty) {
      return 'entre com um valido';
    }
    if (senhaController.text.isEmpty) {
      return 'uma senha valida';
    }

    return null;
  }

  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            appBar: AppBar(
              title: const Text(''),
            ),
            body: Container(
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                //combinacao de singlescrow e constrainedBox, faz com que o teclado nao subescreva a tela
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            Expanded(child: Container()),
                            Expanded(
                              flex: 5,
                              child: Image.network(
                                'https://hermes.digitalinnovation.one/assets/diome/logo.png',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Ja tem cadastro?',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Faça seu login e make the change',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 30),
                            height: 30,
                            alignment: Alignment.center,
                            child: TextField(
                              controller: emailController,
                              onChanged: (value) {
                                print(value);
                              },
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      top:
                                          -5), // faz com que o intText fique alinhado
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(
                                        255,
                                        141,
                                        79,
                                        151,
                                      ),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color.fromARGB(
                                      255,
                                      141,
                                      79,
                                      151,
                                    ),
                                  )),
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.white),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Color.fromARGB(
                                      255,
                                      141,
                                      79,
                                      151,
                                    ),
                                  )),
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          height: 30,
                          alignment: Alignment.center,
                          child: TextField(
                              controller: senhaController,
                              obscureText: isObscureText,
                              onChanged: (value) {
                                print(senhaController);
                              },
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(top: -5),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(
                                      255,
                                      141,
                                      79,
                                      151,
                                    ),
                                  ),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Color.fromARGB(
                                    255,
                                    141,
                                    79,
                                    151,
                                  ),
                                )),
                                hintText: "senha",
                                hintStyle: const TextStyle(color: Colors.white),
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Color.fromARGB(
                                    255,
                                    141,
                                    79,
                                    151,
                                  ),
                                ),
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isObscureText = !isObscureText;
                                      });
                                    },
                                    child: Icon(isObscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility)),
                              )),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: 300,
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.amber),
                            ),
                            onPressed: () {
                              if (emailController.text.isNotEmpty &&
                                  emailController.text.contains('@') &&
                                  senhaController.text.isNotEmpty) {
                                //pushreplacement pois nao pdoe voltar para a page de login
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ),
                                );
                                return print('fd');
                              } else {
                                print('login nao efetuado');
                              }
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          height: 30,
                          alignment: Alignment.center,
                          child: const Text(
                            "Esqueci minha senha",
                            style: TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          height: 30,
                          alignment: Alignment.center,
                          child: const Text(
                            "Criar conta",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Expanded(child: Container()),
                      ]),
                ),
              ),
            )));
  }
}
