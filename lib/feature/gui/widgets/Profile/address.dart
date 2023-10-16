
import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';
import '../../../../functions/validinput.dart';



class TextFormAddress extends StatelessWidget {

 final String initialValue;
 final bool isRead;
 final void Function(String?)? onSaved;
   const TextFormAddress({super.key, required this.initialValue, required this.isRead, required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.streetAddress,
        validator:  (val) {
                return validInput(val!, 5, 50);
        },
        onSaved: onSaved ,
        
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