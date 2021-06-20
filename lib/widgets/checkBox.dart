import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  CheckBox({Key? key, this.label}) : super(key: key);
  final label;
  bool _checked = false;

  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      InkWell(
          child: Text("I have read the Privacy Policy",
              style: TextStyle(color: Colors.blue))),
      Theme(
          data: ThemeData(unselectedWidgetColor: Colors.white),
          child: Checkbox(
            value: widget._checked,
            onChanged: (value) {
              setState(() {
                widget._checked = !widget._checked;
              });
            },
            activeColor: Colors.white,
            checkColor: Colors.green[500],
          ))
    ]);
  }
}
