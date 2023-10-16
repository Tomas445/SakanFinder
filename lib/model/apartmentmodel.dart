class ApartmentModel {
  int? aID;
  String? location;
  int? nOfRoom;
    String? image;
  String? genderGuest;
  int? nOfKitchens;
  int? nOfWC;
  int? area;
  String? oEmail;
  num? avg;
  
  ApartmentModel({
    this.aID,
    this.location,
    this.nOfRoom,
    this.image,
    this.genderGuest,
    this.nOfKitchens,
    this.nOfWC,
    this.area,
    this.oEmail,
    this.avg,
  });

  ApartmentModel.fromJson(Map<String, dynamic> json) {
    aID = json['A_ID'];
    location = json['Location'];
    nOfRoom = json['N_of_Room'];
    image = json['image'];
    genderGuest = json['gender_guest'];
    nOfKitchens = json['n_of_kitchens'];
    nOfWC = json['n_of_WC'];
    area = json['area'];
    oEmail = json['O_Email'];
    avg = json['avg'] ?? 0;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['A_ID'] = aID;
  //   data['Location'] = location;
  //   data['N_of_Room'] = nOfRoom;
  //   data['gender_guest'] = genderGuest;
  //   data['n_of_kitchens'] = nOfKitchens;
  //   data['n_of_WC'] = nOfWC;
  //   data['area'] = area;
  //   data['O_Email'] = oEmail;
  //   data['avg'] = avg;
  //   return data;
  // }
}
