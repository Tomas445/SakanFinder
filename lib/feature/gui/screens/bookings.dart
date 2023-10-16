import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constant/imageasset.dart';
import '../compon/approvedcard.dart';
import 'cubits/home_cubit/home_cubit.dart';

class Bookings extends StatelessWidget {
  const Bookings({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return  Scaffold(
      body: BlocConsumer<HomeCubit,HomeState>( listener: (context, state) {
          },builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 7,right: 7),
                child: Column(
                crossAxisAlignment:CrossAxisAlignment.start ,
                  textDirection:TextDirection.rtl ,
                  children:  [
                  ListView.separated(
                  itemBuilder: (BuildContext context,index){
                    return  cubit.approvedRequest.isNotEmpty ? ApprovedCard(onTap: (){
                      cubit.getRequestDetails(rNumber:  cubit.approvedRequest[index].rNumber.toString() , roId:cubit.approvedRequest[index].rOID.toString() );
                      Navigator.of(context).pushReplacementNamed("RequestDetails");
                    },
                    model: cubit.approvedRequest[index], 
                    ):   Center(child: Lottie.asset(AppImageAsset.roomLottie));
                  },
                    separatorBuilder:  (context, index) {
                    return const SizedBox(height: 15,);
                  },
                  shrinkWrap: true,
                  physics:  const ScrollPhysics(),
                      itemCount: cubit.approvedRequest.length
                ),
                ListView.separated(
                  itemBuilder: (BuildContext context,index){
                    return  cubit.finishRequest.isNotEmpty ? ApprovedCard(onTap: (){
                      cubit.getRequestDetails(rNumber:  cubit.finishRequest[index].rNumber.toString() , roId:cubit.finishRequest[index].rOID.toString() );
                      Navigator.of(context).pushReplacementNamed("RequestDetails");
                    },
                    model: cubit.finishRequest[index], 
                    ):   Center(child: Lottie.asset(AppImageAsset.roomLottie));
                  },
                    separatorBuilder:  (context, index) {
                    return const SizedBox(height: 15,);
                  },
                  shrinkWrap: true,
                  physics:  const ScrollPhysics(),
                      itemCount: cubit.finishRequest.length
                ),
               
                const Text("حجزات لم يتم الموافقة عليها ", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,),textAlign: TextAlign.right,textDirection: TextDirection.rtl,),
                  ListView.separated(
                  itemBuilder: (BuildContext context,index){
                    return  cubit.unconfirmedRequest.isNotEmpty ? ApprovedCard(onTap: (){
                      cubit.getRequestDetails(rNumber:  cubit.unconfirmedRequest[index].rNumber.toString() , roId:cubit.unconfirmedRequest[index].rOID.toString() );
                      Navigator.of(context).pushReplacementNamed("RequestDetails");
                    },
                    model: cubit.unconfirmedRequest[index], 
                    ):   Center(child: Lottie.asset(AppImageAsset.roomLottie));
                  },
                    separatorBuilder:  (context, index) {
                    return const SizedBox(height: 15,);
                  },
                  shrinkWrap: true,
                  physics:  const ScrollPhysics(),
                      itemCount: cubit.unconfirmedRequest.length
                ),
               
                ],),
              ),
            );
          },)
    );
  }
}