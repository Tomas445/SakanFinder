import 'package:flutter/material.dart';

class CustomTextFormSign extends StatelessWidget {
  final String label;

 final String? Function(String?)valid;
  final TextEditingController controller;
  const CustomTextFormSign({Key? key, required this.label, required this.controller, required this.valid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
      validator:valid ,
    controller: controller,
        decoration:  InputDecoration(
          contentPadding:  const EdgeInsets.symmetric(vertical:8,horizontal:15 ),
          labelText: label,
          border: const OutlineInputBorder(
    
            borderSide: BorderSide(color: Colors.black, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(15))
          )
        ),
      ),
    );
  }
}