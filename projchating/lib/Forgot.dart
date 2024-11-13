import 'package:flutter/material.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(255, 242, 248, 242),
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Container(
          height: 300,
          // width: 300,
          padding: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              border: Border.symmetric(vertical: BorderSide()),
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
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
              Container(
                height: 65,
                // width: 50,
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 231, 235, 229),
                    borderRadius: BorderRadius.circular(15),
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
                      // controller: _email,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Email"),
                    ))
                  ],
                ),
              ),
              Container(
                height: 50,
                // color: Colors.purple,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 50,
                      width: 140,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.grey.shade900,
                              backgroundColor:  const Color.fromARGB(255, 161, 177, 161),
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          onPressed: () {},
                          child: Text(
                            "SEND",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, letterSpacing: 1,fontSize: 16),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
