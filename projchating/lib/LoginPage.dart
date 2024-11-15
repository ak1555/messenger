import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final CollectionReference Usr = FirebaseFirestore.instance.collection("user");
  void login() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _email.text.trim(), password: _password.text.trim());
    print("=========================================================");
    print(user.user!.uid);
    print(user.user!.displayName);
    print("=========================================================");
    var uname = user.user!.uid;
    var uid = user.user!.displayName;
    // final userid = {
    //   "userid": uid,
    //   "username": uname
    // };
    // Usr.add(userid);
    adduse(uid, uname);
  }

  void adduse(userid, username) async {
    QuerySnapshot querySnapshot =
        await Usr.where("userid", isEqualTo: userid).get();
    if (querySnapshot.docs.isEmpty) {
      Usr.add({"userid": userid, "username": username});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(255, 248, 255, 248),
        // color: const Color.fromARGB(255, 226, 245, 252),
        // color: const Color.fromARGB(255, 212, 255, 251),
        // color: const Color.fromARGB(255, 190, 152, 255),
        child: Center(
          child: Container(
            height: 515,
            width: 550,
            margin: EdgeInsets.only(left: 20, right: 20),
            // padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                // border: Border.all(
                //     // color: const Color.fromARGB(255, 3, 39, 1)
                //     color: Colors.grey.shade700),
                // borderRadius: BorderRadius.circular(15)
                ),
            child: ListView(
              children: [
                Container(
                    height: 25,
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
                                color: Colors.grey,
                                blurRadius: 3,
                                offset: Offset(1, 1))
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
                      // color: const Color.fromARGB(255, 231, 235, 229),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 3,
                            // spreadRadius: 5,
                            offset: Offset(3, 3))
                      ]),
                  child: Row(
                    children: [
                      // Icon(
                      //   Icons.email,
                      //   size: 30,
                      // ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: TextField(
                        controller: _email,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.blue)),
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
                  // decoration: BoxDecoration(
                  //     // color: const Color.fromARGB(255, 214, 221, 213),
                  //     color: const Color.fromARGB(255, 231, 235, 229),
                  //     borderRadius: BorderRadius.circular(25),
                  //     boxShadow: [
                  //       BoxShadow(
                  //           color: Colors.white,
                  //           blurRadius: 5,
                  //           spreadRadius: 2,
                  //           offset: Offset(1.5, 4))
                  //     ]),
                  decoration: BoxDecoration(
                      // color: const Color.fromARGB(255, 231, 235, 229),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 3,
                            // spreadRadius: 5,
                            offset: Offset(3, 3))
                      ]),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: TextField(
                        controller: _password,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.blue)),
                      )),
                      Icon(
                        Icons.remove_red_eye,
                        size: 25,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "forgot");
                  },
                  child: Container(
                    height: 20,
                    width: 450,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Forgot password  ",
                          style: TextStyle(
                              // decoration: TextDecoration.underline,
                              color: Colors.blue.shade900),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 55,
                  width: 450,
                  // alignment: Alignment.center,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          padding: EdgeInsets.only(
                              left: 60, right: 60, top: 10, bottom: 10),
                          backgroundColor:
                              // const Color.fromARGB(255, 231, 235, 229)
                              const Color.fromARGB(255, 134, 175, 211)),
                      onPressed: () {
                        login();
                      },
                      child: Text(
                        "SIGNIN",
                        style: TextStyle(
                            fontSize: 17,
                            letterSpacing: 1.1,
                            color: Colors.white),
                      )),
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  height: 1,
                  width: 450,
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Divider(),
                ),
                SizedBox(
                  height: 35,
                ),
                //   ElevatedButton(onPressed: () {

                // }, child: Text("signin"))
                Row(
                  children: [
                    Text(
                      "         DON'T HAVE AN ACCOUNT?   ",
                      style: TextStyle(fontSize: 11),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "signup");
                      },
                      child: Text(
                        "SIGNUP",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            letterSpacing: 1,
                            color: Colors.blue),
                      ),
                    )
                    // Container(
                    //   height: 35,
                    //   width: 109,
                    //   child: ElevatedButton(
                    //       style: ElevatedButton.styleFrom(
                    //           backgroundColor:
                    //               // const Color.fromARGB(255, 231, 235, 229),
                    //               //  const Color.fromARGB(255, 128, 216, 248),
                    //               Colors.blue.shade200,
                    //           shape: BeveledRectangleBorder(
                    //               borderRadius: BorderRadius.circular(5)),
                    //           foregroundColor: Colors.black),
                    //       onPressed: () {
                    //         Navigator.pushNamed(context, "signup");
                    //       },
                    //       child: Text("SIGNUP",style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: 1,color: Colors.black),)),
                    // )
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
