import 'package:flutter/material.dart';
import 'package:summative/constant.dart';
import 'package:summative/login_screen.dart';
import 'package:summative/signin_screen.dart';



class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(

      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/5.png")),
                  color: kPrimaryColor,
                ),
              ),
          ),
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(textAlign: TextAlign.center,
                      text: TextSpan(

                    children: [
                      TextSpan(
                        text: "Welcome to Seeka\n",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,

                        )
                      ),
                      TextSpan(
                        text: "Get loans quickly without any struggle",
                        style: TextStyle(

                          fontSize: 15,
                          fontWeight: FontWeight.w200,
                          color: Colors.white,
                        )
                      )
                    ]
                  ),
                  ),
              FittedBox(
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Signin_screen();
                    }));
                  },
                  child:Padding(
                    padding: const EdgeInsets.only(bottom: 90),

                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: kPrimaryColor2,
                    ),
                    child: Row(
                      children: [
                        Text("Let's get started",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                        ),
                        Icon(Icons.arrow_forward_sharp,color: Colors.black,)
                      ],
                    ),
                  ),),),)
                ],
              ))
        ],
      ),
    );
}


}


