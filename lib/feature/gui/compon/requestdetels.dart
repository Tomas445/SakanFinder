import 'package:flutter/material.dart';

import '../../../model/getRoomDetailsAndRateModel.dart';

class RequestDetails extends StatelessWidget {
  const RequestDetails({super.key, required this.model});
 final getRoomDetailsAndRateModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start ,
                    textDirection:TextDirection.rtl ,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("رقم الغرفة : ${model.roID!}",style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold), textDirection: TextDirection.rtl,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${model.bedPrice}",style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                      const Text(":سعر الحجز بالشهر",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${model.numOfBed}",style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                    const Text(":عدد السراير",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${model.availableBeds}",style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                      const Text(":عدد السراير المتاحة",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
                  ],
                ),
                  const SizedBox(height: 15,),
                const Align(
              alignment: Alignment.bottomRight,
              child: Text(":الوصف",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold ),textAlign: TextAlign.right,)),  
              Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text("${model.roDescription}", textDirection: TextDirection.rtl,)
              )),
                ],
                ),
              ),
            );
  }
}