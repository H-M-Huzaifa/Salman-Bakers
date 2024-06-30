import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salman/Cart%20&%20DB/CartModel.dart';
import 'package:salman/Cart%20&%20DB/cart_provider.dart';
import 'package:salman/Cart%20&%20DB/cart_screen.dart';
import 'package:salman/Cart%20&%20DB/db_helper.dart';
import 'Cart & DB/cart_provider.dart';
import 'package:badges/badges.dart' as badge;
import 'Cart & DB/db_helper.dart';
import 'package:salman/prod_descrip1.dart';

class product_list1 extends StatefulWidget {
  const product_list1({super.key});

  @override
  State<product_list1> createState() => _product_list1State();
}

class _product_list1State extends State<product_list1> {
  List<String> productName = [
    'Chocolate Fudge',
    'Chocolate Lava',
    'Red Velvet Cake',
    'Marble Cake'
  ];
  List<int> productPrices = [600, 450, 850, 900];
  List<String> productImage = [
    'assets/cake.png',
    'assets/lava.png',
    'assets/red.png',
    'assets/marble.png'
  ];

  DBHelper dbHelper = DBHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFEFEF),
      appBar: AppBar(
        title: Text(
          'Cakes',
          style: TextStyle(
              fontFamily: 'Bebes Neus', fontSize: 30, color: Color(0xff922820)),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffFFD29F),
        actions: [
          InkWell(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => cart_screen(),));
          },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: badge.Badge(
                badgeContent: Consumer<CartProvider>(
                  builder: (BuildContext context, value, Widget? child) {
                    return Text(value.getcounter().toString(),
                        style: TextStyle(color: Colors.white));
                  },
                ),
                badgeAnimation: badge.BadgeAnimation.fade(
                    animationDuration: Duration(milliseconds: 300)),
                child: Icon(
                  Icons.shopping_bag,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          // IconButton(
          //   onPressed: () {
          //     Navigator.push(
          //         context, MaterialPageRoute(builder: (context) => cart()));
          //   },
          //   icon: Icon(
          //     Icons.shopping_bag,
          //     size: 30,color: Colors.black,
          //   ),
          //   tooltip: ('Cart'),
          // ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    //Left list items
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => prod_descrip1(
                                      index: index,
                                      productId:
                                          index, // Assuming productId is the same as index
                                      productName: productName[index],
                                      productPrices: productPrices[index],
                                      quantity: 1, // Default quantity
                                      image: productImage[index],
                                    )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          width: 180,
                          height: 250,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(22),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 2,
                                  blurRadius: 8,
                                  offset: Offset(0, 5),
                                ),
                              ]),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                  width: 200,
                                  height: 130,
                                  productImage[index].toString()),
                              SizedBox(
                                height: 5,
                              ),

                              //Price
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Rs " +
                                          productPrices[index].toString() +
                                          r"\-",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text(
                                          productName[index],
                                          style: TextStyle(
                                              fontFamily: 'Bebes Neus',
                                              fontSize: 20),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text(
                                          '1 Pound',
                                          style: TextStyle(
                                              fontFamily: 'Bebes Neus',
                                              fontSize: 20,
                                              color: Color(0xffAFAFAF)),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite_border_outlined,
                                      size: 30,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    //Right list items
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => prod_descrip1(
                                index: index,
                                productId:
                                    index, // Assuming productId is the same as index
                                productName: productName[index],
                                productPrices: productPrices[index],
                                quantity: 1, // Default quantity
                                image: productImage[index],
                              ),
                            ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          width: 180,
                          height: 250,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(22),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 2,
                                  blurRadius: 8,
                                  offset: Offset(0, 5),
                                ),
                              ]),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                  width: 200,
                                  height: 130,
                                  productImage[index].toString()),
                              SizedBox(
                                height: 5,
                              ),

                              //Price
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Rs " +
                                          productPrices[index].toString() +
                                          r"\-",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text(
                                          productName[index],
                                          style: TextStyle(
                                              fontFamily: 'Bebes Neus',
                                              fontSize: 20),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text(
                                          '1 Pound',
                                          style: TextStyle(
                                              fontFamily: 'Bebes Neus',
                                              fontSize: 20,
                                              color: Color(0xffAFAFAF)),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite_border_outlined,
                                      size: 30,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: productName.length,
      ),
    );
  }
}
