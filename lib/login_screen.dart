import 'package:flutter/material.dart';
import 'package:summative/constant.dart';

class Login_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/user (2).png"))),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Log In",
                        style: TextStyle(
                          fontSize: 20,
                          color: kPrimaryColor,
                        ),
                      ),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 20,
                          color: kPrimaryColor3,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.perm_identity_sharp,
                          color: kPrimaryColor,
                        ),
                      ),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(hintText: "Username"),
                      ))
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.lock_outline_sharp,
                          color: kPrimaryColor,
                        ),
                      ),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(hintText: "Password"),
                      ))
                    ],
                  ),
                  Spacer(),
                  FittedBox(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Login_screen();
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
                              Text("Login",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              //Icon(Icons.arrow_forward_sharp,color: Colors.black,)
                            ],
                          ),
                        ),),),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
