class ViewAllRoomFromApartmentModel {
  int? aID;
  String? location;
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
  double? avg;

  ViewAllRoomFromApartmentModel(
      {this.aID,
      this.location,
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
      this.avg});

  ViewAllRoomFromApartmentModel.fromJson(Map<String, dynamic> json) {
    aID = json['A_ID'];
    location = json['Location'];
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
    avg =  double.tryParse(json['avg']) ?? 0;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['A_ID'] = this.aID;
  //   data['Location'] = this.location;
  //   data['N_of_Room'] = this.nOfRoom;
  //   data['n_of_kitchens'] = this.nOfKitchens;
  //   data['n_of_WC'] = this.nOfWC;
  //   data['area'] = this.area;
  //   data['O_Email'] = this.oEmail;
  //   data['gender_guest'] = this.genderGuest;
  //   data['Ro_ID'] = this.roID;
  //   data['Ro_Description'] = this.roDescription;
  //   data['Ro_Media'] = this.roMedia;
  //   data['Bed_Price'] = this.bedPrice;
  //   data['Num_of_Bed'] = this.numOfBed;
  //   data['Available_Beds'] = this.availableBeds;
  //   data['avg'] = this.avg.toString();
  //   return data;
  // }
}