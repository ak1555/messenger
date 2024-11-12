import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                border: Border.all(color: const Color.fromARGB(255, 3, 39, 1)),
                borderRadius: BorderRadius.circular(15)),
            child: ListView(
              children: [
                Container(
                    height: 40,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      "LOGIN",
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
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Password"),
                      ))
                    ],
                  ),
                ),
                Container(
                  height: 20,
                  width: 450,
                  child: Row(
                    children: [Text("Show password")],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                //   Container(
                //   height: 60,
                //   width: 450,
                //   padding: EdgeInsets.only(left: 10, right: 10),
                //   decoration: BoxDecoration(
                //       color: const Color.fromARGB(255, 214, 221, 213),
                //       borderRadius: BorderRadius.circular(25),
                //       boxShadow: [
                //         BoxShadow(
                //             color: Colors.white,
                //             blurRadius: 5,
                //             spreadRadius: 2,
                //             offset: Offset(1.5, 4))
                //       ]),
                //   child: Row(
                //     children: [
                //       Icon(
                //         Icons.remove_red_eye,
                //         size: 30,
                //       ),
                //       SizedBox(
                //         width: 8,
                //       ),
                //       Expanded(
                //           child: TextField(
                //         decoration: InputDecoration(border: InputBorder.none,hintText: "Conform-password"),
                //       ))
                //     ],
                //   ),
                // ),

                Container(
                  height: 60,
                  width: 450,
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(
                              left: 60, right: 60, top: 10, bottom: 10)),
                      onPressed: () {},
                      child: Text(
                        "SIGNIN",
                        style: TextStyle(fontSize: 17, letterSpacing: 1.1),
                      )),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  width: 450,
                  child: Divider(),
                ),
                SizedBox(
                  height: 22,
                ),
                //   ElevatedButton(onPressed: () {

                // }, child: Text("signin"))
                Row(
                  children: [
                    Text(
                      "         CREATE AN ACCOUNT         ",
                      style: TextStyle(fontSize: 11),
                    ),
                    Container(
                      height: 35,
                      width: 100,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 231, 235, 229),
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              foregroundColor: Colors.black),
                          onPressed: () {},
                          child: Text("SIGNUP")),
                    )
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
