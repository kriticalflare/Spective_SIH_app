import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spective_sih/models/complaint.dart';
import 'package:spective_sih/models/complaint_response.dart';
import 'package:spective_sih/models/crime_details.dart';

class NetworkHelper {
  static const String kAPI_URL = 'https://sihbarath.herokuapp.com';

  // /citizen for text analysis
  // /citizen/confirm for storing complaint in database
  Future<Urldata> postComplaint(Complaint complaint) async {

    try {
      http.Response response = await http.post(
        '$kAPI_URL/citizen',
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(complaint) ,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('complaint post successful');
        print(response.body);
        return ComplaintResponse.fromJson(jsonDecode(response.body)).data.urldata;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> postCrimeDetails(CrimeDetails crimeDetails) async {
   try {
     http.Response response = await http.post(
         '$kAPI_URL/citizen/confirm',
         headers: {"Content-Type": "application/json"},
         body: jsonEncode(crimeDetails.toJson())
     );
     if (response.statusCode == 201){
       print('Crime details uploaded');
     } else {
       print(response.statusCode);
     }
   } catch (e) {
     print(e.toString());
   }
  }
}
