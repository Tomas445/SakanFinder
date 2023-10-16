
import 'package:flutter/material.dart';
import 'package:mano/core/constant/color.dart';

import '../../../../core/constant/imageasset.dart';

class FacebookButton extends StatelessWidget {
  const FacebookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
       color: AppColor.facebookColor,
     elevation: 7,
     padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 3),
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)) ,
              onPressed: (){
               Navigator.of(context).pushReplacementNamed("Home") ;
              },
              child: Row(
                mainAxisSize:MainAxisSize.min ,
                children:  [
                Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: Image.asset(AppImageAsset.facebook),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 14),
                  child: Text("الدخول عن طريق فيسبوك",
                  style: TextStyle(
                      fontFamily: 'SST Arabic',
                      fontSize: 12,
                      color: AppColor.white,
                  )
                  ),
                ),
              ]),
    
);
  }
}