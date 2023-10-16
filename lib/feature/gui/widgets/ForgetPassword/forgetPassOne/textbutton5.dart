import 'package:flutter/material.dart';

class TextButtonOne extends StatelessWidget {
  const TextButtonOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5),
        child: TextButton( onPressed: (){
          Navigator.of(context).pushReplacementNamed("Login") ;
        }, child: const Text(
          'عد الى صفحه تسجيل الدخول',
          style: TextStyle(
        fontFamily: 'SST Arabic',
        fontSize: 18,
        color: Color(0xffff0000),
        fontWeight: FontWeight.w500,
        
          ),
        )),
      );

  }
}