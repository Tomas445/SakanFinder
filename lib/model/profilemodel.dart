class ProfileModel {
String? sname;
  String? phone;
  String? gander;
  String? university;
  String? nId;
  String? birthdate;
  String? address;
  String? password;
  String? reliativPhone;
  String? sEmail;
  int? sVerfiycode;
  int? sApprove;
  String? sCreate;

  ProfileModel(
      {this.sname,
      this.phone,
      this.gander,
      this.university,
      this.nId,
      this.birthdate,
      this.address,
      this.password,
      this.reliativPhone,
      this.sEmail,
      this.sVerfiycode,
      this.sApprove,
      this.sCreate});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    sname = json['sname'];
    phone = json['phone'];
    gander = json['gander'];
    university = json['university'];
    nId = json['n_id'];
    birthdate = json['birthdate'];
    address = json['address'];
    password = json['password'];
    reliativPhone = json['reliativ_phone'];
    sEmail = json['S_email'];
    sVerfiycode = json['S_verfiycode'];
    sApprove = json['S_approve'];
    sCreate = json['S_create'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['sname'] = this.sname;
  //   data['phone'] = this.phone;
  //   data['gander'] = this.gander;
  //   data['university'] = this.university;
  //   data['n_id'] = this.nId;
  //   data['birthdate'] = this.birthdate;
  //   data['address'] = this.address;
  //   data['password'] = this.password;
  //   data['reliativ_phone'] = this.reliativPhone;
  //   data['S_email'] = this.sEmail;
  //   data['S_verfiycode'] = this.sVerfiycode;
  //   data['S_approve'] = this.sApprove;
  //   data['S_create'] = this.sCreate;
  //   return data;
  // }
}