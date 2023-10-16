import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mano/core/constant/color.dart';
import 'package:mano/feature/gui/screens/cubits/login_cubit/login_cubit.dart';
import 'package:mano/feature/gui/widgets/login/textform.dart';
import 'package:mano/feature/gui/widgets/login/textformtwo.dart';
import '../../../core/constant/imageasset.dart';
import '../../../functions/validinput.dart';

import '../widgets/login/row.dart';
import '../widgets/login/facebookbutton.dart';
import '../widgets/login/googlebutton.dart';

class Login extends StatelessWidget {
  Login({super.key});
bool isLoading = false ;
GlobalKey<FormState> formState = GlobalKey() ;
  final TextEditingController userName  = TextEditingController();
  final TextEditingController _password  = TextEditingController();

  @override
  Widget build(BuildContext context) {
  //  final cubit = BlocProvider.of<HomeCubit>(context);
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is LoginLoading){
            isLoading = true ;
          }else if(state is LoginSuccess){
            Navigator.of(context).pushReplacementNamed("LayoutScreen");
            isLoading = false ;
          }else if(state is EPassword){
            AwesomeDialog(
      context: context ,
    title: "تنبيه", body: const Text("كلمة المرور خطا برجاء اعادة المحاولة")).show();
      isLoading = false ;
          }else if(state is LoginVerifyUsername){
            AwesomeDialog(
      context: context ,
    title: "تنبيه", body: const Text("هذا الحساب غير صالح")).show();
    isLoading = false ;
          }
      },
        child: isLoading == true ?  Center(child: Lottie.asset(AppImageAsset.loadingLottie),) :Scaffold(
          body: Form(
            key:formState ,
            child: Padding(
                padding: const EdgeInsets.only(top: 40, right: 10, left: 10),
                child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 40,
              ),
              Lottie.asset(
                AppImageAsset.loginLottie,height: 250,
                
              ),
              const SizedBox(height: 10),
              TextFormEmail(controller: userName ,
              valid: (val) {
              return validInput(val!, 5, 50);
              },
              ),
              const SizedBox(height: 10),
              TextFormPass(controller: _password,
              valid: (val) {
              return validInput(val!, 5, 50);   
              },
              ),
              const SizedBox(height: 10),
              LoginCheck(),
              MaterialButton(
                  onPressed: ()async {
                      if(formState.currentState!.validate()){
                        BlocProvider.of<LoginCubit>(context).login(userName.text, _password.text);
                //        cubit.bottomNavIndex =2;
                      }
            },
              color: AppColor.buttonColor,
              elevation: 7,
              padding: const EdgeInsets.symmetric(horizontal: 70,vertical: 3),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)) ,
                child: const Text("تسجيل الدخول",
              style: TextStyle(
                fontFamily: 'SST Arabic',
                fontSize: 18,
                color: AppColor.white,
              ),
            ),
          ),
              const FacebookButton(),
              const GoogleButton(),
              const SizedBox(height: 10),
              TextButton(
                  onPressed: () {
                  Navigator.of(context).pushReplacementNamed("Register") ;
                  },
                  child: const Text(
                    "أنشاء حساب جدبد",
                    style:  TextStyle(color: AppColor.buttonColor),
                  ))
            ]),
                ),
              ),
          )));
  }
}