import 'package:flutter/material.dart';
import 'package:mano/core/constant/imageasset.dart';
import 'package:mano/feature/gui/widgets/ForgetPassword/forgetPassOne/rowheader1.dart';
import 'package:mano/feature/gui/widgets/ForgetPassword/forgetPassOne/textone.dart';
import 'package:mano/feature/gui/widgets/ForgetPassword/forgetPassOne/otexttwo4.dart';
import 'package:mano/feature/gui/widgets/ForgetPassword/forgetPassOne/textform3.dart';
import 'package:mano/feature/gui/widgets/ForgetPassword/forgetPassOne/textbutton5.dart';
import 'package:mano/feature/gui/widgets/ForgetPassword/forgetPassOne/sendbutton.dart';

class ForgetPassOne extends StatelessWidget {
  const ForgetPassOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:const EdgeInsets.only(top: 40,right: 10,left: 10),
        child: SingleChildScrollView(child: Column(children: [
           const RowHeaderOne(),
          const SizedBox(height: 60,),
          Image.asset(AppImageAsset.forgetPasswordOne),
          const TextOne(),
          const TextTwo(),
          const SizedBox(height: 35,),
          const TextFormOne(),
          const TextButtonOne(),
          const SizedBox(height: 10,),
          const SendButtonOne(),
          ]) ,),
      )
      );
  }
}