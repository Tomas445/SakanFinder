import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/constant/linkapi.dart';
import '../../../../../main.dart';
import '../../../compon/crud.dart';

part 'login_state.dart';
final Crud _crud = Crud();
 bool pass = false ;
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
void check(){
  emit(LoginCheckBox());
}



  login(String  cUserName ,  String cPassword) async {
 emit(LoginLoading());
try{var response =  await _crud.postRequest(linkLogin, {
  "S_email" : cUserName,
  "password" : cPassword,
  
});
if(response['status'] == "success"){
sharedPref.setString("S_email", response['data']['S_email'].toString()) ;
sharedPref.setString("sname", response['data']['sname'].toString()) ;
sharedPref.setString("n_id", response['data']['n_id'].toString()) ;
emit(LoginSuccess());
}else if(response['status'] == "password"){
  emit(EPassword());
}else if(response['status'] == "fail"){
  emit(LoginVerifyUsername());
}
} catch(e){
  emit(LoginFailure());
}
}

void showOrHidePass(){
  emit(ShowOrHidePassword());
}










}
