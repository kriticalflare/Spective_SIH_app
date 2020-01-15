import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spective_sih/state/complaint_provider.dart';
import 'package:spective_sih/ui/screens/complaints_page.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

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
              TextEditingController editingController = TextEditingController();
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider(
                    create: (_) {
                      return ComplaintsProvider(editingController);
                    },
                      child: ComplaintsPage(editingController: editingController,)
                  )
              ));
            },
          )
        ],
      ),
    );
  }
}
