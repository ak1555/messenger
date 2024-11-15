import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  final CollectionReference usrs =
      FirebaseFirestore.instance.collection("user");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.teal.shade50,
        child: StreamBuilder(
          stream: usrs.orderBy('username').snapshots(),
          builder: (context, snapshot) {
            print("11111111111111111111111233333333335444444444896");
            print(snapshot.data!.docs.length);

            print(
                "11111111111122222222222222333333333444444444455555555666666666777888889");
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot logedusers = snapshot.data!.docs[index];
                print(logedusers["username"]);
                return Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.white,
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(logedusers["username"]),
                );
                // return ListTile(
                //   title: Text(logedusers["username"]),
                // );
              },
            );
          },
        ),
      ),
    );
  }
}
