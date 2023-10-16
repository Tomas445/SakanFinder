import 'package:flutter/material.dart';

class TextFormOneThree extends StatelessWidget {
  const TextFormOneThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30 ,left: 30),
      child: TextFormField(
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                            hintText: "كلمة السر الجديدة ",hintTextDirection: TextDirection.rtl,
                            fillColor: const Color(0xffF2F2F2),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                            )),
                      ),
    );
  }
}