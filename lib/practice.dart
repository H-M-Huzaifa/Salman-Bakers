import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class practice extends StatefulWidget {
  const practice({super.key});

  @override
  State<practice> createState() => _practiceState();
}

class _practiceState extends State<practice> {

//   List<PostModel2> apple = [];
// Future<List<PostModel2>> myfnc() async {
//   final response =  await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
//
//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body.toString());
//     for (Map i in data) {
//       apple.add(PostModel2.fromJson(i));
//     }
//     return apple;
//   } else {
//     return apple;
//   }
// }




@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('REST API "No Array"'),
    ),
    body:
      Text('Hello'),

  );
}
}





// Center(
//   child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       Expanded(
//         child: FutureBuilder(future:myfnc(),builder: (context, snapshot) {
//           if(snapshot.hasData){
//
//             return ListView.builder(itemCount:apple.length,
//               itemBuilder: (context, index) {
//                 return CircleAvatar(maxRadius: 100,backgroundImage: NetworkImage(snapshot.data![index].url.toString()),);
//               },);
//
//           }else{
//              return Row(
//                crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
//                children: [
//                  Center(child: Text('Loading....',style:  TextStyle(
//                     fontFamily: 'Bebes Neus',
//                     fontSize: 30,
//                     color: Color(0xff922820)),)),
//                  SizedBox(width: 20,),
//                  CircularProgressIndicator(),
//                ],
//              );
//
//
//           }
//
//         },),
//       )
//     ],
//
//   ),
// ),




