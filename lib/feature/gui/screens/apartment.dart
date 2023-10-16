
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mano/core/constant/color.dart';
import 'package:rating_summary/rating_summary.dart';
import '../../../core/constant/imageasset.dart';
import '../compon/apartmentdetailscard.dart';
import '../compon/cardroom.dart';
import 'cubits/home_cubit/home_cubit.dart';

class Apartment extends StatelessWidget {
    const Apartment({super.key});

  @override
  Widget build(BuildContext context) {
    final cubitRoom = BlocProvider.of<HomeCubit>(context);
    return  Scaffold(
      backgroundColor:  AppColor.white,
      body: ListView(
        children:  [
            Image.asset(AppImageAsset.home1,width:430, height: 255,),
            const SizedBox(height: 15,),
            const Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text("الغرف المتاحة",style: TextStyle(fontSize: 22),),
              )),
            const SizedBox(height: 20),
            BlocConsumer<HomeCubit,HomeState>( listener:  (context, state) {
      //         if(state is RoomDetailsIsNotEmpty){
      // //           showModalBottomSheet(context: context,
      // // shape: const RoundedRectangleBorder(
      // //   borderRadius: BorderRadius.vertical(top: Radius.circular(40))
      // // ),
      // // builder: (context)=> Container(
      // //   padding: const EdgeInsets.all(20),
      // // height: 250,
      // //   child: const Column(
      // //     children:  [
      // //       SizedBox(height: 30,),
      // //       Center(child: Text("لا يوجد اماكن فارغة الان للحجز", style: TextStyle(fontSize: 25),)),
      // //   ]),
      // // ));

      //         }
      },builder: (context , state){
        return  cubitRoom.rooms.isNotEmpty? SizedBox(
          height: 244,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: PageView.builder(
                  reverse: true,
                  scrollDirection: Axis.horizontal,
                  physics:  const BouncingScrollPhysics(),
                  itemCount:cubitRoom.rooms.length,
                  itemBuilder:  (BuildContext context,index) {
            return CardRoom(model: cubitRoom.rooms[index], onTap: ()async{
              cubitRoom.rooms[index].availableBeds==0? await showModalBottomSheet(context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40))
      ),
      builder: (context)=> Container(
        padding: const EdgeInsets.all(20),
      height: 250,
        child: const Column(
          children:  [
            SizedBox(height: 30,),
            Center(child: Text("لا يوجد اماكن فارغة الان للحجز", style: TextStyle(fontSize: 25),)),
        ]),
      )):
              await cubitRoom.getRoomDetails(roId: cubitRoom.rooms[index].roID.toString());
           cubitRoom.roomDetails.isNotEmpty?   Navigator.of(context).pushReplacementNamed("request"): 'return';  

            });
                  },
                  ),
          ),
        ):const Center(child: CircularProgressIndicator(),);
      }),
            const SizedBox(height: 20,),
            Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 30),
              child: ApartmentDetails(model:  cubitRoom.rooms[0]),
            ),
            cubitRoom.apartmentRating[0].total!=0?  RatingSummary(
                      counter: cubitRoom.apartmentRating[0].total!,
                      average: cubitRoom.apartmentRating[0].avg!.toDouble(),
                      counterFiveStars:cubitRoom.apartmentRating[0].stars5!,
                      counterFourStars: cubitRoom.apartmentRating[0].stars4!,
                      counterThreeStars: cubitRoom.apartmentRating[0].stars3!,
                      counterTwoStars: cubitRoom.apartmentRating[0].stars2!,
                      counterOneStars: cubitRoom.apartmentRating[0].stars1!,
                    ) : const Center(child:  Text("لا يوجد تقييمات حتي الان ")),
      ]),
    );
  }
}