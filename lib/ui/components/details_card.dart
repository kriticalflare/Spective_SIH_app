import 'package:flutter/material.dart';

class DetailsCard extends StatefulWidget {
  final String title;
  final String details;
  final bool isMultiline;
  final TextEditingController controller;

  DetailsCard({this.title,this.details,this.isMultiline,this.controller});

  @override
  _DetailsCardState createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {
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
                widget.title,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 10.0),
              child: TextFormField(
                controller: widget.controller,
                initialValue: widget.details,
                keyboardType: widget.isMultiline ? TextInputType.multiline : null,
                maxLines: widget.isMultiline ? 10 : null,
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
