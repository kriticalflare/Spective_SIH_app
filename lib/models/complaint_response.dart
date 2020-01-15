
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
  Urldata urldata;

  Data({this.urldata});

  Data.fromJson(Map<String, dynamic> json) {
    urldata =
    json['urldata'] != null ? new Urldata.fromJson(json['urldata']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.urldata != null) {
      data['urldata'] = this.urldata.toJson();
    }
    return data;
  }
}

class Urldata {
  List<String> dates;
  String inputText;

  Urldata({this.dates, this.inputText});

  Urldata.fromJson(Map<String, dynamic> json) {
    dates = json['dates'] != null
        ? List<String>.from(json['dates'])
        : null;
    inputText = json['input_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dates'] = this.dates;
    data['input_text'] = this.inputText;
    return data;
  }
}