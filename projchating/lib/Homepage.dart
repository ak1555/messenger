import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 50,
              width: 100,
              color: Colors.blue,
            ),
            ElevatedButton(
                onPressed: () async {
                  // await FirebaseAuth.instance.signOut();
                  final googlesignin =GoogleSignIn();
                  try{
                    if(await googlesignin.isSignedIn()){
                      await googlesignin.signOut();
                      await FirebaseAuth.instance.signOut();

                        if(await googlesignin.isSignedIn()){
                      await googlesignin.disconnect();
                    }
                    }
                  else{
                    print("user not Signed in");
                  }
                  }catch(e){
                    print(e);
                  }
                },
                child: Text("LOGOUT")),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          // ElevatedButton(
          //     onPressed: () async {
          //       await FirebaseAuth.instance.signOut();
          //     },
          //     child: Text("LOGOUT")),
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 40, 158, 255),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(55))),
              child: Column(
                children: [
                  Row(
                    children: [
                      // Icon(Icons.equalizer_rounded),
                      // IconButton(onPressed: () {

                      // }, icon: Icon(Icons.add))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
