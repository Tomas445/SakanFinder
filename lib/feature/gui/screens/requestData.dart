import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:rating_summary/rating_summary.dart';

import '../../../core/constant/imageasset.dart';
import '../../../core/constant/linkapi.dart';
import '../compon/buttonApp.dart';
import 'cubits/home_cubit/home_cubit.dart';

class RequestData extends StatelessWidget {

  const RequestData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     double stars = 1 ;
     bool isShow = false;
    final cubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is AddOrUpdateRatingSuccess){
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return cubit.requestDetails.isNotEmpty
              ? SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25, right: 20,left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              IconButton(onPressed:() {
                               cubit.bottomNavIndex =3;
                               cubit.requestApproved();
                               Navigator.of(context).pushReplacementNamed("LayoutScreen");
                              }, icon:const Icon( Icons.arrow_back)),
                            ],
                          ),
                          const Text(
                            "بيانات الحجز ",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "رقم الحجز: ${cubit.requestDetails[0].rNumber}",
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "تاريخ الحجز: ${cubit.requestDetails[0].sDate}",
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(height: 5),
                           cubit.requestDetails[0].status == 3 ? Text(
                            "تاريخ نهاية الحجز: ${cubit.requestDetails[0].eDate}",
                            style: TextStyle(fontSize: 20,),textDirection:TextDirection.rtl,
                          ): const SizedBox(height: 0.2,),
                         
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            textDirection: TextDirection.rtl,
                            children: [
                              const Text(
                                ":حالة الحجز",
                                style: TextStyle(fontSize: 20),
                              ),
                              cubit.requestDetails[0].status == 1
                                  ? const Text(
                                      "ساري",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  : cubit.requestDetails[0].status == 0
                                      ? const Text(
                                          "معلق",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      : cubit.requestDetails[0].status == 2
                                          ? const Text(
                                              "مرفوض",
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          : const Text(
                                              "منتهي",
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment:CrossAxisAlignment.start ,
                    textDirection:TextDirection.rtl ,
                            children: [const Text("تقييمي :", style:TextStyle(fontSize: 20) ,textDirection: TextDirection.rtl,),
                              cubit.requestDetails[0].stars == 0? const Text("لم يتم التقييم حتي الان", style:TextStyle(fontSize: 20) ,): 
                              RatingBarIndicator(
        rating: cubit.requestDetails[0].stars!.toDouble(),
        itemCount: 5,
        itemSize: 24.0,
        itemBuilder: (context, index) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
      ),
                            ],
                          ),
                          cubit.requestDetails[0].status == 1?  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                        ButtonApp(name:  "تقييم الحجز", onPressed: () {
                        showDialog(context: context ,builder: (context){
                          return AlertDialog(
                                              title:const Text("تقييم الحجز",textDirection: TextDirection.rtl,) ,
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [

                                          const Text("برجاء تحديد مدي رضائك عن الحجز ومعاملة المالك والمصدقية في التفاصيل المعلنة في التطبيق" ,textDirection: TextDirection.rtl,),
                                          const SizedBox(height: 40,),
                                        RatingBar.builder(
                          initialRating: 1,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (val) {
                          stars = val ;
                          },
                        )
                                    ]),
                                    actions: [
                                      TextButton(onPressed: (){
                                      cubit.requestDetails[0].stars != stars ?   cubit.addOrUpdateRating(rNumber:  cubit.requestDetails[0].rNumber.toString() , stars: stars.toString(), roId: cubit.requestDetails[0].roID.toString()) :
                                      Navigator.pop(context);
                                      }, child: const Text("تقييم")),
                                      TextButton(onPressed: (){
                                        Navigator.pop(context);
                                      }, child: const Text("انهاء"))
                                    ],
                                    );
                        },
                           
                        );
                    } ),
                    ButtonApp(name:"انهاء الحجز", onPressed: () {
                cubit.endRequest(rNumber: cubit.requestDetails[0].rNumber.toString() , roId:cubit.requestDetails[0].roID.toString() );
                    } ),
                
                            ],
                          ):
                          const SizedBox(height: 3,),
                            
                  Visibility(
                    visible: isShow,
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start ,
                    textDirection:TextDirection.rtl ,
                      children: [
                         const Divider(thickness: 3 ,color: Colors.black,),
                        Image.asset(AppImageAsset.homeRectangle),
                      const Text("بيانات الغرفة :", style: TextStyle(fontSize: 22 , fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,),
                      Text("رقم الغرفة:${cubit.requestDetails[0].roID}" , style: const TextStyle(fontSize: 22 , fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,),
                     const Text("الوصف :", style:  TextStyle(fontSize: 22 , fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,),
                    Text("${cubit.requestDetails[0].roDescription}" , style: const TextStyle(fontSize: 22 , fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,),
                    Text("سعر الحجز :${cubit.requestDetails[0].bedPrice}" , style: const TextStyle(fontSize: 22 , fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,),
                    Text("عدد السراير :${cubit.requestDetails[0].numOfBed}" , style: const TextStyle(fontSize: 22 , fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,),
                    Text("المتاح :${cubit.requestDetails[0].availableBeds==0 ?" الغرفة غير متاحة للحجز" : cubit.requestDetails[0].availableBeds}" , style: const TextStyle(fontSize: 22 , fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,),
                    Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: cubit.requestDetails[0].total!=0? RatingSummary(
                      counter: cubit.requestDetails[0].total!,
                      average:cubit.requestDetails[0].avg!.toDouble(),
                      counterFiveStars:cubit.requestDetails[0].star5!,
                      counterFourStars: cubit.requestDetails[0].star4!,
                      counterThreeStars: cubit.requestDetails[0].star3!,
                      counterTwoStars: cubit.requestDetails[0].star2!,
                      counterOneStars: cubit.requestDetails[0].star1!,
                    ):const Center(child: Text("لا يوجد تقييمات للغرفة حتي الان")),
             ),
             const Divider(thickness: 3 ,color: Colors.black,),
            const Text("بيانات الشقة :", style:  TextStyle(fontSize: 22 , fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,),
             SizedBox(
               width: 360, height:200 ,
              child: Image.network("$linkImageRoot/${cubit.requestDetails[0].image}",fit: BoxFit.fill,)),
              Text("رقم الشقة:${cubit.requestDetails[0].aID}" , style: const TextStyle(fontSize: 22 , fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,),
                Text("عدد الغرف:${cubit.requestDetails[0].nOfRoom}" , style: const TextStyle(fontSize: 22 , fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,),
                  Text("المساحة :${cubit.requestDetails[0].area}" , style: const TextStyle(fontSize: 22 , fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,),
             const Divider(thickness: 3 ,color: Colors.black,),
            const Text("بيانات المالك :", style:  TextStyle(fontSize: 22 , fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,),
              Text(" الاسم:${cubit.requestDetails[0].oName}" , style: const TextStyle(fontSize: 22 , fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,),
              Text(" البريد الالكتروني:${cubit.requestDetails[0].oEmail}" , style: const TextStyle(fontSize: 22 , fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,),
              Text(" رقم الهاتف:${cubit.requestDetails[0].phone}" , style: const TextStyle(fontSize: 22 , fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,),
               const Divider(thickness: 3 ,color: Colors.black,),
                   const Text(" تواصل عبر :", style:  TextStyle(fontSize: 22 , fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,),
                  ],)),
                  TextButton(onPressed: (){
                              isShow = !isShow;
                              cubit.setStat();
                            }, child:  isShow== false? const Text("عرض المزيد") :const Text("عرض اقل")),
                        ],
                      ),
                    ),
                  ),
                )
              : Center(child: Lottie.asset(AppImageAsset.apartmentLottie));
        },
      ),
    );
    
  }
}
