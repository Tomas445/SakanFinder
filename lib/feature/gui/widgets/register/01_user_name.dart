import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';
import '../../../../functions/validinput.dart';
class user_name extends StatelessWidget {
 final Function()? onEditingComplete ;
  final TextEditingController controller ;
  const user_name({super.key, required this.controller, this.onEditingComplete});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30 ,left: 30),
      child: TextFormField(
        
        onEditingComplete:onEditingComplete,
        validator: (val) {
                return validInput(val!, 5, 50);
              },
                      keyboardType: TextInputType.emailAddress,
                    controller: controller ,
                       cursorColor: AppColor.iconColor,
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          contentPadding:const EdgeInsets.only(top: 2 ,bottom: 2, right: 7,left: 7) ,
                          suffixIcon: const Icon(Icons.account_circle_rounded,),
                          suffixIconColor: AppColor.iconColor,
                            label: const Text("email",textDirection: TextDirection.rtl,),
                            fillColor: AppColor.fillColor,
                            filled: true,
                            border: OutlineInputBorder(
                              
                              borderRadius: BorderRadius.circular(28),
                            )
                            ),
                      ),
    );
  }
}