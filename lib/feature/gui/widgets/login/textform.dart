



import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';

class TextFormEmail extends StatelessWidget {
final String? Function(String?) valid ; 
   final TextEditingController controller ;
  const TextFormEmail({super.key, required this.controller, required this.valid});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30 ,left: 30),
      child: TextFormField(
         validator: valid,
            keyboardType: TextInputType.emailAddress,
        controller: controller ,
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          contentPadding:const EdgeInsets.only(top: 2 ,bottom: 2, right: 7,left: 7) ,
                          suffixIcon: const Icon(Icons.email),
                          suffixIconColor: AppColor.iconColor,
                            hintText: "البريد الاكتروني",hintTextDirection: TextDirection.rtl,
                            fillColor: AppColor.fillColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                            )),
                      ),
    );
  }
}