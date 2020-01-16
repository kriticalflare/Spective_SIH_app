import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spective_sih/models/complaint_response.dart';
import 'package:spective_sih/models/crime_details.dart';
import 'package:spective_sih/state/complaint_provider.dart';
import 'package:spective_sih/ui/components/details_card.dart';
import 'package:spective_sih/ui/components/profile_appbar.dart';
import 'package:spective_sih/ui/screens/status_page.dart';

class DetailsPage extends StatefulWidget {
  final Data data;

  DetailsPage(this.data);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  TextEditingController editingControllerDates;
  TextEditingController editingControllerCrime;
  TextEditingController editingControllerComplaint;
  String dates = "";
  String crimes = "";

  @override
  void initState() {
    if(widget.data.dates.isNotEmpty){
      for(String date in widget.data.dates){
        dates = dates + ' ' + date ;
      }
    }
    if(widget.data.dates.isNotEmpty){
      for(String crime in widget.data.crime){
        crimes = crimes + ' ' + crime ;
      }
    }

    editingControllerDates = TextEditingController(text: dates);
    editingControllerCrime = TextEditingController(text: crimes);
    editingControllerComplaint = TextEditingController(text: widget.data.inputText);
    super.initState();
  }

  @override
  void dispose() {
    editingControllerComplaint.dispose();
    editingControllerDates.dispose();
    editingControllerCrime.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppbar(),
      body: Consumer<ComplaintsProvider>(
        builder: (context, complaintsProvider, _) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0, top: 8.0),
                    child: Text(
                      'Confirm Details',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ),
                ),
                DetailsCard(
                  title: 'Date',
                  isMultiline: false,
                  controller: editingControllerDates,
                ),
                DetailsCard(
                  title: 'Incident Type',
                  isMultiline: false,
                  controller: editingControllerCrime,
                ),
                DetailsCard(
                  title: 'Description',
                  isMultiline: true,
                  controller: editingControllerComplaint,
                ),
                Center(
                  child: RaisedButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        )
                      ],
                    ),
                    onPressed: () {
                      complaintsProvider.sendCrimeDetails(CrimeDetails(
                          date: editingControllerDates.text,
                          crime: editingControllerCrime.text,
                          complaint: editingControllerComplaint.text));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StatusPage()));
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
