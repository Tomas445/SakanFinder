import 'package:flutter/material.dart';

class TextOne extends StatelessWidget {
  const TextOne({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
    'برجاء ادخال البريد الإلكتروني الخاص بك لتلقي ',
    style: TextStyle(
      fontFamily: 'SST Arabic',
      fontSize: 16,
      color: Color(0xff717171),
      letterSpacing: 0.08,
      fontWeight: FontWeight.w500,
    ),
    textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
    textAlign: TextAlign.right,
    softWrap: false,
  );
  }
}