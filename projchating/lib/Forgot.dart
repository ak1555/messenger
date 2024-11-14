import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  TextEditingController _email = TextEditingController();
  void forgotpsd()async{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: _email.text.trim());
    showDialog(context: context, builder: (context) {
      return Card(
        child: Container(
          child: Text("send to email"),
        ),
      );
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(255, 242, 248, 242),
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(left: 15, right: 15,),
        child: Container(
          height: 300,
          // width: 300,
          padding: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              border: Border.symmetric(vertical: BorderSide()),
              borderRadius: BorderRadius.circular(25),
              color: const Color.fromARGB(255, 247, 250, 246),
              boxShadow: [
                BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 5,
                    offset: Offset(1, 1),
                    color: Colors.grey)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 5,),
              Container(
                height: 65,
                // width: 50,
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    // color: const Color.fromARGB(255, 231, 235, 229),
                    //  color: const Color.fromARGB(255, 247, 250, 246),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3,
                          // spreadRadius: 2,
                          offset: Offset(3,3))
                    ]),
                child: Row(
                  children: [
                    Icon(
                      Icons.email,
                      size: 25,color: const Color.fromARGB(255, 1, 83, 150),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: TextField(
                      controller: _email,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Email",hintStyle: TextStyle(color: Colors.blue)),
                    ))
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 1,
                width: double.infinity,
                child: Divider(),
              ),
              Container(
                height: 50,
                // color: Colors.purple,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 49,
                      width: 140,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.grey.shade900,
                              backgroundColor: 
                              //  const Color.fromARGB(255, 161, 177, 161),
                                const Color.fromARGB(255, 134, 175, 211),
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(2))),
                          onPressed: () {
                            forgotpsd();
                          },
                          child: Text(
                            "SEND",
                            style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold, letterSpacing: 1,fontSize: 16),
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(height: 1,)
            ],
          ),
        ),
      ),
    );
  }
}
