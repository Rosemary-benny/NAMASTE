import 'package:flutter/material.dart';

class RankListItem extends StatefulWidget {
  final avatar;
  final uname;
  final uid;
  RankListItem({this.avatar, this.uname, this.uid});
  @override
  _RankListItemState createState() => _RankListItemState();
}

class _RankListItemState extends State<RankListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(widget.avatar),
                radius: 30,
              ),
              SizedBox(width: 20),
              Text(widget.uname),
            ],
          ),
          Text(widget.uid),
        ],
      ),
    );
  }
}
