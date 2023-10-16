import 'package:flutter/material.dart';
import 'package:mano/core/constant/color.dart';

class RowHeaderOne extends StatelessWidget {
  const RowHeaderOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
             
            },
            icon: const Icon(
              Icons.help_outline,
              color: AppColor.primaryColor,
            )),
        const Text(
          'اعادة تعيين كلمة المرور',
          style: TextStyle(
            fontFamily: 'SST Arabic',
            fontSize: 16,
            color: Color(0xff000000),
            fontWeight: FontWeight.w500,
            height: 1.875,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.right,
          softWrap: false,
        ),
        IconButton(
            onPressed: () {
                Navigator.of(context).pushReplacementNamed("Login"); 
            },
            icon: const Icon(Icons.arrow_back_rounded,
                color: AppColor.primaryColor))
      ],
    );
  }
}
