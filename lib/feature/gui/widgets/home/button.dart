import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';

class ApartmentButton extends StatelessWidget {
  const ApartmentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
              onPressed: (){
               Navigator.of(context).pushReplacementNamed("Apartment") ;
              },
     color: AppColor.buttonColor,
     elevation: 7,
     padding: const EdgeInsets.symmetric(horizontal: 70,vertical: 3),

     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)) ,
              child: const Text("Apartment",
    style: TextStyle(
      fontFamily: 'SST Arabic',
      fontSize: 18,
      color: AppColor.white,
    ),
  ),
);
  }
}