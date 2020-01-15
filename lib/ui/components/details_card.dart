import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  final String title;
  final String details;
  final bool isMultiline;

  DetailsCard({this.title,this.details,this.isMultiline});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20, right: 20),
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 10.0),
              child: TextFormField(
                initialValue: details,
                keyboardType: isMultiline ? TextInputType.multiline : null,
                maxLines: isMultiline ? 10 : null,
                decoration: InputDecoration(
                    border:  OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
