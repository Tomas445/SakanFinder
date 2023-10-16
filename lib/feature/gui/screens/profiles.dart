import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mano/core/constant/imageasset.dart';
import '../../../core/constant/color.dart';
import '../widgets/Profile/address.dart';
import '../widgets/Profile/email.dart';
import '../widgets/Profile/n_id.dart';
import '../widgets/Profile/phone.dart';
import '../widgets/Profile/profile_Gender.dart';
import '../widgets/Profile/profile_s_name.dart';
import '../widgets/Profile/reliativ_phone.dart';
import '../widgets/Profile/university.dart';
import 'cubits/home_cubit/home_cubit.dart';


// ignore: must_be_immutable
class Profiles extends StatelessWidget {
  Profiles({super.key});
  bool isLoading = false;
  bool isRead = true;


  GlobalKey<FormState> formState = GlobalKey();


  @override
  Widget build(BuildContext context) {
    var  editaddress;
    var editN_id;
    var editS_Name;
    var edit_Phone;
    var editS_Gender;
    var editS_University;
    var editS_BirthDate;
    var editS_ReliativPhone;

      final cubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      body: Form(
        key:formState ,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SafeArea(
            child: SingleChildScrollView(
              child: BlocConsumer<HomeCubit, HomeState>(
                listener: (context, state) {
                if(state is ProfileLoding){
                  isLoading = true;
                }
                if(state is ProfileSuccess){
                  isLoading = false;
                }else if(state is ProfileIsUpdate){
                  isRead = !isRead;
                }
                },
                builder:(context, state) {
                  return cubit.profile.isNotEmpty ?Column(
                  children: [
                    const Text(
                      "الملف الشخصي",
                      style: TextStyle(fontSize: 17),
                    ),
                    const SizedBox(
                          height: 70,
                        ),
                      Text(cubit.profile[0].sname!,style: const TextStyle(fontSize: 18),),
                        const SizedBox(height: 5,),
                        Text(cubit.profile[0].sEmail!,style: const TextStyle(fontSize: 13),),
                        const SizedBox(height: 15,),
                        TextFormS_name(initialValue: cubit.profile[0].sname!, isRead: isRead, onSaved: (value){
                          editS_Name - value;
                        }),
                          const SizedBox(height: 10,),
                        TextFormEmail(initialValue:cubit.profile[0].sEmail! ),
                          const SizedBox(height: 10,),
                        TextFormN_id(initialValue:cubit.profile[0].nId!,
                        onSaved: (value){
                          editN_id = value;
                        },
                        ),
                        const SizedBox(height: 10,),
                        TextFormAddress(initialValue: cubit.profile[0].address!.toString(), isRead: isRead, onSaved: (value){
                          editaddress = value;
                        }),
                          const SizedBox(height: 10,),
                        TextFormPhone(initialValue: cubit.profile[0].phone!, isRead: isRead, onSaved: (value){
                          edit_Phone = value;
                        }),
                        const SizedBox(height: 10,),
                        TextFormReliativPhone(initialValue: cubit.profile[0].reliativPhone!, isRead: isRead, onSaved: (value){
                          editS_ReliativPhone = value;
                        }),
                          const SizedBox(height: 10,),
                        TextFormUniversity(initialValue: cubit.profile[0].university!, isRead: isRead, onSaved: (value){
                          editS_University = value;
                        }),
                          const SizedBox(height: 10,),
                        TextFormGander(initialValue: cubit.profile[0].gander!, isRead: isRead, onSaved: (value){
                          editaddress = value;
                        }),
                          const SizedBox(height: 10,),
                        MaterialButton(
            onPressed: () {
            cubit.updateProfile();
            },
            color: AppColor.buttonColor,
            elevation: 7,
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 3),
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
            ),
            child: const Text(
          "update",
          style: TextStyle(
            fontFamily: 'SST Arabic',
            fontSize: 18,
            color: AppColor.white,
          ),
            ),
          ),
              Visibility(
          visible: !isRead,
          child: MaterialButton(
            onPressed: () {
              if(formState.currentState!.validate()){
                formState.currentState!.save();
              }
            },
            color: AppColor.buttonColor,
            elevation: 7,
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 3),
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
            ),
            child: const Text(
          "update",
          style: TextStyle(
            fontFamily: 'SST Arabic',
            fontSize: 18,
            color: AppColor.white,
          ),
            ),
          ),
              ),
                  ],
                ) : Center(child: Lottie.asset(AppImageAsset.profileLottie));
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
