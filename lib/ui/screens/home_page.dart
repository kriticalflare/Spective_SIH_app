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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.asset('assets/homepage_map.png' , height: MediaQuery.of(context).size.height * 0.8 , fit: BoxFit.fill),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Hi Mahendra!',
                  style: TextStyle(
                    color: Colors.grey
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.add_alert
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: FlatButton(
                  child: Text(
                      'File a complaint',
                    style: TextStyle(
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder:(context) => ComplaintsPage(editingController: Provider.of<ComplaintsProvider>(context).controller,)
                    ));
                  },
                ),
              )
            ],
          ),
          Divider(
            indent: MediaQuery.of(context).size.width * 0.2,
            color: Colors.grey,
            endIndent: MediaQuery.of(context).size.width * 0.2,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                  Icons.keyboard_arrow_down
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: FlatButton(
                  child: Text(
                    'More',
                    style: TextStyle(
                        fontWeight: FontWeight.w400
                    ),
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder:(context) => ComplaintsPage(editingController: Provider.of<ComplaintsProvider>(context).controller,)
                    ));
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
