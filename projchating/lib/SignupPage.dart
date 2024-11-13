import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool Check1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(255, 242, 248, 242),
        child: Center(
          child: Container(
            height: 500,
            width: 550,
            margin: EdgeInsets.only(left: 20, right: 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(
                    // color: const Color.fromARGB(255, 3, 39, 1)
                    color: Colors.grey.shade700),
                borderRadius: BorderRadius.circular(15)),
            child: ListView(
              children: [
                Container(
                    height: 25,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      "SIGNUP",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.4,
                          shadows: [
                            Shadow(
                                color: Colors.white,
                                blurRadius: 3,
                                offset: Offset(3, 5))
                          ]),
                    )),
                SizedBox(
                  height: 45,
                ),
                Container(
                  height: 65,
                  width: 450,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 231, 235, 229),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white,
                            blurRadius: 5,
                            spreadRadius: 2,
                            offset: Offset(1.5, 4))
                      ]),
                  child: Row(
                    children: [
                      Icon(
                        Icons.email,
                        size: 30,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Email"),
                      ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 45,
                ),

                Container(
                  height: 65,
                  width: 450,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      // color: const Color.fromARGB(255, 214, 221, 213),
                      color: const Color.fromARGB(255, 231, 235, 229),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white,
                            blurRadius: 5,
                            spreadRadius: 2,
                            offset: Offset(1.5, 4))
                      ]),
                  child: Row(
                    children: [
                      Icon(
                        Icons.remove_red_eye,
                        size: 30,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: TextField(
                        obscureText: Check1,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Password"),
                      ))
                    ],
                  ),
                ),

                SizedBox(
                  height: 35,
                ),
                Container(
                  height: 60,
                  width: 450,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 214, 221, 213),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white,
                            blurRadius: 5,
                            spreadRadius: 2,
                            offset: Offset(1.5, 4))
                      ]),
                  child: Row(
                    children: [
                      Icon(
                        Icons.remove_red_eye,
                        size: 30,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Conform-password"),
                      ))
                    ],
                  ),
                ),
                Container(
                  height: 20,
                  width: 450,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Checkbox(
                        value: Check1,
                        onChanged: (value) {
                          setState(() {
                            Check1 = !Check1;
                          });
                        },
                      ),
                      Text("Show password")
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  width: 450,
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(
                              left: 60, right: 60, top: 10, bottom: 10),
                          backgroundColor:
                              const Color.fromARGB(255, 231, 235, 229)),
                      onPressed: () {},
                      child: Text(
                        "SIGNUP",
                        style: TextStyle(
                            fontSize: 17,
                            letterSpacing: 1.1,
                            color: Colors.black),
                      )),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 25,
                  width: 450,
                  alignment: Alignment.center,
                  child: Text(
                    "OR",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                //   ElevatedButton(onPressed: () {

                // }, child: Text("signin"))

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 45,
                      width: 150,
                      padding: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all()),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 50,
                            child: Image.asset("./images/google.png"),
                          ),
                          Text(
                            "SIGNIN",
                            style: TextStyle(
                                letterSpacing: 1, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
