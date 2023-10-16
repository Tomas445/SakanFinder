import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mano/feature/gui/screens/cubits/register_cubit/register_cubit.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
import '../../../functions/validinput.dart';
import '../widgets/register/01_user_name.dart';
import '../widgets/register/02_sname.dart';
import '../widgets/register/04_phone.dart';
import '../widgets/register/05_address.dart';
import '../widgets/register/university.dart';
import '../widgets/register/nid.dart';
import '../widgets/register/reliativphone.dart';
import '../widgets/register/password.dart';
import '../widgets/register/check.dart';
import '../widgets/register/loginbutton.dart';

class Register extends StatelessWidget {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
 // GlobalKey<FormState> formState = GlobalKey();
  final TextEditingController userName = TextEditingController();
  final TextEditingController _sname = TextEditingController();
  final TextEditingController _birthdate = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _university = TextEditingController();
  final TextEditingController nid = TextEditingController();
  final TextEditingController reliativphone = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool isLoading = false;
 final List<String> genderList = ["Male", "Female"];
  String? gender;
  Register({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit,RegisterState >(
      listener: (context, state) {
          if(state is RegisterLoading){
            isLoading = true ;
          }else if(state is RegisterVerifyUserName){
        AwesomeDialog(
      context: context ,
    title: "تنبيه", body: const Text("هذا الحساب موجود بالفعل")).show();
    isLoading = false ;
}
      else if(state is RegisterSuccess){
        AwesomeDialog(
      context: context ,
    title: "تنبيه", body: const Text("تم انشاء الحساب بنجاح")).show();
        Navigator.of(context).pushReplacementNamed("Login");
          isLoading = false ;
      }
      else if(state is RegisterVerifyUserNameIsNull){
        AwesomeDialog(
      context: context ,
      title: "تنبيه", body: const Text("لا يمكنك ادخال قيمة فارغة")).show();
      isLoading = false ;
      }else if(state is RegisterFailure){
        AwesomeDialog(
      context: context ,
    title: "تنبيه", body: const Text("حدث خطا ما")).show();
    isLoading = false ;
      }
      else if(state is ConnectionTimedOut){
        AwesomeDialog(
      context: context ,
    title: "تنبيه", body: const Text("لا يوجد اتصال بقاعدة البيانات")).show();
    isLoading = false ;
      }
      },
      child: isLoading == true ? const Center(child: CircularProgressIndicator(),) : Scaffold(
          body: SingleChildScrollView(
        child: Form(
          key: formState,
          child: Column(children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              AppImageAsset.login,
              color: AppColor.primaryColor,
            ),
            const SizedBox(
              height: 20,
            ),
            //1 user_name
            user_name(
              onEditingComplete: () {
                  BlocProvider.of<RegisterCubit>(context).chackUserName(userName.text) ;
              },
              controller: userName,
            ),
            const SizedBox(
              height: 15,
            ),
            //2  sname
            sname(
              onTap: (){
                  BlocProvider.of<RegisterCubit>(context).chackUserName(userName.text) ;
              },
              controller: _sname,
            ),
            const SizedBox(
              height: 15,
            ),
            //3  birthdate
            Padding(
              padding: const EdgeInsets.only(right: 30 ,left: 30),
              child: TextFormField(
                    controller: _birthdate,
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
                          _birthdate.text =
                              '${value.year}-${value.month}-${value.day}';
                        }
                      });
                    },
                    decoration: InputDecoration(
                      fillColor: AppColor.fillColor,
                          contentPadding:const EdgeInsets.only(top: 2 ,bottom: 2, right: 7,left: 7) ,
                      labelText: ("B-Date"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: const BorderSide(color: Colors.orange)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: const BorderSide(color: Colors.red)),
                      prefixIcon:
                          const Icon(Icons.calendar_today, color:AppColor.iconColor,),
                    ),
                  ),
            ),
            const SizedBox(
              height: 15,
            ),
            //4 phone
            phone(
              controller: _phone,
            ),
            const SizedBox(
              height: 15,
            ),
            //5 address
            address(
              controller: _address,
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(height: 15),
            //7  university
            University(
              controller:  _university,
            ),
            const SizedBox(
              height: 15,
            ),
            //8 n_id
            NId(
              controller: nid),
            const SizedBox(
              height: 15,
            ),
            //9 reliativ_phone
            ReliativPhone(
              controller: reliativphone),
            const SizedBox(
              height: 15,
            ),
            //10 password
            Password(
              controller: _password,
              valid: (val) {
                return validInput(val!, 5, 30);
              },
            ),
          DropdownButtonFormField(
                          items: [
                            ...genderList.map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ),
                            )
                          ],
                          value: gender,
                          onChanged: (value) {
                              gender = value;
                          },
                          decoration: InputDecoration(
                            labelText: ("Select Gender"),
                            labelStyle: const TextStyle(
                              color: Colors.orange,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    const BorderSide(color: Colors.orange)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    const BorderSide(color: Colors.red)),
                            prefixIcon:
                                const Icon(Icons.male, color: Colors.orange),
                          ),
                          validator: (value) {
                            if (value == null) {
                              return 'Please select your gender';
                            }
                            return null;
                          },
                        ),
          //  Gender(),
            Check(),
            MaterialButton(
              onPressed: () async{
                if(formState.currentState!.validate()){
                BlocProvider.of<RegisterCubit>(context).signUp(cUserName: userName.text , cSname: _sname.text, cBirthdate: _birthdate.text, cPhone: _phone.text, cAddress: _address.text, cGander: gender!, cUniversity: _university.text, cnId: nid.text, cReliativPhone: reliativphone.text, cPassword: _password.text) ;
                }
              },
              color: AppColor.buttonColor,
              elevation: 7,
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 3),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)),
              child: const Text(
                "تسجيل ",
                style: TextStyle(
                  fontFamily: 'SST Arabic',
                  fontSize: 18,
                  color: AppColor.white,
                ),
              ),
            ),
            const SizedBox(height: 20,),
            const LoginButton()
          ]),
        ),
      )),
    );
  }
}
