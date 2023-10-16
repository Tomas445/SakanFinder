import 'package:flutter/material.dart';

import '../../../../model/requestdetailsmodel.dart';




class RequestHedar extends StatelessWidget {
  final RequestDetailsModel model;
  const RequestHedar({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 25, right: 20),
                  child: Column(
                    // textDirection: TextDirection.rtl,
                    // mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                  const Text("بيانات الحجز ", style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    Text("رقم الحجز :${model.rNumber}", style: const TextStyle(fontSize: 20),),
                  const SizedBox(height: 5,),
                   Text("تاريخ الحجز :${model.sDate}", style:  const TextStyle(fontSize: 20)),
                  const SizedBox(height: 5,),
                               // Text("${cubit.requestDetails[0].sDate}", style: const TextStyle(fontSize: 20)),
                  const SizedBox(height: 5,),
                  const Text(":تاريخ نهاية الحجز", style:  TextStyle(fontSize: 20)),
                  model.status==3?  Text("${model.eDate}", style: const TextStyle(fontSize: 20)):
                  model.status==0?  const Text("الحجز معلق"):
                  model.status==2?  const Text("الحجز مرفوض"):
                  const Text("الحجز ساري ولم يتم تحديد تاريخ"),
                
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
                
                            ],
                          ),
                ),
              ))
        
      );
    
  }
}