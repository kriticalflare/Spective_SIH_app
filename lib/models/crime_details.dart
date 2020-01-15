class CrimeDetails {
  String date;
  String crime;
  String complaint;

  CrimeDetails({this.date, this.crime, this.complaint});

  CrimeDetails.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    crime = json['crime'];
    complaint = json['complaint'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['crime'] = this.crime;
    data['complaint'] = this.complaint;
    return data;
  }
}
