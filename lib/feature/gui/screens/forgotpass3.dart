import 'package:flutter/material.dart';
import 'package:mano/feature/gui/widgets/ForgetPassword/forgotPassThree/textone.dart';
import 'package:mano/feature/gui/widgets/ForgetPassword/forgotPassThree/textform2.dart';
import 'package:mano/feature/gui/widgets/ForgetPassword/forgotPassThree/textform.dart';
import 'package:mano/feature/gui/widgets/ForgetPassword/forgotPassThree/sendsutton.dart';

import '../../../core/constant/imageasset.dart';


class ForgetPassThree extends StatelessWidget {
  const ForgetPassThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(child: Padding(
        padding:  const EdgeInsets.only(top: 40,right: 10,left: 10),
        child: Column(children: [
          const TextThree(),
          const SizedBox(height: 60,),
          Image.asset(AppImageAsset.forgetPasswordThree),
          const SizedBox(height: 35,),
          const TextFormOneThree(),
          const SizedBox(height: 15,),
          const TextFormTwoThree(),
          const SizedBox(height: 35,),
          const SendButtonThree(),
          ]),
      ) ,)
      );
  }
}