import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';
import '../../../../functions/validinput.dart';

class ReliativPhone extends StatelessWidget {
  final TextEditingController controller ;
  const ReliativPhone({super.key, required this.controller,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30 ,left: 30),
      child: TextFormField(
        validator: (val) {
                return validInput(val!, 11, 11);
              },
                      keyboardType: TextInputType.phone,
                      controller: controller ,
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          contentPadding:const EdgeInsets.only(top: 2 ,bottom: 2, right: 7,left: 7) ,
                          suffixIcon: const Icon(Icons.generating_tokens_outlined,),
                          suffixIconColor: AppColor.iconColor,
                            label: const Text("reliativ_phone",textDirection: TextDirection.rtl,),
                            fillColor: AppColor.fillColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                            )),
                      ),
    );
  }
}