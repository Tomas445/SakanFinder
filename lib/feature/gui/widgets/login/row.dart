
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/color.dart';
import '../../screens/cubits/login_cubit/login_cubit.dart';

class LoginCheck extends StatelessWidget {
  
   LoginCheck({super.key});
      bool _usa =false ;
  @override
  Widget build(BuildContext context) {
   return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
      if(state is LoginCheckBox){
           _usa = !_usa; 
       }else if(state is LoginChNot){
        _usa = true;
       }
      },
      builder: (context, state) {
        return  Row(
                children: [
                  Checkbox(
                    value: _usa,
                    onChanged: (val) {
                    
                     BlocProvider.of<LoginCubit>(context).check();
                    
                    },
                    activeColor: AppColor.primaryColor,
                    side: const BorderSide(
                        color: AppColor.primaryColor, width: 2.5),
                  ),
                 const Text("تذكرني")
                ],
              );
      },
    );
  }
}