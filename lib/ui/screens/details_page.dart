import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spective_sih/ui/components/details_card.dart';
import 'package:spective_sih/ui/components/profile_appbar.dart';
import 'package:spective_sih/ui/screens/status_page.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0, top: 8.0),
                child: Text(
                  'Confirm Details',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20
                  ),
                ),
              ),
            ),
            DetailsCard(title: 'Date',isMultiline: false,),
            DetailsCard(title: 'Incident Type', isMultiline: false,),
            DetailsCard(title: 'Description', isMultiline: true,),
            Center(
              child: RaisedButton(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Submit', style: TextStyle(color: Colors.white),),
                    Icon(Icons.arrow_forward_ios, color: Colors.white,)
                  ],
                ),
                onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => StatusPage()
                ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
