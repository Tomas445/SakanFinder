import 'package:flutter/material.dart';

import 'package:mano/feature/gui/screens/forgetpass1.dart';
import 'package:mano/feature/gui/screens/forgotpass2.dart';
import 'package:mano/feature/gui/screens/forgotpass3.dart';
import 'package:mano/feature/gui/screens/layoutScreen.dart';
import 'package:mano/feature/gui/screens/request.dart';

import 'feature/gui/screens/apartment.dart';
import 'feature/gui/screens/home.dart';
import 'feature/gui/screens/login.dart';
import 'feature/gui/screens/register.dart';

import 'feature/gui/screens/requestData.dart';
import 'onboarding/onboarding_widget.dart';

Map<String, Widget Function(BuildContext)> routes = {
  "Login": (context) =>  Login(),
  // ignore: prefer_const_constructors
  "LayoutScreen": (context) =>  LayoutScreen(),
  "Home": (context) =>  HomeScreen(),
  "request": (context) => const Request(),
  "Apartment": (context) =>  const Apartment(),
  "ForgetPassOne": (context) => const ForgetPassOne(),
  "ForgetPassTwo": (context) => const ForgetPassTwo(),
  "ForgetPassThree": (context) => const ForgetPassThree(),
  "OnboardingScreen": (context) => const OnboardingScreen(),
  "Register": (context) =>  Register(),
  "RequestDetails": (context) =>  const RequestData(),
};
