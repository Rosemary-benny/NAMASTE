import 'package:flutter/material.dart';
import 'package:namaste/pages/individualproductpage.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {Key? key, this.pName, this.pImg, this.personList, this.shopList})
      : super(key: key);
  final pName;
  final pImg;
  final personList;
  final shopList;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => IndividualProduct(
                      pImgUrl: pImg,
                      pName: pName,
                      personList: personList,
                      shopList: shopList,
                    ))),
        child: Container(
          height: 200,
          width: 150,
          child: Card(
            color: Colors.green[50],
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              height: 170,
              width: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(
                    pImg,
                  ),
                  fit: BoxFit.fitWidth,
                  // alignment: Alignment.topCenter,
                ),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      pName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.green[900],
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      IconButton(
                        icon: Icon(Icons.favorite_outline_outlined),
                        onPressed: () {},
                      )
                    ])
                  ]),
            ),
          ),
        ));
  }
}
