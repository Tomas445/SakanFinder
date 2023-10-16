import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/color.dart';
import '../../screens/cubits/register_cubit/register_cubit.dart';

class Check extends StatelessWidget {
    Check({super.key});
      bool _usa = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
      if(state is CheckBox){
            _usa = !_usa; 
      }
      },
      builder: (context, state) {
        return  Row(
                children: [
                  Checkbox(
                    value: _usa,
                    onChanged: (val) {
                    BlocProvider.of<RegisterCubit>(context).check();
                    },
                    activeColor: AppColor.primaryColor,
                    side: const BorderSide(
                        color: AppColor.primaryColor, width: 2.5),
                  ),
                  const Text("أوافق علي شروط الخصوصية")
                ],
              );
      },
    );
  }
}