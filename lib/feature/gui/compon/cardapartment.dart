import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mano/feature/gui/screens/cubits/home_cubit/home_cubit.dart';
import '../../../core/constant/linkapi.dart';
import '../../../model/apartmentmodel.dart';




class CardApartment extends StatelessWidget {
  final void Function() onTap ;
  final ApartmentModel model;
  final HomeCubit cubit;

  const CardApartment({super.key, required this.onTap,required, required this.model, required this.cubit , });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(onTap:onTap,
        child: Stack(
                    children: [
                      SizedBox(
                        width: 360, height:200 ,
                        child:Image.network("$linkImageRoot/${model.image}",fit: BoxFit.fill,)),
                        Container(
                          margin: const EdgeInsets.only(top: 10 , left: 15),
                          child: IconButton(onPressed: (){
                          cubit.addorRemovefavourites(aId: model.aID.toString());
                          },
                          icon: Icon(Icons.favorite,
                            color: cubit.favouritesid.contains(model.aID.toString()) ? Colors.red : Colors.grey,
                            size: 30,
                            ),
                            ),
                            ),
                        Container(margin: const EdgeInsets.only(top: 170) ,
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
                     Text("رقم الشقة : ${model.aID!}", textDirection: TextDirection.rtl,),
                     const SizedBox(height: 5,),
                      Text("العنوان : ${model.location!}", textDirection: TextDirection.rtl,),
                        const SizedBox(width: 25,),
                       // Text(model.location!),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          textDirection: TextDirection.rtl,
                          children:  [
                            Text(
            "غرف /${model.nOfRoom} ",
            style: const TextStyle(
              fontFamily: 'SST Arabic',
              fontSize: 15,
              color: Color(0xff000000),
            ),
            textAlign: TextAlign.center,
            softWrap: false,
            ),
            Text(
            "مطبخ/ ${model.nOfKitchens} ",
            style: const TextStyle(
              fontFamily: 'SST Arabic',
              fontSize: 15,
              color: Color(0xff000000),
            ),
            textAlign: TextAlign.center,
            softWrap: false,
            ),
            Text(
            "حمام/ ${model.nOfWC} ",
            style: const TextStyle(
              fontFamily: 'SST Arabic',
              fontSize: 15,
              color: Color(0xff000000),
            ),
            textAlign: TextAlign.center,
            softWrap: false,
            ),
            Text(
            "المساحة بالمتر /${model.area} ",
            style: const TextStyle(
              fontFamily: 'SST Arabic',
              fontSize: 15,
              color: Color(0xff000000),
            ),
            textAlign: TextAlign.center,
            softWrap: false,
            )
                        ],),
                        Align(
                          alignment:Alignment.topRight ,
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: [
                            const Text("/سكان الشقة المسموح بهم"),
                            const SizedBox(width: 20,),
                              Text("${model.genderGuest} فقط"),
                          ],),
                        )
                        ]),
                      ),
                      ),
                    ],),
  ));}
}