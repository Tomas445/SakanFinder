

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../core/constant/imageasset.dart';
import '../../../model/viewAllRoomFromApartmentModel.dart';

class CardRoom extends StatelessWidget {
  const CardRoom({super.key, required this.model, required this.onTap});
 final ViewAllRoomFromApartmentModel model ;
 final void Function() onTap ;
  @override
  Widget build(BuildContext context) {
    return Center(
                  child: InkWell(onTap: onTap,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 7.5),
              child: Stack(
                          children: [
                            SizedBox(
                              width: 360, height:190 ,
                              child:Image.asset(AppImageAsset.homeRectangle,fit: BoxFit.fill,)),
                              Container(margin: const EdgeInsets.only(top: 120) ,
                              decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(width: 1.0, color: const Color(0xff707070)),
                  ),
                            width: 360,
                           
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                 crossAxisAlignment:CrossAxisAlignment.start ,
                    textDirection:TextDirection.rtl ,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingBarIndicator(
                    rating: model.avg!.toDouble(),
                    itemCount: 5,
                    itemSize: 24.0,
                    itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Colors.amber,
                    ),
                  ),
                  const Text("التقييم",style: TextStyle(fontSize: 15),),
                          ],
                              ),
                              Text("رقم الغرفة : ${model.roID!}", textDirection: TextDirection.rtl,),
                              Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  const Text("/سعر الحجز بالشهر"),
                                  const SizedBox(width: 25,),
                                  Text("${model.bedPrice}"),
                                ],
                              ),
                              Text(" ${model.numOfBed} /عدد السراير في الغرفة"),
                              Text(" ${model.availableBeds} / عدد السراير المتاحة"),
                              ]),
                            ),
                            ),
                          ],),
            ),
                  ));
  }
}