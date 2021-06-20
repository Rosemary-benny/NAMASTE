import 'package:flutter/material.dart';
import 'pages/home.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.search,
          color: Colors.black,
        ),
        title: Container(
          child: TextField(
            decoration: InputDecoration(
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.all(Radius.circular(20.0)),
              //   // borderSide: BorderSide(color: Colors.black, width: 1),
              // ),
              // prefixIcon: IconButton(icon: Icon(Icons.arrow_drop_down,color: Colors.black,),onPressed: () => print("show categories"),),
              hintText: 'Search for products, Brands and more',
              hintStyle: TextStyle(color: Colors.black, fontSize: 15),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.keyboard_voice,
                  color: Colors.black,
                ),
                onPressed: () => print("search"),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Discover more"),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  ),
                  color: Colors.grey,
                  child: Text("Stayfree"),
                ),
                FlatButton(
                  onPressed: () => null,
                  color: Colors.grey,
                  child: Text("Whisper"),
                ),
                FlatButton(
                  onPressed: () => null,
                  color: Colors.grey,
                  child: Text("Pink cup"),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                  onPressed: () => null,
                  color: Colors.grey,
                  child: Text("Softie"),
                ),
                FlatButton(
                  onPressed: () => null,
                  color: Colors.grey,
                  child: Text("Tampons"),
                ),
                FlatButton(
                  onPressed: () => null,
                  color: Colors.grey,
                  child: Text("Fenisafe"),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
