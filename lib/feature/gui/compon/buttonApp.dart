import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';

class ButtonApp extends StatelessWidget {
  const ButtonApp({super.key, required this.name,required this.onPressed});
  final String name;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
              onPressed: onPressed
              ,
    color: AppColor.buttonColor,
    elevation: 7,
    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 3),

    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)) ,
              child:  Text("$name ",
    style: const TextStyle(
      fontFamily: 'SST Arabic',
      fontSize: 18,
      color: AppColor.white,
    ),
  ),
);
  }
}