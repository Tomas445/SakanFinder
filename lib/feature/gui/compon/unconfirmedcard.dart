import 'package:flutter/material.dart';

import '../../../model/RequestModel.dart';

class UnconfirmedCard extends StatelessWidget {
   final void Function() onTap ;
  final RequestModel model;
  const UnconfirmedCard({super.key, required this.onTap, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Container(
        
        decoration: BoxDecoration(
              color: const Color.fromARGB(255, 242, 242, 242),
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(width: 1.7, color: const Color.fromARGB(255, 57, 57, 57)),
            ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start ,
                    textDirection:TextDirection.rtl ,
            children: [
              Text("رقم الحجز :${model.rNumber}", style: const TextStyle(fontSize: 20),),
              const SizedBox(height: 5,),
              Text("تاريخ الحجز :${model.sDate}", style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 5,),
              Text("رقم الغرفة :${model.rOID}", style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 5,),
              const Row(
                 crossAxisAlignment:CrossAxisAlignment.start ,
                    textDirection:TextDirection.rtl ,
                children: [
                  Text(" :حالة الحجز ", style:  TextStyle(fontSize: 20)),
                  Text("معلق", style:  TextStyle(fontSize: 20,color: Colors.red , fontWeight: FontWeight.bold)),
                ],
              ),
          ]),
        ),
      ),
    );
  }
}