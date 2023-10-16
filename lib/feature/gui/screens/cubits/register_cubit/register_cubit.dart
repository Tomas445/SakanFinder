import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


import '../../../../../core/constant/linkapi.dart';
import '../../../compon/crud.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {

  RegisterCubit() : super(RegisterInitial());
  final Crud _crud = Crud();

void chackUserName(String  cUserName ) async {
emit(RegisterLoading());
try{var response =  await _crud.postRequest(linkerifyUsername, {
  "S_email" : cUserName,

});
  if(response['status'] == "used"){
emit(RegisterVerifyUserName());
}
} catch(e){
 
    emit(RegisterFailure());
  
}
}
  signUp({required String  cUserName ,required String cSname,required String cBirthdate ,required String cPhone,required String cAddress,required String cGander,required String cUniversity,required String cnId ,required String cReliativPhone ,required String cPassword}) async {
  emit(RegisterLoading());
try{var response =  await _crud.postRequest(linkSignUp, {
  "S_email" : cUserName,
  "sname" : cSname,
  "birthdate" : cBirthdate,
  "phone" : cPhone,
  "address" : cAddress,
  "gander" : cGander,
  "university" : cUniversity,
  "n_id" : cnId,
  "reliativ_phone" : cReliativPhone,
  "password" : cPassword,
});
if(response['status'] == "used"){
emit(RegisterVerifyUserName());
}else if(response['status'] == "add"){
  emit(RegisterSuccess());
}else if(response['status'] == "fail"){
  emit(RegisterFailure());
}
} catch(e){

    emit(RegisterFailure());
  
}
}
void showOrHidePass(){
  emit(ShowOrHidePassword());
}

void check(){
  emit(CheckBox());
}

}

