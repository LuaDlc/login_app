// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:login_app/model/card_detail.dart';

class CardDetailPage extends StatelessWidget {
  const CardDetailPage({
    Key? key,
    required this.cardDetail,
  }) : super(key: key);

  final CardDetail cardDetail;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: cardDetail.id!,
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close)),
                Row(
                  children: [
                    Image.network(
                      cardDetail.url ?? '',
                      height: 20,
                      width: 20,
                    ),
                    Text(
                      cardDetail.title ?? '',
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Expanded(
                    child: Text(
                      cardDetail.text ?? '',
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
