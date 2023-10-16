import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../compon/favoriteIsCard.dart';
import '../compon/favouritesemoty.dart';
import 'cubits/home_cubit/home_cubit.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
  final cubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            return  cubit.favourites.isNotEmpty ? SingleChildScrollView(child: Column(children: [
        ListView.separated(
              itemBuilder: (BuildContext context,index){
                return FavoriteIsCard(onTap: (){},
                model: cubit.favourites[index], 
                onPressedFavoriteremove: (){
                  cubit.addorRemovefavourites(aId: cubit.favourites[index].aID.toString());
                });
              },
                separatorBuilder:  (context, index) {
                return const SizedBox(height: 15,);
              },
              shrinkWrap: true,
              physics:  const ScrollPhysics(),
                  itemCount: cubit.favourites.length
            )
      ],),
      ):const FavoriteIsEmpty();
  })
      );
}
}