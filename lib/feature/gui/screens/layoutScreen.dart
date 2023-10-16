import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mano/feature/gui/screens/cubits/home_cubit/home_cubit.dart';

import '../../../core/constant/color.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context , state){}, 
      builder:(context , state){
        return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: cubit.bottomNavIndex,
        color: AppColor.buttonColor,
        backgroundColor: Colors.white,
        height: 65,
        animationDuration: const Duration(
          milliseconds: 200,
        ),
        items: const [
          Icon(Icons.settings, color: Colors.white,),
          Icon(Icons.favorite, color: Colors.white),
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.bed, color: Colors.white),
          Icon(Icons.person, color: Colors.white),
        ],
        onTap: (index)async{
          cubit.changeBottomNavIndex(index: index);
          if(index == 1){
          cubit.getfavourites();
          }else if(index == 2){
            cubit.getApartment();
          }else if(index == 3){
             await cubit.requestApproved();
             cubit.requestUnconfirmed();
             cubit.requestFinish();
           // cubit.requestUnconfirmed();
          }else if(index == 4){
          cubit.getProfile();
          }
        },
        ),
        body: cubit.layoutScreens[cubit.bottomNavIndex],
    );
      } );
  }
}