

import 'package:flutter/material.dart';

class TextThree extends StatelessWidget {
  const TextThree({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.only(top: 50),
      child:  Text(
       "انشاء كلمة المرور",
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
      ),
    );
  }
}