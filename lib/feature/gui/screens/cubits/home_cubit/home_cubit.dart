import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/constant/linkapi.dart';
import '../../../../../main.dart';
import '../../../../../model/RequestModel.dart';
import '../../../../../model/fvoriteModel.dart';
import '../../../../../model/apartmentRatingModel.dart';
import '../../../../../model/apartmentmodel.dart';
import '../../../../../model/getRoomDetailsAndRateModel.dart';
import '../../../../../model/profilemodel.dart';
import '../../../../../model/requestdetailsmodel.dart';
import '../../../../../model/viewAllRoomFromApartmentModel.dart';
import '../../../compon/crud.dart';
import '../../bookings.dart';
import '../../favourite.dart';
import '../../home.dart';
import '../../profiles.dart';
import '../../settings.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {



  HomeCubit() : super(HomeInitial());
/*----------------------------------------------------------------*/

   
    
        
   

/*==================================النافجيشن بار=================================================*/
  int bottomNavIndex = 2;
List<Widget> layoutScreens =[const Settings(), const Favorite(),HomeScreen(),const Bookings(),Profiles()];

/*-------------------------تعريف كلاس crud---------------------------------------*/
  final Crud _crud = Crud();
/*------------------------------ميثود خاصة بالنافجيشن بار----------------------------------*/
  void changeBottomNavIndex({required int index}){
    bottomNavIndex = index ;
    emit(ChangeBottomNavIndexState());
  }
/*----------------------------------------------------------------*/
// تعريف دالة لتنفيذ الكود كل 30 ثانية
void executeCodeEvery30Seconds() {
  Timer.periodic(const Duration(seconds: 5), (_) {
    getApartment();
  });
}
/*--------------------------ميثود الي بتعرض الشقق في شاشة الهوم--------------------------------------*/
    List<ApartmentModel> allApartments = [];
 Future <void> getApartment() async {
  emit(ApartmentLoading());
  allApartments.clear();
try{var response =  await _crud.getRequest(linkViweAllAprtment);
if(response['status'] == "success"){
  for(var item in response['data']){
  
allApartments.add(ApartmentModel.fromJson(item));
 }
 print("ob ${allApartments.length}" );
 emit(ApartmentSuccess());
}else if(response['status'] == "fail"){
  emit(ApartmentFailure());
}
} catch(e){
  emit(ApartmentFailure());
}
    }
    /*-------------------------ميثود الخاصة بعرض البيانات في شاشة [apartment]---------------------------------------*/
     List<ViewAllRoomFromApartmentModel> rooms = [];
 apartmentDetails(var aId) async {
    rooms.clear();
    emit(ApartmentLoading());
    try {
      var response = await _crud.postRequest(linkviweAllRoomFromApartment, {
        "A_ID": aId
        });
      if (response['status'] == "success") {
        
        for (var item in response['data']) {
          rooms.add(ViewAllRoomFromApartmentModel.fromJson(item));
        }
     await  getRateFromApartment(aId);
        emit(RoomIsSuccess());
      } else if (response['status'] == "fail") {
        emit(ApartmentFailure());
      }
    }  catch (e) {
      emit(ApartmentFailure());
    }
  }
/*------------------------------  ميثود بتجيب تقييمات الشقة وبتتعرض في باكدج الريتنج في شاشة {apartment}---------------------------------*/
List<ApartmentRatingModel> apartmentRating =[];
Future<void> getRateFromApartment(var aId)async{
  apartmentRating.clear();
    emit(ApartmentLoading());
    try {
      var response = await _crud.postRequest(linkViweRateFromAprtment, {"A_ID": aId});

      if (response['status'] == "success") {
        
        for (var item in response['data']) {
          apartmentRating.add(ApartmentRatingModel.fromJson(item));
        }
       emit(RoomIsSuccess());
      } else if (response['status'] == "fail") {
        emit(ApartmentFailure());
      }
    }  catch (e) {
     // print(" error cath $e ");
      emit(ApartmentFailure());
    }
}
/*----------------------------ميثود بتجيب بيانات الطالب وبتعرضها في شاشة [profiles]------------------------------------*/
 List<ProfileModel> profile =[];
