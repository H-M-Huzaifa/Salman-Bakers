import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salman/Cart%20&%20DB/CartModel.dart';
import 'package:salman/Cart%20&%20DB/cart_screen.dart';
import 'product_list1.dart';
import 'Cart & DB/cart_provider.dart';
import 'Cart & DB/db_helper.dart';

class prod_descrip1 extends StatefulWidget {
  final int index;
final int productId;
final String productName;
final int productPrices;
final int quantity;
final String image;

const prod_descrip1({
super.key,
required this.index,
required this.productId,
required this.productName,
required this.productPrices,
required this.quantity,
required this.image,
  //const prod_descrip1({super.key});


});

  @override
  State<prod_descrip1> createState() => _prod_descrip1State();
}

class _prod_descrip1State extends State<prod_descrip1> {

  DBHelper? dbHelper= DBHelper();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xffEFEFEF),
      appBar: AppBar(
        backgroundColor: Color(0xffFFD29F),
        title: Text(
          'Chocolate Fudge',
          style: TextStyle(
              fontFamily: 'Bebes Neus', fontSize: 30, color: Color(0xff922820)),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        actions: [IconButton(onPressed: (){}, icon: Icon(size: 25,Icons.favorite_border_outlined))],
        //leading: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined),    ),
      ),
      body:
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            //Image
            Center(
                child: Container(
                    decoration:
                    BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(
                          spreadRadius: -25,
                          blurRadius: 15,
                          offset: Offset(0, 30),
                          color: Colors.grey)
                    ]),
                    child: Image(
                      image: AssetImage('assets/cake.png'),
                    ))),
            SizedBox(
              height: 40,
            ),

            //Description
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Container(
                width: 400,
                height: 160,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0, 10),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 20),
                      child: Text(
                        'Description:',
                        style: TextStyle(
                            fontFamily: 'Bebes Neus',
                            fontSize: 30,
                            color: Color(0xff922820)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: Text(
                        "Indulge in decadence with our Chocolate Fudge cake – a rich, velvety delight for every sweet tooth's dream!",
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Price
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Container(
                width: 400,
                height: 120,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0, 10),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 20),
                      child: Text(
                        'Price:',
                        style: TextStyle(
                            fontFamily: 'Bebes Neus',
                            fontSize: 30,
                            color: Color(0xff922820)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: Text(
                        "Rs/-550  1Pound",
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Quantity
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Container(
                width: 400,
                height: 120,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0, 10),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 20),
                      child: Text(
                        'Quantity:',
                        style: TextStyle(
                            fontFamily: 'Bebes Neus',
                            fontSize: 30,
                            color: Color(0xff922820)),
                      ),
                    ),

                  ],
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            //Add to cart Button
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: InkWell(
                onTap: () {
                  dbHelper!.insert(
                      Cart(
                          id: widget.index,
                          productId: widget.productName,
                          productName: widget.productName,
                          productPrices: widget.productPrices,
                          quantity: widget.quantity,
                          image: widget.image
                      )
                  ).then((value) {
                    cart.addTotalPrice(widget.productPrices);
                    cart.addcounter();
                  }).onError((error, stackTrace) {
                    print('Error: $error');
                  });

                },
                child:
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0, 10),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xff922820),
                  ),
                  height: 60,
                  width: 300,
                  child: Center(
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
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
