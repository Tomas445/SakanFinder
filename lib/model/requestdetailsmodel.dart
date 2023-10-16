class RequestDetailsModel {
  int? star5;
  int? star4;
  int? star3;
  int? star2;
  int? star1;
  int? total;
  num? avg;
  int? aID;
  String? location;
  String? image;
  int? nOfRoom;
  int? nOfKitchens;
  int? nOfWC;
  int? area;
  String? oEmail;
  String? genderGuest;
  int? roID;
  String? roDescription;
  String? roMedia;
  int? bedPrice;
  int? numOfBed;
  int? availableBeds;
  String? oName;
  String? phone;
  int? rNumber;
  String? sDate;
  String? eDate;
  int? status;
  num? stars;

  RequestDetailsModel(
      {this.star5,
      this.star4,
      this.star3,
      this.star2,
      this.star1,
      this.total,
      this.avg,
      this.aID,
      this.location,
      this.image,
      this.nOfRoom,
      this.nOfKitchens,
      this.nOfWC,
      this.area,
      this.oEmail,
      this.genderGuest,
      this.roID,
      this.roDescription,
      this.roMedia,
      this.bedPrice,
      this.numOfBed,
      this.availableBeds,
      this.oName,
      this.phone,
      this.rNumber,
      this.sDate,
      this.eDate,
      this.status,
      this.stars});

  RequestDetailsModel.fromJson(Map<String, dynamic> json) {
    star5 = json['star5'];
    star4 = json['star4'];
    star3 = json['star3'];
    star2 = json['star2'];
    star1 = json['star1'];
    total = json['total'];
    avg =  json['avg'] ?? 0;
    aID = json['A_ID'];
    location = json['Location'];
    image = json['image'];
    nOfRoom = json['N_of_Room'];
    nOfKitchens = json['n_of_kitchens'];
    nOfWC = json['n_of_WC'];
    area = json['area'];
    oEmail = json['O_Email'];
    genderGuest = json['gender_guest'];
    roID = json['Ro_ID'];
    roDescription = json['Ro_Description'];
    roMedia = json['Ro_Media'];
    bedPrice = json['Bed_Price'];
    numOfBed = json['Num_of_Bed'];
    availableBeds = json['Available_Beds'];
    oName = json['O_Name'];
    phone = json['Phone'];
    rNumber = json['R_Number'];
    sDate = json['S_Date'];
    eDate = json['E_Date'];
    status = json['status'];
    stars = json['Stars'];
  }

}