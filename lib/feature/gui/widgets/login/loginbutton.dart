
import 'package:flutter/material.dart';
import 'package:mano/core/constant/color.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
              onPressed: (){
               Navigator.of(context).pushReplacementNamed("Home") ;
              },
             
     color: AppColor.buttonColor,
     elevation: 7,
     padding: const EdgeInsets.symmetric(horizontal: 70,vertical: 3),

     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)) ,
      child: const Text("تسجيل الدخول",
    style: TextStyle(
      fontFamily: 'SST Arabic',
      fontSize: 18,
      color: AppColor.white,
    ),
  ),
);
  }
}