getProfile() async {
 profile.clear();
 emit(ProfileLoding());
try{var response =  await _crud.postRequest(linkViweProfile, {
  "S_email" : sharedPref.getString("S_email"),
 
  
});

if(response['status'] == "success"){

  for(var item in response['data']){
 profile.add(ProfileModel.fromJson(item));
 }
 emit(ProfileSuccess());

}else if(response['status'] == "fail"){
  emit(ProfileFailure());
}
}  catch(e){
  emit(ProfileFailure());
}
}
/*------------------------------ميثود بتجيب بيانات الغرفة وبتعرضها في شاشة {request}----------------------------------*/
List<getRoomDetailsAndRateModel> roomDetails =[];
Future<void> getRoomDetails({required String roId} )async{
  roomDetails.clear();
emit(RoomDetailsIsLoading());
  try{var response =  await _crud.postRequest(linkviweRoomDetailsAndRate, {
  "RO_ID" : roId,
 
  
});

if(response['status'] == "success"){

  for(var item in response['data']){
 roomDetails.add(getRoomDetailsAndRateModel.fromJson(item));
 }
 emit(RoomDetailsIsSuccess());

}else if(response['status'] == "is not empty"){
  emit(RoomDetailsIsNotEmpty());
}else if(response['status'] == "fail"){
  emit(RoomDetailsIsFailure());
}
}  catch(e){
  emit(RoomDetailsIsFailure());
}
  

}
/*----------------------------------------------------------------*/

/*---------------------------ميثود الخاصة بالبحث عن الشقق وبنعرض البيانات في شاشة الهوم-------------------------------------*/
List<ApartmentModel> allApartmentsSearch = [];
void getSearchData ({required var input})async{
 allApartmentsSearch.clear();
 print("tomas[$input]");
if(input != ""){
   
  emit(ApartmentLoading());
    try{var response =  await _crud.postRequest(linkViweSearchDataFromApartment, {
  "search" : input,
 
  
});
if(response['status'] == "success"){
  for(var item in response['data']){
 allApartmentsSearch.add(ApartmentModel.fromJson(item));
 }
 emit(ApartmentSuccess());
}else if(response['status'] == "fail"){
  emit(ApartmentFailure());
}
}  catch(e){
  print("::::: $e");
  emit(ApartmentFailure());
}
}else{
  allApartmentsSearch.clear();
  print("object ${allApartmentsSearch.length}");
  await getApartment();
}

}

/*------------------------------Future<void> هنا الميثود دي بتعمل تحديث للبيانات الخاصة بالغرفة بعد الحجز عشان كده انا مخليها ----------------------------------*/
/*====================هام جداا =======================*/

Future<void> updateRoomDetails({required var roId} )async{
  roomDetails.clear();
emit(UpdateRoomDetailsIsLoading());
  try{var response =  await _crud.postRequest(linkGetRoomDataUpdate, {
  "RO_ID" : roId,
 
  
});
print("$roId");
print("1");

if(response['status'] == "success"){
print("2");
  for(var item in response['data']){
 roomDetails.add(getRoomDetailsAndRateModel.fromJson(item));
 }
  print(response['data']);

 emit(UpdateRoomDetailsIsSuccess());
//  print(getRoomDetailsAndRateModel);
}else if(response['status'] == "fail"){
  print("3");
  emit(UpdateRoomDetailsIsFailure());
}else if(response['data']['Available_Beds'] == "0"){
  print("4");
  emit(UpdateRoomDetailsIsNotEmpty());
}
}  catch(e){
  print("5");
  print("object ::: $e");
  emit(UpdateRoomDetailsIsFailure());
}
  

}


/*----------------------------------<<<updateRoomDetails>>> هنا انا بنفذ الحجز من خلال الميثود دي ولما يتم الحجز بستدعي الميثود الي عملتها فوق وهي ------------------------------*/
 addRequest(var  roId) async {
 emit(RequestLoding());
try{var response =  await _crud.postRequest(linkAddRequest, {
  "S_email" : sharedPref.getString("S_email"),
  "RO_ID" : roId,
  
});
if(response['status'] == "success"){
await updateRoomDetails(roId: roId);
emit(RequestSuccess());

}else if(response['status'] == "notempty"){
  
  emit(RequestNotEmpty());
}else if(response['status'] == "fail"){
  emit(RequestFailure());
}
} catch(e){
  print("ttttttttttt $e");
  emit(RequestFailure());
}
}
 

