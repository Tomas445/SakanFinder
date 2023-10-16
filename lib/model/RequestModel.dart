class RequestModel {
  int? rNumber;
  String? sDate;
  String? eDate;
  String? sEmail;
  int? rOID;
  num? stars;
  String? comment;
  int? status;

  RequestModel(
      {this.rNumber,
      this.sDate,
      this.eDate,
      this.sEmail,
      this.rOID,
      this.stars,
      this.comment,
      this.status});

  RequestModel.fromJson(Map<String, dynamic> json) {
    rNumber = json['R_Number'];
    sDate = json['S_Date'];
    eDate = json['E_Date'];
    sEmail = json['S_email'];
    rOID = json['RO_ID'];
    stars = json['Stars'];
    comment = json['Comment'];
    status = json['status'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['R_Number'] = this.rNumber;
  //   data['S_Date'] = this.sDate;
  //   data['E_Date'] = this.eDate;
  //   data['S_email'] = this.sEmail;
  //   data['RO_ID'] = this.rOID;
  //   data['Stars'] = this.stars;
  //   data['Comment'] = this.comment;
  //   data['status'] = this.status;
  //   return data;
  // }
}