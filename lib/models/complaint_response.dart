
class ComplaintResponse {
  String status;
  Data data;

  ComplaintResponse({this.status, this.data});

  ComplaintResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<String> crime;
  List<String> dates;
  String inputText;

  Data({this.crime, this.dates, this.inputText});

  Data.fromJson(Map<String, dynamic> json) {
    crime = json['crime'] != null
        ? List<String>.from(json['crime'])
        : null;
    dates = json['dates'] != null
        ? List<String>.from(json['dates'])
        : null;
    inputText = json['input_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['crime'] = this.crime;
    data['dates'] = this.dates;
    data['input_text'] = this.inputText;
    return data;
  }
}