/*----------------------------هنا ميثود بتجيب الشقق بالمفضلة لدي الطالب------------------------------------*/
List<FavoriteModel> favourites = [];
Set<String> favouritesid = {};

 Future<void> getfavourites()async{
   favourites.clear();
   emit(FavouritesLoading());
try{var response =  await _crud.postRequest(linkGetfavourites, {
  "S_email" : sharedPref.getString("S_email"),
});


if(response['status'] == "success"){
 for(var item in response['data']){
 favourites.add(FavoriteModel.fromJson(item));
 favouritesid.add(item['A_ID'].toString());
 }

 //print("${favourites.length}");
 emit(FavouritesSuccess());
}else if(response['status'] == "fail"){
  emit(FavouritesFailure());
 
}
}  catch(e){

  emit(FavouritesFailure());
}
 }
/*---------------------------هنا مثود بقدر من خلالها اضافة او حذف الشقة من مفضلاتي -------------------------------------*/

 void addorRemovefavourites({required String aId})async{
   favourites.clear();
   emit(FavouritesLoading());
try{ var response =  await _crud.postRequest(linkAddAndRemovFavorite, {
  "S_email" : sharedPref.getString("S_email"),
  "A_ID" :  aId ,
});
if(response['status'] == "success"){
if(favouritesid.contains(aId) == true){
  favouritesid.remove(aId);
}else{
  favouritesid.add(aId);
}

  await  getfavourites();
 emit(AddorRemoveFavourites());
}else{
    emit(FailedToAddorRemoveFavourites());

} 
}catch(e){
   emit(FailedToAddorRemoveFavourites());
}
 }
 /*----------------------------------------------------------------*/
// الليست الخاصة للحجز
List<RequestModel> approvedRequest = [];
List<RequestModel> unacceptableRequest = [];
List<RequestModel> unconfirmedRequest = [];
List<RequestModel> finishRequest = [];
List<RequestDetailsModel> requestDetails = [];
/*----------------------------------------------------------------*/
 //ميثود بتجيب الحجزات المقبولة من المالك
 requestApproved()async{
   approvedRequest.clear();
try{ var response =  await _crud.postRequest(linkApprovedRequest, {
  "S_email" : sharedPref.getString("S_email"),
  "status" : "1"
});


if(response['status'] == "success"){
 for(var item in response['data']){
 approvedRequest.add(RequestModel.fromJson(item));
 }
print("1");
 emit(GetRequestApprovedDataSuccess());
}else if(response['status'] == "fail"){
  print("2");
  emit(FailedToGetRequestApprovedData());
 
}
}catch(e){ 
  print("$e");
  emit(FailedToGetRequestApprovedData());
}
} 

 

 
 //ميثود بتجيب الحجزات المرفوضة من المالك
void requestUnaccepted()async{
   unacceptableRequest.clear();
try{ var response =  await _crud.postRequest(linkApprovedRequest, {
  "S_email" : sharedPref.getString("S_email"),
  "status" : "2"
});


if(response['status'] == "success"){
 for(var item in response['data']){
 unacceptableRequest.add(RequestModel.fromJson(item));
 }


 emit(GetRequestUnacceptableDataSuccess());
}else if(response['status'] == "fail"){
  emit(FailedToGetRequestUnacceptedData());
 
}
}catch(e){ 
   emit(FailedToGetRequestUnacceptedData());
}
 }
 /*------------------------------------------------------------*/
