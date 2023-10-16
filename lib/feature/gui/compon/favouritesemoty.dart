import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mano/core/constant/imageasset.dart';

class FavoriteIsEmpty extends StatelessWidget {
  const FavoriteIsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:25,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
         // const SizedBox(height: 150,),
          Center(child: Lottie.asset(AppImageAsset.favouriteLottie)),
          const Text("لا يوجد شقق بالمفضلة" , style: TextStyle(fontSize: 22 , fontWeight: FontWeight.bold),)
        ]),
      ),


);
}
}