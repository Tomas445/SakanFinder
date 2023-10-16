import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mano/core/constant/color.dart';
import 'package:rating_summary/rating_summary.dart';
import '../../../core/constant/imageasset.dart';
import '../compon/requestdetels.dart';
import 'cubits/home_cubit/home_cubit.dart';

class Request extends StatelessWidget {
  const Request({super.key});

  @override
  Widget build(BuildContext context) {
bool reservationIsNotAvailable = true;
   
    final cubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      backgroundColor:  AppColor.white,
      body: ListView(
        children:  [
            Image.asset(AppImageAsset.home1,width:430, height: 255,), 
            const SizedBox(height: 15,),
            const Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text("بيانات االغرفة ",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              )),
            const SizedBox(height: 20),
            BlocConsumer<HomeCubit,HomeState>( listener:  (context, state) {
              if(state is RequestLoding){
               
              }else if(state is RequestSuccess){
              
                AwesomeDialog(
      context: context ,
    title: "تنبيه", body: const Column(children: [
      Text("تم الحجز "),
      Text("جاري مراجعت طلبك من قبل المالك"),
    ],)).show();
              }else if(state is RequestFailure){
               
                AwesomeDialog(
      context: context ,
    title: "تنبيه", body: const Text("حدث خطا اثناء الحجز")).show();
                  }else if(state is RequestNotEmpty){
               
                reservationIsNotAvailable = false ;
                  }
      },builder: (context , state){
        return cubit.roomDetails.isNotEmpty? Column(children: [
          ListView.builder(
        shrinkWrap: true,
        physics:  const ScrollPhysics(),
          itemCount: cubit.roomDetails.length ,
          itemBuilder: (BuildContext context, int index) {
            return RequestDetails(model: cubit.roomDetails[index]) ;

          },
        ),
        const SizedBox(height: 20,),
   
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: cubit.roomDetails[0].total!=0? RatingSummary(
                      counter: cubit.roomDetails[0].total!,
                      average:cubit.roomDetails[0].avg!,
                      counterFiveStars:cubit.roomDetails[0].star5!,
                      counterFourStars: cubit.roomDetails[0].star4!,
                      counterThreeStars: cubit.roomDetails[0].star3!,
                      counterTwoStars: cubit.roomDetails[0].star2!,
                      counterOneStars: cubit.roomDetails[0].star1!,
                    ):const Center(child: Text("لا يوجد تقييمات للغرفة حتي الان")),
             ),
             
            const SizedBox(height: 35,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: cubit.roomDetails[0].availableBeds!>0? MaterialButton(
                onPressed: ()async{
                  await cubit.addRequest(cubit.roomDetails[0].roID!.toString());
                
                },
                color: AppColor.buttonColor,
                elevation: 7,
                padding: const EdgeInsets.symmetric(horizontal: 70,vertical: 3),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)) ,
                child: const Text("احجز الان",
                style: TextStyle(
                  fontFamily: 'SST Arabic',
                  fontSize: 18,
                  color: AppColor.white,
                ),
              ),
                  ):const Text("نأسف لايوجد اماكن للحجز الان ",style: TextStyle(color: Colors.red),),
            ),
            
          const SizedBox(height: 30,),
        ],):const Center(child: CircularProgressIndicator(),);
      }),
      ]),
    );
  }
}