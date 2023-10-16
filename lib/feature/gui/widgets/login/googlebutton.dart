
import 'package:flutter/material.dart';
import 'package:mano/core/constant/color.dart';


import '../../../../core/constant/imageasset.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).pushReplacementNamed("Home") ;
      },
      color: AppColor.white,
      elevation: 7,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Padding(
          padding: const EdgeInsets.only(right: 14),
          child: Image.asset(AppImageAsset.google),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 14),
          child: Text("الدخول عن طريق جوجل",
              style: TextStyle(
                fontFamily: 'SST Arabic',
                fontSize: 12,
                color: AppColor.black,
              )),
        ),
      ]),
    );
  }
}
