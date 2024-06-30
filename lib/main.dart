import 'package:flutter/material.dart';
import 'package:salman/Cart%20&%20DB/cart_provider.dart';
import 'package:salman/home_screen.dart';
import 'package:salman/practice.dart';
import 'package:salman/signup_screen.dart';
import 'package:salman/splash_srceen.dart';
import 'package:provider/provider.dart';

void main()  {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CartProvider(),
      child: Builder(builder: (BuildContext context){
        return MaterialApp(
          title: 'Salman',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // This is the theme of your application.
            //
            // TRY THIS: Try running your application with "flutter run". You'll see
            // the application has a blue toolbar. Then, without quitting the app,
            // try changing the seedColor in the colorScheme below to Colors.green
            // and then invoke "hot reload" (save your changes or press the "hot
            // reload" button in a Flutter-supported IDE, or press "r" if you used
            // the command line to start the app).
            //
            // Notice that the counter didn't reset back to zero; the application
            // state is not lost during the reload. To reset the state, use hot
            // restart instead.
            //
            // This works for code too, not just values: Most code changes can be
            // tested with just a hot reload.
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
            textTheme: TextTheme(headline1: TextStyle(color: Colors.orange)),
            useMaterial3: true,
          ),

          home: splash_screen(),

          //For professional routing....(see below)
          //initialRoute: RouteName.homescreen
          //onGenerateRoute: Routes.generateRoute,

          //For a screen...
          //Navigator.pushNamed(context, RouteName.homescreen )
        );
      } ,));

  }



  }


