

import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("Login") ;
                },
                child: const Text(
                  "عد الي شاشة تسجيل الدخول",
                  style:  TextStyle(color: AppColor.primaryColor,fontSize: 16),
                ));
  }
}