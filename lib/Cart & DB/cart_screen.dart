import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CartModel.dart';
import 'cart_provider.dart';
import 'db_helper.dart';



class cart_screen extends StatefulWidget {
  const cart_screen({super.key});

  @override
  State<cart_screen> createState() => _cart_screenState();
}

class _cart_screenState extends State<cart_screen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    DBHelper? dbHelper= DBHelper();
    return Scaffold(
      backgroundColor: Color(0xffEFEFEF),
      appBar: AppBar(
        backgroundColor:Color(0xffFFD29F),
        title: Text(
          'Cart',
          style: TextStyle(
              fontFamily: 'Bebes Neus', fontSize: 30, color: Color(0xff922820)),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,

      ),
      //Gradient Background
      // Container(
      //   decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xfffecd2),Color(0xfffcb69f),])),
      //
      // ),
      body:
        Column(
          children: [
            Expanded(
              child: FutureBuilder(
              future:  cart.getData(),
              builder: (context,AsyncSnapshot<List<Cart>> snapshot ){
                if(snapshot.hasData && snapshot.data!.isEmpty){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Center(child: Image.asset(width: 250,height: 250,'assets/bag.png')),
                    Text('Your Bag is empty',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Center(child: Text("Looks like you haven't added something to bag.",style: TextStyle(fontSize: 15,color: Colors.grey))),
                    Center(child: Text("Go ahead & explore our shelves.",style: TextStyle(fontSize: 15,color: Colors.grey))),
                  ],
                );


                }
                else{
                  return ListView.separated(itemBuilder:  (context, index)

                  {
                    return  ListTile(isThreeLine: true,

                      leading: Image.asset(snapshot.data![index].image.toString()),
                      title: Text(snapshot.data![index].productName.toString()),
                      contentPadding: EdgeInsets.only(left: 5,right: 5),
                      horizontalTitleGap: 10,

                      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Qty:' + snapshot.data![index].quantity.toString()),SizedBox(height: 5,),
                          Text('Rs.' + (snapshot.data![index].productPrices.toString()),)],),
                      trailing:
                      IconButton(onPressed: (){

                        dbHelper.delete(snapshot.data![index].id!);
                        cart.subcounter();
                        cart.subTotalPrice(int.parse(snapshot.data![index].productPrices.toString()));



                      },

                        icon: Icon(size: 30,Icons.delete),color: Colors.black,),





                    );

                  },
                      separatorBuilder: (context, index) => Divider(height: 50,),
                      itemCount: snapshot.data!.length);
                }
              },
              ),
            ),
            Consumer<CartProvider>(builder: (context, value, child){
              return Visibility(
                visible:  value.getTotalPrice().toString()=="0" ? false : true,
                child: Column(
                  children: [
                    ResusableWidget(title: 'Sub Total', value: 'Rs.' +value.getTotalPrice().toString()+ '/-',

                    ),

                    //Checkout Button
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: -2,
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
                            'Checkout',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            ),
          ],
        ),






    );





  }
}
class ResusableWidget extends StatelessWidget{
  final String title, value;
  const ResusableWidget({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(title,style: TextStyle(
                fontFamily: 'Bebes Neus',
                fontSize: 30,
                color: Color(0xff922820)),),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(value.toString(),style: TextStyle(
                fontFamily: 'Bebes Neus',
                fontSize: 30,
                color: Color(0xff922820)),),
          )
        ],),
    );
  }

}
