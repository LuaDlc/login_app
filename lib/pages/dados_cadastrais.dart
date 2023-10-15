// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DadosCadastrais extends StatelessWidget {
  const DadosCadastrais({
    Key? key,
    required this.texto,
    required this.dados,
  }) : super(key: key);
  final String texto;
  final List<String>? dados;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(texto),
      ),
      body: Center(
        child: Text(dados!.length.toString()),
      ),
    );
  }
}
