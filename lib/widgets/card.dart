import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  final titleText;
  final cardImage;
  ContentCard({this.titleText, this.cardImage});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width * 0.42,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(190, 190, 190, 0.9),
              offset: Offset(1, 4),
              blurRadius: 6.0,
            ),
          ]),
      child: Container(
        padding: EdgeInsets.only(left: 35, right: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(cardImage),
            SizedBox(
              height: 20,
            ),
            Text(
              titleText,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
