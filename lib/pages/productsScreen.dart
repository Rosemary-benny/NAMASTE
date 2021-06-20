import 'package:flutter/material.dart';
import 'package:namaste/pages/home.dart';
import 'package:namaste/widgets/productCard.dart';

import '../navbar.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 50,
                    width: 500,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text("PRODUCTS",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    )),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProductCard(
                          pName: "SOLDIER WORMS",
                          pImg:
                              "https://images.unsplash.com/photo-1622082672093-9d287714b657?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
                          personList: ["Person 1", "Person 2", "Person 3"],
                          shopList: ["Shop 1", "Shop 2"]),
                      ProductCard(
                          pName: "BSF EGGS",
                          pImg:
                              "https://images.unsplash.com/photo-1579373903781-fd5c0c30c4cd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80",
                          personList: ["Person 1", "Person 2"],
                          shopList: ["Shop 1", "Shop 2"]),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProductCard(
                          pName: "BSF FRASS",
                          pImg:
                              "https://images.unsplash.com/photo-1579373903781-fd5c0c30c4cd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80",
                          personList: ["Person 1", "Person 2", "Person 3"],
                          shopList: ["Shop 1"]),
                      ProductCard(
                          pName: "CRUNCHIES",
                          pImg:
                              "https://images.unsplash.com/photo-1589752881676-589e85baec16?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80",
                          personList: ["Person 1", "Person 2", "Person 3"],
                          shopList: ["Shop 1", "Shop 2"]),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProductCard(
                          pName: "ECO FRIENDLY BAGS",
                          pImg:
                              "https://images.unsplash.com/photo-1532697057284-bbe526e18cdb?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
                          personList: ["Person 1", "Person 2", "Person 3"],
                          shopList: ["Shop 1", "Shop 2"]),
                      ProductCard(
                          pName: "PAPER PENS",
                          pImg:
                              "https://images.unsplash.com/photo-1567855354833-ac2c4f967b0c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVuc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                          personList: ["Person 1", "Person 2", "Person 3"],
                          shopList: ["Shop 1", "Shop 2"]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
