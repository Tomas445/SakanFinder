validInput( String val , int min , int max ){
if(val.isEmpty){
  return "can't be Empty" ;
}
if(val.length < min ){
  return "can't be less then $min" ;
}
if(val.length > max){
  return "can't be larger then $max" ;
}

}