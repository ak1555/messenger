import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> ls = [];

  final mybox = Hive.box("mybox");

  void getchats() {
    if (mybox.get(4) != null) {
      setState(() {
        ls = mybox.get(4);
      });
    }
    print("PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP");
    print(mybox.get(4));
    print(ls.length);
    print(ls);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getchats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   height: 50,
            //   width: 100,
            //   color: Colors.blue,
            // ),
            ElevatedButton(
                onPressed: () async {
                  // await FirebaseAuth.instance.signOut();
                  final googlesignin = GoogleSignIn();
                  try {
                    if (await googlesignin.isSignedIn()) {
                      await googlesignin.signOut();
                      await FirebaseAuth.instance.signOut();

                      if (await googlesignin.isSignedIn()) {
                        await googlesignin.disconnect();
                      }
                    } else {
                      print("user not Signed in");
                      await FirebaseAuth.instance.signOut();
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text("LOGOUT")),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // automaticallyImplyLeading: false,
        // leading: IconButton(onPressed: () {
        //   Scaffold.of(context).openDrawer();
        // }, icon: Icon(Icons.menu),tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,),
        actions: [
          // ElevatedButton(
          //     onPressed: () async {
          //       await FirebaseAuth.instance.signOut();
          //     },
          //     child: Text("LOGOUT")),
          Container(
            height: 50,
            width: 50,
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(100)),
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 40, 79, 255),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.centerRight,
                      colors: [
                        const Color.fromARGB(255, 54, 62, 88),
                        const Color.fromARGB(255, 79, 91, 128),
                      ]),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(50))),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      height: 185,
                      width: double.infinity,
                      padding: EdgeInsets.only(bottom: 45),
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(55)),
                          margin: EdgeInsets.only(left: 15, right: 15),
                          padding: EdgeInsets.only(left: 7, right: 7),
                          child: Row(
                            children: [
                              Icon(Icons.search),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                  child: TextField(
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                              )),
                              SizedBox(
                                width: 3,
                              )
                            ],
                          )))
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .8 / 1.1,
              child: ls.length == 0
                  ? Center(
                      child: Text("No Messages..."),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height * .8 / 1.1,
                      alignment: Alignment.centerRight,
                      child: ListView.builder(
                        itemCount: ls.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 65,
                            width: double.infinity,
                            child: Row(
                              children: [
                                Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      color: Colors.brown.shade50,
                                      borderRadius: BorderRadius.circular(100)),
                                ),
                                Container(
                                  height: 65,
                                  child: Text(ls[index].toString()),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 79, 91, 128),
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.pushNamed(context, "users");
        },
        child: Icon(
          Icons.add,
          size: 33,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
