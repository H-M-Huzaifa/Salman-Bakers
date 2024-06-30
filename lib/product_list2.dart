import 'package:flutter/material.dart';

import 'package:salman/prod_descrip1.dart';

class product_list2 extends StatefulWidget {
  const product_list2({super.key});

  @override
  State<product_list2> createState() => _product_list2State();
}

class _product_list2State extends State<product_list2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xffEFEFEF),
      appBar: AppBar(
          title: Text('Pastries',style: TextStyle(
              fontFamily: 'Bebes Neus',
              fontSize: 30,
              color: Color(0xff922820)),),
          centerTitle: true,
          backgroundColor: Color(0xffFFD29F)),
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
                    InkWell(onTap: (){
                      // // Navigator.push(context, MaterialPageRoute(builder: (context) => prod_descrip1(),));
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
                              Image(image: AssetImage('assets/pngtree-cake-ice-cream-cake-on-background-honeyed-photo-png-image_13531035 1.png'),width: 200,height: 130,),
                              SizedBox(
                                height: 5,
                              ),

                              //Price
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                                child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rs 600/-',
                                      style: TextStyle(
                                        fontSize: 22, fontWeight: FontWeight.bold,),
                                    ),
                                  ],
                                ),
                              ),

                              Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text('Choclate Fudge', style: TextStyle(fontFamily: 'Bebes Neus',fontSize: 20),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text('1 Pound', style: TextStyle(fontFamily: 'Bebes Neus',fontSize: 20,color: Color(0xffAFAFAF)),),
                                      )
                                    ],
                                  ),
                                  SizedBox(width: 20,),
                                  IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined,size:30,),)
                                ],),
                            ],
                          ),
                        ),
                      ),
                    ),

                    //Right list items
                    InkWell(
                      onTap: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => prod_descrip1(),));
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
                              Image(image: AssetImage('assets/pngtree-cake-ice-cream-cake-on-background-honeyed-photo-png-image_13531035 1.png'),width: 200,height: 130,),
                              SizedBox(
                                height: 5,
                              ),

                              //Price
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                                child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rs 600/-',
                                      style: TextStyle(
                                        fontSize: 22, fontWeight: FontWeight.bold,),
                                    ),
                                  ],
                                ),
                              ),

                              Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text('Choclate Fudge', style: TextStyle(fontFamily: 'Bebes Neus',fontSize: 20),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text('1 Pound', style: TextStyle(fontFamily: 'Bebes Neus',fontSize: 20,color: Color(0xffAFAFAF)),),
                                      )
                                    ],
                                  ),
                                  SizedBox(width: 20,),
                                  IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined,size:30,),)
                                ],),
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
        itemCount: 10,
      ),
    );
  }
}
