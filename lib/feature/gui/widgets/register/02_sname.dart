import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';
import '../../../../functions/validinput.dart';

class sname extends StatelessWidget {
  final TextEditingController controller ;
  final void Function()? onTap;
  const sname({super.key, required this.controller, this.onTap,});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30 ,left: 30),
      child: TextFormField(
        onTap: onTap,
        validator: (val) {
                return validInput(val!, 5, 50);
              },
        keyboardType: TextInputType.name,
         controller: controller ,

        cursorColor: AppColor.iconColor,
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          contentPadding:const EdgeInsets.symmetric(vertical: 5 , horizontal: 25) ,
                          suffixIcon: const Icon(Icons.account_circle_rounded,),
                          suffixIconColor: AppColor.iconColor,
                            label: const Text("sname",textDirection: TextDirection.rtl,),
                            fillColor: AppColor.fillColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                            )),
                      ),
    );
  }
}