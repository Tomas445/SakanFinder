
import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';
import '../../../../functions/validinput.dart';




// ignore: camel_case_types
class TextFormS_name extends StatelessWidget {

 final String initialValue;
 final void Function(String?)? onSaved;
  final bool isRead;
   const TextFormS_name({super.key, required this.initialValue,required this.onSaved, required this.isRead, });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.phone,
        validator: (val) {
                return validInput(val!, 4,50);
        },
        onSaved: onSaved,
              readOnly: isRead ,
        initialValue: initialValue,
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          contentPadding:const EdgeInsets.only(top: 2 ,bottom: 2, right: 7,left: 7) ,
                            fillColor: AppColor.fillColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                            )),
                      );
  }
}