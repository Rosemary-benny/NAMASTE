import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:namaste/models/product.dart';
import 'package:namaste/models/user.dart';
import 'package:namaste/pages/scheduleConfirm.dart';
import 'package:namaste/providers/user_provider.dart';
import 'package:namaste/widgets/checkBox.dart';
import 'package:provider/provider.dart';

import '../navbar.dart';

class IndividualProduct extends StatefulWidget {
  const IndividualProduct(
      {Key? key, this.pImgUrl, this.pName, this.personList, this.shopList})
      : super(key: key);
  final pImgUrl;
  final pName;
  final personList;
  final shopList;
  @override
  _IndividualProductState createState() => _IndividualProductState();
}

class _IndividualProductState extends State<IndividualProduct> {
  var _formKey = GlobalKey<FormState>();
  ProductData productData = ProductData();
  var nameController = TextEditingController();
  var pinController = TextEditingController();

  var locationController = '';
  var timeController = "";
  var typeController = "";
bool isLoading=false;

  @override
  Widget build(BuildContext context) {
     UserData userData= Provider.of<UserProvider>(context, listen: false).userData;

    return Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
                icon: const Icon(Icons.menu, color: Colors.grey),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                });
          }),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
                icon: Icon(Icons.search, color: Colors.grey), onPressed: () {}),
            IconButton(
                icon: Icon(Icons.favorite_outline_rounded, color: Colors.grey),
                onPressed: () {}),
            IconButton(
                icon: Icon(Icons.shopping_cart_outlined, color: Colors.grey),
                onPressed: () {}),
          ],
        ),
        drawer: NavBar(),
        body: isLoading?Center(child: CircularProgressIndicator()) :SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(top: 30, bottom: 20),
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width / 1.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.pImgUrl,
                        ),
                        fit: BoxFit.fitWidth,
                      ),
                      color: Colors.green[100]),
                )),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(widget.pName,
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(icon: Icon(Icons.add), onPressed: () {}),
                  Text("1"),
                  IconButton(icon: Icon(Icons.minimize), onPressed: () {})
                ],
              )
            ]),
            Container(
                margin: EdgeInsets.only(left: 70),
                alignment: Alignment(-1, 0),
                child: Text(
                  "RATE: Rs.200/unit",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                )),
            Container(
                alignment: Alignment(-1, 0),
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width / 1.1,
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green[100],
                ),
                child: Text("AVAILABLE SELLERS",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Colors.black))),
                           SizedBox(height: 30),
                          InkWell(
                                onTap: () async {
                                  print('Called');
                                  setState(() {
                                    isLoading=true;
                                  });
                              
                                  productData = ProductData(
                                      uid: userData.uid,
                                      name: widget.pName.toString(),
                         
                                      quantity: "1",
                                      oPrice: "200",
                                      dPrice: "200");
                                  await Provider.of<UserProvider>(context,
                                          listen: false)
                                      .addProduct(productData: productData);
                                      setState(() {
                                        isLoading=false;
                                      });
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ScheduleConfirmation()));
                                },
                                child: Container(
                                 
                            alignment: Alignment(0, 0),
                       
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.green[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                                  child: Text(
                                    
                                    "BUY",
                                    style: TextStyle(color: Colors.green[900]),
                                  ),
                                )),
            // Row(children: [
            //   Column(
            //     children: [
            //       Expanded(
            //           child: SizedBox(
            //               height: 500,
            //               child: new ListView.builder(
            //                   shrinkWrap: true,
            //                   scrollDirection: Axis.vertical,
            //                   itemCount: widget.personList.length,
            //                   itemBuilder: (context, index) {
            //                     return Container(
            //                         margin: EdgeInsets.only(
            //                             top: 20, bottom: 0, left: 25),
            //                         child: CheckBox(
            //                           label: widget.personList[index],
            //                         ));
            //                   })))
            //     ],
            //   )
            // ])
          ],
        )));
  }
}
