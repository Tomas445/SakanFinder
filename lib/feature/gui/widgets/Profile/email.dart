
import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';



class TextFormEmail extends StatelessWidget {
 final String initialValue;
   const TextFormEmail({super.key, required this.initialValue});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
              readOnly: true,
        initialValue: initialValue,
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          contentPadding:const EdgeInsets.only(top: 2 ,bottom: 2, right: 7,left: 7) ,
                          suffixIcon: const Icon(Icons.email),
                          suffixIconColor: AppColor.iconColor,
                          
                          
                            fillColor: AppColor.fillColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                            )),
                      );
  }
}