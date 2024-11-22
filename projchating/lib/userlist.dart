import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  List<Map<dynamic, dynamic>> ls = [];
  final CollectionReference usrs =
      FirebaseFirestore.instance.collection("user");
  final mybox = Hive.box('mybox');

  void getuser() async {
    // CollectionReference usrs = FirebaseFirestore.instance.collection("user");
    QuerySnapshot querySnapShot = await usrs.get();

    setState(() {
      ls = querySnapShot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
    print(ls);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ls.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.teal.shade50,
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    alignment: Alignment.center,
                    color: const Color.fromARGB(255, 127, 161, 189),
                    child: Text(
                      "PEOPLES",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                  ),
                  Container(
                    height: 600,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: ls.length,
                      itemBuilder: (context, index) {
                        var use = ls[index];
                        return GestureDetector(
                          onTap: () {
                            print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
                            print(use["userid"]);
                            String uid = use["userid"];
                            String unme = use["username"];
                            mybox.put(2, uid);
                            mybox.put(3, unme);
                            Navigator.pushNamed(context, "chat");
                          },
                          child: Container(
                            height: 79,
                            decoration: BoxDecoration(
                                // color:  const Color.fromARGB(255, 86, 49, 250),
                          
                                color: const Color.fromARGB(255, 184, 206, 224),
                                borderRadius: BorderRadius.circular(10)),
                            margin:
                                EdgeInsets.only(left: 11, right: 11, bottom: 15),
                            width: double.infinity,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 15, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  use["username"] ?? "No name",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  height: 62,
                                  width: 62,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color:
                                        const Color.fromARGB(255, 229, 234, 238),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),

              // child: StreamBuilder(
              //   stream: usrs.orderBy('username').snapshots(),
              //   builder: (context, snapshot) {
              //     print("11111111111111111111111233333333335444444444896");
              //     print(snapshot.data!.docs.length);

              //     print(
              //         "11111111111122222222222222333333333444444444455555555666666666777888889");
              //     return ListView.builder(
              //       itemCount: snapshot.data!.docs.length,
              //       itemBuilder: (context, index) {
              //         final DocumentSnapshot logedusers = snapshot.data!.docs[index];
              //         print(logedusers["username"]);
              //         return Container(
              //           height: 50,
              //           width: double.infinity,
              //           color: Colors.white,
              //           margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              //           alignment: Alignment.centerLeft,
              //           child: Text(logedusers["username"]),
              //         );
              //         // return ListTile(
              //         //   title: Text(logedusers["username"]),
              //         // );
              //       },
              //     );
              //   },
              // ),
            ),
    );
  }
}
