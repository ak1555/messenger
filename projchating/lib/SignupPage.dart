import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:projchating/MainPage.dart';
import 'package:projchating/providerr/provide.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _cpassword = TextEditingController();
  final CollectionReference Usr = FirebaseFirestore.instance.collection("user");
  bool Check1 = true;

  void signup() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text.trim(), password: _password.text.trim());
  }

  void adduse(userid, username) async {
    QuerySnapshot querySnapshot =
        await Usr.where("userid", isEqualTo: userid).get();
    if (querySnapshot.docs.isEmpty) {
      Usr.add({"userid": userid, "username": username});
    }
  }

  Future<void> googlesignin() async {
    final firebaseauth = await FirebaseAuth.instance;
    final googleservice = await GoogleSignIn();
    final googleuser = await googleservice.signIn();
    final GoogleSignInAuthentication? auth = await googleuser?.authentication;
    final cred = GoogleAuthProvider.credential(
        accessToken: auth?.accessToken, idToken: auth?.idToken);
    final person = firebaseauth.signInWithCredential(cred);
    print(
        "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    print(googleuser!.id);
    print(googleuser!.displayName);
    print(
        "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    var Uid = googleuser!.id;
    var uname = googleuser!.displayName;
    // final userid = {"userid": uid, "username": uname};
    // Usr.add(userid);

    adduse(Uid, uname);

    Provider.of<Pro>(context, listen: false).setUid(Uid ?? "");
    print(
        "tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt");
    print(Provider.of<Pro>(context, listen: false).uid);
    print(
        "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(255, 242, 248, 242),
        child: Center(
          child: Container(
            height: 650,
            width: 550,
            margin: EdgeInsets.only(left: 15, right: 15),
            // padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                // border: Border.all(
                //     // color: const Color.fromARGB(255, 3, 39, 1)
                //     color: Colors.grey.shade700),
                borderRadius: BorderRadius.circular(15)),
            child: ListView(
              children: [
                Container(
                    height: 28,
                    width: double.infinity,
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "SIGNUP",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.4,
                          shadows: [
                            Shadow(
                                color: Colors.grey,
                                blurRadius: 3,
                                offset: Offset(1.5, 1.5))
                          ]),
                    )),
                SizedBox(
                  height: 42,
                ),
                Container(
                  height: 65,
                  width: 450,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  // margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      // color: const Color.fromARGB(255, 231, 235, 229),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            // spreadRadius: 2,
                            offset: Offset(1.5, 4))
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
                            color: Colors.grey,
                            blurRadius: 5,
                            // spreadRadius: 2,
                            offset: Offset(1.5, 4))
                      ]),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.blue)),
                      )),
                      Icon(
                        Icons.remove_red_eye,
                        size: 25,
                      ),
                      SizedBox(
                        width: 5,
                      ),
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
                      // color: const Color.fromARGB(255, 231, 235, 229),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            // spreadRadius: 2,
                            offset: Offset(1.5, 4))
                      ]),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: TextField(
                        obscureText: Check1,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Conform-password",
                            hintStyle: TextStyle(color: Colors.blue)),
                      )),
                      Icon(
                        Icons.remove_red_eye,
                        size: 25,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
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
                      Text("hide password")
                    ],
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                Container(
                  height: 55,
                  width: 450,
                  // alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          padding: EdgeInsets.only(
                              left: 60, right: 60, top: 5, bottom: 5),
                          backgroundColor:
                              // const Color.fromARGB(255, 231, 235, 229)
                              const Color.fromARGB(255, 134, 175, 211)),
                      onPressed: () {
                        if (_password == _cpassword) {
                          signup();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("INCORRECT PASSWORDS")));
                        }
                      },
                      child: Text(
                        "SIGNUP",
                        style: TextStyle(
                            fontSize: 17,
                            letterSpacing: 1.1,
                            color: Colors.black),
                      )),
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  height: 25,
                  width: 450,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1,
                        width: 130,
                        child: Divider(),
                      ),
                      Text(
                        "  OR  ",
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(
                        height: 1,
                        width: 130,
                        child: Divider(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                //   ElevatedButton(onPressed: () {

                // }, child: Text("signin"))

                GestureDetector(
                  onTap: () {
                    googlesignin();
                     MainPage;
                  },
                  child: Container(
                    height: 43,
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 5, right: 5),
                    margin: EdgeInsets.only(left: 18, right: 18),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 30,
                          width: 40,
                          child: Image.asset("./images/google.png"),
                        ),
                        MaterialButton(
                          onPressed: () {
                            googlesignin();
                            MainPage;
                          },
                          child: Text(
                            "SIGNIN WITH GOOGLE",
                            style: TextStyle(
                                letterSpacing: 1, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
