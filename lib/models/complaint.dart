/*
 {
	"complaint":"This is some input text with the date 2nd of March,This is some input text with the date 2nd of March"
}
*/

class Complaint {
  String complaint;

  Complaint({this.complaint});

  factory Complaint.fromJson(Map<String, dynamic> json){
   return Complaint(
      complaint: json['complaint']
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['complaint'] = this.complaint;
    return data;
  }
}