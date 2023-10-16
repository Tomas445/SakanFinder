
import 'package:flutter/material.dart';
import 'package:mano/core/constant/color.dart';
class SendButtonOne extends StatelessWidget {
  const SendButtonOne({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
              onPressed: (){
              Navigator.of(context).pushReplacementNamed("ForgetPassTwo") ;
              },
              
     color: AppColor.buttonColor,
     elevation: 5,
     padding: const EdgeInsets.symmetric(horizontal: 90,vertical: 5),
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)) ,
     child:  const Text("ارسل",
    style: TextStyle(
      fontFamily: 'SST Arabic',
      fontSize: 18,
      color: AppColor.white,
    ),
  ),
);
  }
}