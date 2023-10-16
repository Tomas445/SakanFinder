// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mano/feature/gui/screens/splash.dart';
import 'package:mano/feature/gui/screens/cubits/register_cubit/register_cubit.dart';
import 'package:mano/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'feature/gui/screens/cubits/home_cubit/home_cubit.dart';
import 'feature/gui/screens/cubits/login_cubit/login_cubit.dart';



late SharedPreferences sharedPref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
     providers: [
      BlocProvider(create: (context) => RegisterCubit()),
      BlocProvider(create: (context) => LoginCubit()),
      BlocProvider(create: (context) => HomeCubit()..getApartment()..getfavourites()),


      
       
     ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: Splash(),
        routes: routes,
      ),
    );
  }
}
