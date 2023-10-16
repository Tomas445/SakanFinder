import 'package:flutter/material.dart';


class birthdate extends StatelessWidget {
  final TextEditingController mycontroller ;
  const birthdate({super.key, required this.mycontroller, });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30 ,left: 30),
      child: TextFormField(
                  controller: mycontroller,
                  keyboardType: TextInputType.text,
                  readOnly: true,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'must not be empty';
                    }
                    return null;
                  },
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now())
                        .then((value) {
                      if (value != null) {
                        mycontroller.text =
                            '${value.year}-${value.month}-${value.day}';
                      }
                    });
                  },
                  decoration: InputDecoration(
                    labelText: ("B-Date"),
                    labelStyle: const TextStyle(color: Colors.orange),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.orange)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.red)),
                    prefixIcon:
                        const Icon(Icons.calendar_today, color: Colors.orange),
                  ),
                ),
    );
  }
}