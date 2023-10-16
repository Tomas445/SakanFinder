import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/color.dart';
import '../../screens/cubits/register_cubit/register_cubit.dart';


class Password extends StatelessWidget {
final String? Function(String?) valid ; 
   final TextEditingController controller ;
  const Password({super.key, required this.controller, required this.valid});

  @override
  Widget build(BuildContext context) {
    bool _passwordIsVisible = true;
    return Padding(
      padding:  const EdgeInsets.only(right: 30 ,left: 30),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
      if(state is ShowOrHidePassword){
            _passwordIsVisible = !_passwordIsVisible;
          }
        },
        builder: (context, state) {
          return  TextFormField(
            obscureText: _passwordIsVisible,
           validator: valid,
          controller: controller ,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            contentPadding:const EdgeInsets.only(top: 2 ,bottom: 2, right: 7,left: 7) ,
                            suffixIcon: const Icon(Icons.lock),
                            suffixIconColor: AppColor.iconColor,
                            prefixIconColor: AppColor.iconColor,
                            prefixIcon: IconButton(
                            icon:Icon( !_passwordIsVisible ? Icons.visibility_off : Icons.remove_red_eye ),
                              onPressed: (){
                                BlocProvider.of<RegisterCubit>(context).showOrHidePass();
                              }),
                              hintText: "ادخل كلمة المرور",hintTextDirection: TextDirection.rtl,
                              fillColor:  AppColor.fillColor,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                              )),
                        );
  }));
  }
}