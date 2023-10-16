
import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';
import '../../../../functions/validinput.dart';



class TextFormN_id extends StatelessWidget {

 final String initialValue;
 final void Function(String?)? onSaved;
    const TextFormN_id({super.key, required this.initialValue, this.onSaved, });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.phone,
        validator: (val) {
                return validInput(val!, 14,14);
        },
        onSaved: onSaved,
              readOnly: true ,
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