import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spective_sih/state/complaint_provider.dart';
import 'package:spective_sih/ui/screens/complaints_page.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Spective SIH'
        ),
      ),
      body: Column(
        children: <Widget>[
          Placeholder(),
          FlatButton(
            child: Text(
                'File a complaint'
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder:(context) => ComplaintsPage(editingController: Provider.of<ComplaintsProvider>(context).controller,)
              ));
            },
          )
        ],
      ),
    );
  }
}
