import 'package:flutter/material.dart';

class SearchFilterForm extends StatelessWidget {
  final void Function(String)? onChanged ;
   const SearchFilterForm({super.key,required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged ,
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        contentPadding:const EdgeInsets.only(top: 0,bottom: 0, right: 5,left: 5) ,
          prefixIcon: const Icon(Icons.search),
          hintText: '...بحث',
          fillColor: const Color(0xffF2F2F2),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
          )),
    );
  }
}