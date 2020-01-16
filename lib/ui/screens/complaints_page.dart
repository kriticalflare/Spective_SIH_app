import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:spective_sih/models/complaint_response.dart';
import 'package:spective_sih/state/complaint_provider.dart';
import 'package:spective_sih/ui/components/profile_appbar.dart';
import 'package:spective_sih/ui/screens/details_page.dart';

class ComplaintsPage extends StatefulWidget {
  final TextEditingController editingController;
  ComplaintsPage({this.editingController});
  @override
  _ComplaintsPageState createState() => _ComplaintsPageState();
}

class _ComplaintsPageState extends State<ComplaintsPage> {
  @override
  void dispose() {
    widget.editingController.clear();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _loading = false;
  }

  bool _loading ;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _loading,
      child: Scaffold(
        appBar: ProfileAppbar(),
        body: Consumer<ComplaintsProvider>(
            builder: (context, complaintProvider, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: Text(
                    'File a complaint',
                    style: TextStyle(color: Colors.grey, fontSize: 24),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  controller: widget.editingController,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: 'Enter your complaint',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Add description',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Center(
                  child: Text(
                    'OR',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                    child: FloatingActionButton(
                  child: Icon(Icons.mic),
                  backgroundColor: complaintProvider.isListening ? Colors.red : Colors.blue,
                  onPressed: () {
                    complaintProvider.startListening();
                  },
                )),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: complaintProvider.isListening
                      ? Text(
                          'Listening...',
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        )
                      : Text(
                          'Tap to Speak',
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                ),
              ),
              Center(
                child: RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('Next', style: TextStyle(color: Colors.white),),
                      Icon(Icons.arrow_forward_ios, color: Colors.white,)
                    ],
                  ),
                  onPressed: () async {
                    setState(() {
                      _loading = true; // Use provider for this too ? or setState is the more KISS solution since this is anyway local ui state
                    });
                    Data data = await complaintProvider.postComplaint();
                    setState(() {
                      _loading = false;
                    });
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => DetailsPage(data)
                    ));
                  },
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
