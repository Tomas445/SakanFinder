import 'package:flutter/material.dart';

class TextTwo extends StatelessWidget {
  const TextTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
    ' رابط لإنشاء كلمة مرور جديدة عبر البريد الإلكتروني',
    style: TextStyle(
      fontFamily: 'SST Arabic',
      fontSize: 16,
      color: Color(0xff717171),
      letterSpacing: 0.08,
      fontWeight: FontWeight.w500,
    ),
    );
  }
}