//هنا ميثود دي بتجيب الحجزات التي لم يوافق عليها المالك
void requestUnconfirmed()async{
   unconfirmedRequest.clear();
try{ var response =  await _crud.postRequest(linkApprovedRequest, {
  "S_email" : sharedPref.getString("S_email"),
  "status" : "0"
});


if(response['status'] == "success"){
 for(var item in response['data']){
 unconfirmedRequest.add(RequestModel.fromJson(item));
 }


 emit(GetRequestUnconfirmedDataSuccess());
}else if(response['status'] == "fail"){
  emit(FailedToGetRequestUnconfirmedData());
 
}
}catch(e){
   emit(FailedToGetRequestUnconfirmedData());
}
 }
 /*----------------------------------------------------------------------*/
  requestFinish()async{
   finishRequest.clear();
try{ var response =  await _crud.postRequest(linkApprovedRequest, {
  "S_email" : sharedPref.getString("S_email"),
  "status" : "3"
});


if(response['status'] == "success"){
 for(var item in response['data']){
 finishRequest.add(RequestModel.fromJson(item));
 }
print("1");
 emit(GetRequestApprovedDataSuccess());
}else if(response['status'] == "fail"){
  print("2");
  emit(FailedToGetRequestApprovedData());
 
}
}catch(e){ 
  print("$e");
  emit(FailedToGetRequestApprovedData());
}
} 
/*----------------------------------------------------------------------*/
Future<void> getRequestDetails({required String rNumber , required String roId})async{
   requestDetails.clear();
try{var response =  await _crud.postRequest(linkRequestDetails, {
  "R_Number" : rNumber,
  "RO_ID" : roId
});


if(response['status'] == "success"){
  for(var item in response['data']){
  requestDetails.add(RequestDetailsModel.fromJson(item));
  }
 print(response['data']);

  emit(GetRequestDetailsSuccess());
}else if(response['status'] == "fail"){
  emit(FailedToGetRequestDetails());
}
}  catch(e){
print("000");
  emit(FailedToGetRequestDetails());
}
 }
/*--------------------------------------------------------------*/

void endRequest({required String rNumber , required String roId})async{
  
try{var response =  await _crud.postRequest(linkEndRequest, {
  "R_Number" : rNumber,
  "RO_ID" : roId
});


if(response['status'] == "success"){
  
await getRequestDetails(rNumber: rNumber , roId: roId);

  emit(UpdateRequestSuccess());
}else if(response['status'] == "fail"){
  emit(FailedToUpdateRequest());
}
}  catch(e){

  emit(FailedToUpdateRequest());
}
 }
/*------------------------------------------------------------------------------------*/
void addOrUpdateRating({required String rNumber , required String stars , required String roId})async{
  
try{var response =  await _crud.postRequest(linkaddOrUpdateRatingt, {
  "R_Number" : rNumber,
  "Stars" : stars
});


if(response['status'] == "successRate"){
  await getRequestDetails(rNumber: rNumber , roId: roId);
  emit(AddOrUpdateRatingSuccess());
}else if(response['status'] == "fail"){
  emit(FailedToAddOrUpdateRating());
}
}  catch(e){

  emit(FailedToAddOrUpdateRating());
}
 }



/*-----------------------------------------------------------------------------*/
updateProfile(){
  emit(ProfileIsUpdate());
}
/*----------------------------------------------------------------*/
profileReadOrNot(){
  emit(ProfileReadOrNotRead());
}
/*----------------------------------------------------------------*/
getMoods(){
  emit(MoodState());
}
setStat(){
  emit(Update());
}
/*---------------------------------------------------------------*/
calling({required String phoneNumper})async{
  final url = 'tel:+2$phoneNumper';
  if(await canLaunch(url)){
    await launch(url);
  }else{
    throw 'could not $url';
  }
}
/*----------------------------------------------------------------*/
whatsapp({required String whatsappNumper})async{
 try{ final url = "whatsapp://send?phone=+2$whatsappNumper";
  if(await canLaunch(url)){
    await launch(url);
  }else{
    throw 'could not $url';
  }
 }catch(e){
  print("error:$e");
 }
}
/*----------------------------------------------------------------*/
messenger({required String userNameMessenger})async{
  final url = "http://m.me/$userNameMessenger";
  if(await canLaunch(url)){
    await launch(url);
  }else{
    throw 'could not $url';
  }
}
/*----------------------------------------------------------------*/
email({required String email, required String mas}) async {
  final Uri _emailurl = Uri(
    scheme: 'mailto',
    path: email,
    queryParameters: {'subject': mas},
  );
  if (await canLaunch(_emailurl.toString())) {
    await launch(_emailurl.toString());
  } else {
    throw 'could not launch $_emailurl';
  }
}

/*----------------------------------------------------------------*/
sendEmail() async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'ms7672157@gmail.com',
    queryParameters: {
      'subject': 'Example Subject',
      'body': 'Example Body tomas',
    },
  );
  if (await canLaunch(emailLaunchUri.toString())) {
    await launch(emailLaunchUri.toString());
  } else {
    throw 'Could not launch $emailLaunchUri';
  }
}
/*----------------------------------------------------------------*/
facebook({required String userNameMessenger})async{
  final url = userNameMessenger;
  if(await canLaunch(url)){
    await launch(url);
  }else{
    throw 'could not $url';
  }
}


}
