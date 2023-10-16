import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../model/RequestModel.dart';

class ApprovedCard extends StatelessWidget {
   final void Function() onTap ;
  final RequestModel model;
  const ApprovedCard({super.key, required this.onTap, required this.model});

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
              model.status==3 ? Row(
                 crossAxisAlignment:CrossAxisAlignment.start ,
                    textDirection:TextDirection.rtl ,
                children: [
                  Text("تاريخ الانتهاء  :", style: const TextStyle(fontSize: 20), textDirection: TextDirection.rtl,),
                 Text("${model.eDate}", style: const TextStyle(fontSize: 20), textDirection: TextDirection.rtl,)
                ],
              ): const SizedBox(height:0.2,),
              
              Row(crossAxisAlignment:CrossAxisAlignment.start ,
                    textDirection:TextDirection.rtl ,
                children: [
                  Text("تقييمي:", textDirection: TextDirection.rtl,style: TextStyle(fontSize: 20),),
                  model.stars==0 ? Text("لم يتم التقييم ", style: TextStyle(color: Colors.red),): 
                  RatingBarIndicator(
        rating: model.stars!.toDouble(),
        itemCount: 5,
        itemSize: 24.0,
        itemBuilder: (context, index) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
      ),
                ],),
               Row(
                 crossAxisAlignment:CrossAxisAlignment.start ,
                    textDirection:TextDirection.rtl ,
                children:  [
                  const Text(" :حالة الحجز ", style:  TextStyle(fontSize: 20)),
                model.status==1?    const Text("ساري", style:   TextStyle(fontSize: 20,color: Colors.green , fontWeight: FontWeight.bold)) :
                 model.status==0?  const Text("معلق", style:  TextStyle(fontSize: 20,color: Colors.red , fontWeight: FontWeight.bold)):
                 model.status==2?  const Text("مرفوض", style:  TextStyle(fontSize: 20,color: Colors.red , fontWeight: FontWeight.bold)):
                  const Text("منتهي", style:  TextStyle(fontSize: 20,color: Colors.red , fontWeight: FontWeight.bold)),
                ],
              ),
          ]),
        ),
      ),
    );
  }
}