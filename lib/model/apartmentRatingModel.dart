class ApartmentRatingModel {
  int? stars5;
  int? stars4;
  int? stars3;
  int? stars2;
  int? stars1;
  int? total;
  double? avg;

  ApartmentRatingModel(
      {this.stars5,
      this.stars4,
      this.stars3,
      this.stars2,
      this.stars1,
      this.total,
      this.avg});

  ApartmentRatingModel.fromJson(Map<String, dynamic> json) {
    stars5 = json['stars5'];
    stars4 = json['stars4'];
    stars3 = json['stars3'];
    stars2 = json['stars2'];
    stars1 = json['stars1'];
    total = json['total'];
 avg = json['avg'] != null ? json['avg'].toDouble() : null;
// avg = json['avg'] != null ? double.parse(json['avg'].toStringAsFixed(2)) : null;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['stars5'] = this.stars5;
  //   data['stars4'] = this.stars4;
  //   data['stars3'] = this.stars3;
  //   data['stars2'] = this.stars2;
  //   data['stars1'] = this.stars1;
  //   data['total'] = this.total;
  //   data['avg'] = this.avg != null ? this.avg.toString() : null;
  //   return data;
  // }
}
