import 'package:flutter/material.dart';
import 'package:mano/main.dart';

class HeaderHomeScreen extends StatelessWidget {
  const HeaderHomeScreen({super.key, required this.onPressed});
final  void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    
    return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 1,
                    child: IconButton(
                        onPressed: onPressed,
                        icon: const Icon(
                          Icons.notifications_active_rounded,
                          color: Colors.black,
                        )),
                  ),
                   Expanded(
                      flex: 2,
                      child: Text(
                        'Welcome ${sharedPref.getString("sname")}',
                        textAlign: TextAlign.center,
                      )),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.account_circle_rounded,
                          color: Colors.black,
                        )),
                  )
                ],
              );
  }
}