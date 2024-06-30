import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:salman/Cart%20&%20DB/cart_provider.dart';
import 'package:salman/Cart%20&%20DB/cart_screen.dart';
import 'package:salman/Cart%20&%20DB/db_helper.dart';
import 'package:salman/product_list1.dart';
import 'package:salman/product_list2.dart';
import 'package:salman/product_list3.dart';
import 'package:salman/product_list4.dart';
import 'package:salman/signup_screen.dart';
import 'package:badges/badges.dart' as badge;

class home_screen extends StatefulWidget {
  const home_screen({super.key});
  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  List imageList = [
    {"id": 1, 'image_path': 'assets/BBQ-Sandwiches-500x500 1.png'},
    {"id": 2, 'image_path': 'assets/double-decker-sandwiches 1.png'},
    {"id": 3, 'image_path': 'assets/shami-kabab-sandwich 2.png'},
    {"id": 4, 'image_path':'assets/Rotisserie-Chicken-Sandwich-202-2000-485b673fe411460e95b512fbf805a5d9 1.png'},
  ];

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    DBHelper dbHelper = DBHelper();
    return Scaffold(
      backgroundColor: Color(0xffEFEFEF),
      appBar: AppBar(
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
      drawer: Drawer(
        child: Column(
          children: [
            SafeArea(
              child: const UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Color(0xffF4E6B5)),
                currentAccountPicture: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/pexels-photo-771742.webp'),
                ),
                accountName: Text(
                  "Muhammad Ahmad",
                  style: TextStyle(color: Color(0xff922820)),
                ),
                accountEmail: Text(
                  'muhammadalijinnah@.123abc.com',
                  style: TextStyle(color: Color(0xff922820)),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(10.0),
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.home,
                      size: 30,
                    ),
                    title: Text(
                      'Home',
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {

                      Navigator.push(context, MaterialPageRoute(builder: (context) => home_screen(),));

                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.favorite_rounded,
                      color: Colors.red,
                      size: 30,
                    ),
                    title: Text(
                      'Favourite',
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {},
                    trailing: ClipOval(
                      child: Container(
                        color: Colors.red,
                        width: 20,
                        height: 20,
                        child: Center(
                          child: Text(
                            '3',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.history,
                      size: 30,
                    ),
                    title: Text(
                      'History',
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.map,
                      size: 30,
                    ),
                    title: Text(
                      'Find Us',
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.call,
                      size: 30,
                    ),
                    title: Text(
                      'Contact Us',
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            // Move the last tile to the bottom-most of the drawer
            Divider(),
            ListTile(
              leading: Icon(
                Icons.exit_to_app_outlined,
                size: 30,
              ),
              title: Text(
                'Sign out',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => signUp()));
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              //Carousel
              Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: CarouselSlider(
                            items: imageList
                                .map(
                                  (item) => Image.asset(
                                    item['image_path'],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                )
                                .toList(),
                            carouselController: carouselController,
                            options: CarouselOptions(
                              scrollPhysics: const BouncingScrollPhysics(),
                              autoPlay: true,
                              aspectRatio: 2,
                              viewportFraction: 1,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                            ),
                          ),
                        ),
                      ),

                      //Below POSITIONED widget is used for navigational dots of Carousel
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: imageList.asMap().entries.map((entry) {
                            // print(entry);
                            // print(entry.key);
                            return GestureDetector(
                              onTap: () =>
                                  carouselController.animateToPage(entry.key),
                              child: Container(
                                width: currentIndex == entry.key ? 7 : 7,
                                height: 7.0,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: currentIndex == entry.key
                                      ? Color(0xff922820)
                                      : Colors.white,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              //WELCOME
              Row(
                children: [
                  //Below container is for black line
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 3),
                    child: Container(
                      height: 1.0,
                      width: 50,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'WELCOME,',
                    style: TextStyle(fontFamily: 'Bebes Neus', fontSize: 22),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),

              //Intro Text
              Container(
                width: 380,
                child: Text(
                  'Indulge in the timeless delight of Salman Bakers, crafting buttery perfection'
                  ' since 1991. Here every tap brings you closer to the melt-in-your-mouth goodness'
                  ' that has defined our legacy. Savor the tradition, embrace the taste!',
                  style: TextStyle(
                      fontFamily: 'BilboSwashCaps',
                      fontSize: 28,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              //WE offer
              Row(
                children: [
                  //Below container is for black line
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 3),
                    child: Container(
                      height: 1.0,
                      width: 50,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'WE OFFER:',
                    style: TextStyle(fontFamily: 'Bebes Neus', fontSize: 22),
                  ),
                ],
              ),


              //1ST
              InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)
                => product_list1()
                )
                );
              },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow:[
                          BoxShadow(
                              color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(0,10),
                          ),
                        ],
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(20)),

                    width: 370,
                    height: 140,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Text(
                              'CAKES',
                              style: TextStyle(
                                  fontFamily: 'Bebes Neus',
                                  fontSize: 30,
                                  color: Color(0xff922820)),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 100),
                          child: Image(width: 120,height: 120,image: AssetImage('assets/cake.png')),
                        )
                      ],
                    ),

                  ),
                ),
              ),
              //2ND
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)
                  => product_list2(),
                  )
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(boxShadow:[BoxShadow(color: Colors.grey,
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(0,10),)] ,color: Color(0xffFFFFFF),borderRadius: BorderRadius.circular(20)),

                    width: 370,
                    height: 140,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(fit: BoxFit.fitHeight,image: AssetImage('assets/pngtree-cake-ice-cream-cake-on-background-honeyed-photo-png-image_13531035 1.png')),
                        Padding(
                          padding: const EdgeInsets.only(right: 15,left: 100),
                          child: Text(
                            'PASTRIES',
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
              ),
              //3RD
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)
                  => product_list3()
                  )
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(boxShadow:[BoxShadow(color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0,10),)] ,color: Color(0xffFFFFFF),borderRadius: BorderRadius.circular(20)),

                    width: 370,
                    height: 140,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Text(
                            'SWEETS',
                            style: TextStyle(
                                fontFamily: 'Bebes Neus',
                                fontSize: 30,
                                color: Color(0xff922820)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 80),
                          child: Image(fit: BoxFit.fitHeight,image: AssetImage('assets/gulab-jamun-samosa-indian-cuisine-ras-malai-south-asian-sweets-indian-sweets 1.png')),
                        ),
                      ],
                    ),

                  ),
                ),
              ),
              //4TH
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)
                  => product_list4()
                  )
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(boxShadow:[BoxShadow(color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(0,10),)] ,color: Color(0xffFFFFFF),borderRadius: BorderRadius.circular(20)),

                    width: 370,
                    height: 140,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 60),
                          child: Image(fit: BoxFit.fitHeight,image: AssetImage('assets/samosa-pakora-indian-cuisine-take-out-roti-samosa 1.png')),
                        ),
                        SizedBox(width: 30,),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Text(
                            'SNACKES',
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
              ),

              //This container contains Tabs
            ],
          ),
        ),
      ),
    );
  }
}



