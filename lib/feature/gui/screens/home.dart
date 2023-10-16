// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mano/core/constant/imageasset.dart';
import 'package:mano/feature/gui/widgets/home/headerHome.dart';
import 'package:mano/feature/gui/widgets/home/searchHome.dart';
import 'package:mano/feature/gui/widgets/home/text.dart';
import '../compon/cardapartment.dart';
import 'cubits/home_cubit/home_cubit.dart';
class HomeScreen extends StatelessWidget {
bool isLoading = false ;
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return
    Scaffold(
      
      backgroundColor: Colors.white,
      body: SingleChildScrollView(child: SafeArea(
        child: Padding(
          padding:  const EdgeInsets.only(right: 10, left: 10, top: 15),
            child: Column(
              children:  [
                HeaderHomeScreen(onPressed: (){
                }),
                const SizedBox(
                  height: 26,
                ),
                  SearchFilterForm(
                  onChanged: (input){
                    cubit.getSearchData(input: input);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              const SizedBox(height: 30,width: 30,),
              const TextHome(),
            BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
    if(state is ApartmentLoading){
            isLoading = true ;
          }
  },
    builder: (context, state) {

    return cubit.allApartments.isNotEmpty?
    ListView.separated(
      separatorBuilder: (context, index) {
        return const SizedBox(height: 15,);
      },
      shrinkWrap: true,
      physics:  const ScrollPhysics(),
      itemCount: cubit.allApartmentsSearch.isEmpty ?
      cubit.allApartments.length :
      cubit.allApartmentsSearch.length,
      itemBuilder: (BuildContext context,index) {
        return CardApartment( model: cubit.allApartmentsSearch.isEmpty ? 
        cubit.allApartments[index] : 
        cubit.allApartmentsSearch[index],
        cubit: cubit,
        onTap: ()async{
       //await cubit.apartmentDetails(cubit.allApartments[index].aID.toString());
       await cubit.apartmentDetails( cubit.allApartmentsSearch.isEmpty ? 
        cubit.allApartments[index].aID.toString() : 
        cubit.allApartmentsSearch[index].aID.toString(),);
        cubit.allApartmentsSearch.clear();
        Navigator.of(context).pushNamed("Apartment");
        });
      },
    ): Center(child: LottieBuilder.asset(AppImageAsset.apartmentLottie));
                  }
                ),
              ],
            ),
        ),
      ),)
    );
  }
}