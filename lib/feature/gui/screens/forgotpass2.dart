import 'package:flutter/material.dart';
import 'package:mano/core/constant/imageasset.dart';
import 'package:mano/feature/gui/widgets/ForgetPassword/forgotPassTwo/rowheader.dart';
import 'package:mano/feature/gui/widgets/ForgetPassword/forgotPassTwo/textform.dart';
import 'package:mano/feature/gui/widgets/ForgetPassword/forgotPassTwo/sendbutton.dart';

class ForgetPassTwo extends StatelessWidget {
  const ForgetPassTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40,right: 10,left: 10),
        child: SingleChildScrollView(child: Column(children: [
           const RowHeaderTwo(),
          const SizedBox(height: 60,),
          Image.asset(AppImageAsset.forgetPasswordTwo),
          const SizedBox(height: 35,),
          const TextFormTwo(),
          const SizedBox(height: 35,),
          const SendButtonTwo(),
          ]) ,),
      )
      );
  }
}