import 'package:flutter/material.dart';

import '../../../model/viewAllRoomFromApartmentModel.dart';

class ApartmentDetails extends StatelessWidget {
  final ViewAllRoomFromApartmentModel model;
  const ApartmentDetails({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
                children: [
                  const Text("بيانات الشقة ", style: TextStyle(fontSize: 30),),
                    const SizedBox(height: 20,),
                    Row(
                       crossAxisAlignment:CrossAxisAlignment.start ,
                    textDirection:TextDirection.rtl ,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(" رقم الشقة :",style:  TextStyle(fontSize: 17,fontWeight: FontWeight.bold), textDirection: TextDirection.rtl,),
                         Text(" ${model.aID}",style:  const TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                      ],
                    ),
              Row(
                crossAxisAlignment:CrossAxisAlignment.start ,
                    textDirection:TextDirection.rtl ,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   const Text("العنوان :",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,),
                  Text(" ${model.location}",style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                   
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(" ${model.nOfRoom}",style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                  const Text("/عدد الغرف",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(" ${model.nOfKitchens}",style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                    const Text("/عدد المطابخ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(" ${model.nOfWC}",style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                  const Text("/عدد الحمامات ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(" ${model.area}",style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                  const Text("/ المساحة",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(" ${model.genderGuest}",style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                  const Text("/ سكن خاص",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
                ],
              ),
                ],
              );
  }
}