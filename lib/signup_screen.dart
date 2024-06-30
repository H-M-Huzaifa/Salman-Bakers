
import 'package:http/http.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salman/home_screen.dart';



class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();




  void login(String email, String password)async{
    try{
      Response response = await post(Uri.parse('https://reqres.in/api/register'),
          body:{
    'email' : email,
    'password' : password,
    }
            );
    if(response.statusCode== 200){
    print('success');
    }else{
    print('error');
    }
    }
    catch(e){
    print(e.toString());

    }
  }



  ScrollController _scrollController =ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFEFEF),
      body: Center( //Center is used to avoid Keyboard overflowd error when fillng textfield
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage('assets/Component 7.png')),
                  SizedBox(height: 100,),

                  //Email
                  TextField(
                    controller: emailController,
                    onTap: (){

                      _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease);

                    },
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide:
                          BorderSide(width: 1, color: Colors.black87),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide:
                          BorderSide(width: 2, color: Colors.green),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                        prefixIcon: Icon(Icons.email),
                        hintText: 'abc123@xyz.com',
                        hintStyle: TextStyle(color: Colors.grey),
                        labelText: 'Email',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold)
                    ),

                  ),


                  SizedBox(
                    height: 20,
                  ),

                  //Password
                  TextField(
                    controller: passwordController,
                    onTap: (){
                      _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease);

                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 2, color: Colors.green),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide:
                          BorderSide(width: 1, color: Colors.black),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.visibility_off)),
                        hintText: 'at least 6 characters',
                        hintStyle: TextStyle(color: Colors.grey),
                        labelText: 'Password',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold)
                    ),
                  ),

                  // TextFormField(
                  //
                  //   decoration: InputDecoration(
                  //     hintText: 'Name',
                  //     labelText: 'Enter email or phone number',
                  //   ),
                  // ),
                  // TextFormField(
                  //   decoration: InputDecoration(
                  //     hintText: 'password',
                  //     labelText: 'Password',
                  //   ),
                  // ),

                  SizedBox(height: 40,),

                  //SignIn Button
                  InkWell(
                    onTap: (){
                      login(emailController.text.toString(), passwordController.text.toString());
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
                      => home_screen()
                      )
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xff922820),
                      ),
                      height: 50,
                      width: 110,
                      child: Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),

                  //Don't have account?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70 ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?",style: TextStyle(color: Colors.black,)),
                        SizedBox(width: 5,),
                        Text("Sign up",style: TextStyle(color: Color(0xff922820),fontWeight: FontWeight.bold,fontSize: 17),),
                      ],
                    ),
                  ),

                  SizedBox(height: 15,),

                  //Logos
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Image(image: AssetImage('assets/logos_facebook.png'),width: 50,height: 50,),
                      SizedBox(width: 5,),
                      Image(image: AssetImage('assets/flat-color-icons_google.png'),width: 50,height: 50,),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
