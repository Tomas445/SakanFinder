import 'package:flutter/material.dart';

class TextHome extends StatelessWidget {
  const TextHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
           
    decoration: BoxDecoration(
      color: const Color(0xffF1EFEF),
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: const [
        BoxShadow(
          color: Color(0x29000000),
          offset: Offset(5, 3),
          blurRadius: 6,
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextButton(onPressed: (){}, child: const Text(
            'مشاهدة المزيد',
            style: TextStyle(
              fontFamily: 'Metropolis',
              fontSize: 13,
              color: Color(0xff104b2d),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.right,
            softWrap: false,
          )),
        ),
        const Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20),
          child:  Text(
            'النتائج',
            style: TextStyle(
              fontFamily: 'SST Arabic',
              fontSize: 20,
              color: Color(0xff000000),
              fontWeight: FontWeight.w500,
            ),
            softWrap: false,
          ),
        ),
  
      ]),
  );
  }
}