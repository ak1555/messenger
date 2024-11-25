import 'package:cloud_firestore/cloud_firestore.dart';
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
  List li=[];
  List person=[];
  
  final mybox = Hive.box("mybox");
  final CollectionReference msg = FirebaseFirestore.instance.collection("messages");
  final CollectionReference usr = FirebaseFirestore.instance.collection("user");
  void getchats() async{
    QuerySnapshot  MESSAGES = await msg.get();
    QuerySnapshot  USERS = await usr.get();
    final me = mybox.get(1);
    setState(() {
       ls = MESSAGES.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });

    setState(() {
       li = USERS.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
try{
for(int i =0;i<=ls.length;i++){

   if(li[i]["receiver"]==ls[i]["userid"]&&li[i]["userid"]!=me){
  setState(() {
    Map m={"name":li[i]["username"],"id":li[i]["userid"]};
    person.add(m);
  });
 }}
//  print(person);
}catch(e){
  print("trytrytrytrytrytrytrytrytrytrytrytrytrytrytrytrytrytrytry");
  print(e);
}

   


print(ls);
print(li);
print(person);

    // if (mybox.get(4) != null) {
    //   setState(() {
    //     ls = mybox.get(4);
    //   });
    // }
    // print("PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP");
    // print(mybox.get(4));
    // print(ls.length);
    // print(ls);

  }

  //   Stream<QuerySnapshot> getMessages(String sender, String receiver) {
  //   return FirebaseFirestore.instance
  //       .collection("messages")
  //       .where("sender", whereIn: [sender, receiver])
  //       .orderBy("timestamp", descending: false)
  //       .snapshots();
  // }

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
       
        actions: [
         
          Container(
            height: 50,
            width: 50,
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(100)),
                child: Icon(Icons.person,size: 33,),
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
              // height: MediaQuery.of(context).size.height * .8 / 1.1,
              width: double.infinity,alignment: Alignment.topCenter,
              child:
               ls.length == 0
                  ? Container(height:MediaQuery.of(context).size.height * .8 / 1.1 ,width: double.infinity,
                    child: Center(
                        child: Text("No Messages..."),
                      ),
                  )
                  : 
                  Container(
                      height: MediaQuery.of(context).size.height * .8 / 1.1,
                      alignment: Alignment.centerRight,
                      child: ListView.builder(
                        itemCount: person.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              mybox.put(2, person[index]["id"].toString());
                              mybox.put(3, person[index]["name"].toString());
                              Navigator.pushNamed(context, "chat");
                            },
                            child: Container(
                              height: 65,
                              width: double.infinity,
                              margin: EdgeInsets.only(top: 7,bottom: 7,left: 10,right: 10),
                              child: Row(
                                children: [
                                  Container(
                                    height: 55,
                                    width: 55,
                                    decoration: BoxDecoration(
                                        color: Colors.brown.shade50,
                                        borderRadius: BorderRadius.circular(100),),child: Icon(Icons.person,size: 35,color:   const Color.fromARGB(255, 54, 62, 88),),
                                  ),SizedBox(width: 10,),
                                  Container(
                                    height: 65,
                                    alignment: Alignment.centerLeft,
                                    child: Text(person[index]["name"].toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,letterSpacing: .3,wordSpacing: .5),),
                                  )
                                ],
                              ),
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
