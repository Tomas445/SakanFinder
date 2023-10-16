class getRoomDetailsAndRateModel {
int? star5;
  int? star4;
  int? star3;
  int? star2;
  int? star1;
  int? total;
  double? avg;
  int? roID;
  String? roDescription;
  String? roMedia;
  int? bedPrice;
  int? numOfBed;
  int? availableBeds;
  int? aID;

  getRoomDetailsAndRateModel(
      {this.star5,
      this.star4,
      this.star3,
      this.star2,
      this.star1,
      this.total,
      required this.avg,
      this.roID,
      this.roDescription,
      this.roMedia,
      this.bedPrice,
      this.numOfBed,
      this.availableBeds,
      this.aID});

  getRoomDetailsAndRateModel.fromJson(Map<String, dynamic> json) {
     star5 = json['star5'];
    star4 = json['star4'];
    star3 = json['star3'];
    star2 = json['star2'];
    star1 = json['star1'];
    total = json['total'];
   //avg = json['avg'] != null ? json['avg'].toDouble() : null;
   //avg = json['avg'] != null ? json['avg'].toDouble() : 0.0;
//avg = json['avg'] is String ? double.parse(json['avg']) :avg = json['avg'];
// avg = json['avg'] != null && json['avg'] is int ? (json['avg'] as int).toDouble() : 0.0;
 avg =  double.tryParse(json['avg']) ?? 0;
  //avg = json['avg'] ?? 0;
//avg = json['avg'] != null ? (json['avg'] as int).toDouble() : null;


    roID = json['Ro_ID'];
    roDescription = json['Ro_Description'];
    roMedia = json['Ro_Media'];
    bedPrice = json['Bed_Price'];
    numOfBed = json['Num_of_Bed'];
    availableBeds = json['Available_Beds'];
    aID = json['A_ID'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //    data['star5'] = this.star5;
  //   data['star4'] = this.star4;
  //   data['star3'] = this.star3;
  //   data['star2'] = this.star2;
  //   data['star1'] = this.star1;
  //   data['total'] = this.total;
  //   data['avg'] = this.avg;
  //   data['Ro_ID'] = this.roID;
  //   data['Ro_Description'] = this.roDescription;
  //   data['Ro_Media'] = this.roMedia;
  //   data['Bed_Price'] = this.bedPrice;
  //   data['Num_of_Bed'] = this.numOfBed;
  //   data['Available_Beds'] = this.availableBeds;
  //   data['A_ID'] = this.aID;
  //   return data;
  // }
}