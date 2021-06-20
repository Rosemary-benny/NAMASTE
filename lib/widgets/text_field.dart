import 'package:flutter/material.dart';

class LabeledTextField extends StatefulWidget {
  final label;
  final controller;
  LabeledTextField({Key? key, this.label, this.controller}) : super(key: key);

  @override
  _LabeledTextFieldState createState() => _LabeledTextFieldState();
}

class _LabeledTextFieldState extends State<LabeledTextField> {
  bool isEditable = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, bottom: 5),
            child: Text(
              widget.label,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 47,
            child: TextFormField(
              controller: widget.controller,
              enabled: isEditable,
              decoration: new InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isEditable = true;
                    });
                  },
                  icon: Icon(Icons.edit),
                  color: Colors.black87,
                ),
                contentPadding: EdgeInsets.only(top: 5, bottom: 5, left: 20),
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: new BorderSide(),
                ),
                //fillColor: Colors.green
              ),
            ),
          ),
        ],
      ),
    );
  }
}
