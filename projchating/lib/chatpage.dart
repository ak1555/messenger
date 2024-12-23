import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _message = TextEditingController();

  final mybox = Hive.box('mybox');
  String? sender;
  String? reciever;
  String? Receiver_name;
  void get_id() {
    sender = mybox.get(1);
    reciever = mybox.get(2);
    Receiver_name = mybox.get(3);
  }

  Future<void> add(String sender, String receiver, String message) async {
    await FirebaseFirestore.instance.collection("messages").add({
      "sender": sender,
      "receiver": receiver,
      "message": message.trim(),
      "timestamp": FieldValue.serverTimestamp(),
    });
    setState(() {
      _message.clear();
    });
  }

  Stream<QuerySnapshot> getMessages(String sender, String receiver) {
    return FirebaseFirestore.instance
        .collection("messages")
        .where("sender", whereIn: [sender, receiver])
        .where("receiver", whereIn: [sender, receiver])
        .orderBy("timestamp", descending: false)
        .snapshots();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_id();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          children: [
            Container(
                height: 105,
                width: double.infinity,
                // color: Colors.brown.shade100,
                decoration: BoxDecoration(
                  color:   const Color.fromARGB(255, 79, 91, 128),
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))
                ),
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(left: 5, right: 12, bottom: 13),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        // Navigator.popUntil(context, (route) {
                        //   return route.settings.name=="home";
                        // },);
                        // Navigator.pop(context);
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          "home",
                          (route) {
                            return false;
                          },
                        );
                      },
                      icon: Icon(Icons.arrow_back,color: Colors.white,),
                    ),
                    SizedBox(width: 2,),
                    Expanded(child: Text(Receiver_name.toString(),style: TextStyle(color: Colors.grey.shade50,fontWeight: FontWeight.w500,fontSize: 18),)),
                    SizedBox(width: 1,),
                    Container(
                      height: 53,
                      width: 53,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white),
                          child: Icon(Icons.person,size: 34,color:   const Color.fromARGB(255, 54, 62, 88),),
                    )
                  ],
                )),
            Expanded(
                child: StreamBuilder<QuerySnapshot>(
              stream: getMessages(sender!, reciever!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  print(
                      "++++++++++++++++===============================+++++++++++++++++++++");
                  print(snapshot.error);
                  print(
                      "++++++++++++++++===============================+++++++++++++++++++++");
                  return Center(
                    child: Text("Something went wrong"),
                  );
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text("No messages Yet"),
                  );
                }
                final message = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: message.length,
                  itemBuilder: (context, index) {
                    final messageData =
                        message[index].data() as Map<String, dynamic>;
                    print(messageData);
                    print(
                        "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%================");
                    print(messageData["message"]);
                    print(
                        "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%=================");
                    final isMe = messageData["sender"] == sender;
                    return Align(
                      alignment:
                          isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 11, right: 9, top: 5, bottom: 5),
                        padding: EdgeInsets.only(
                            left: 11.5, right: 11.5, top: 8.5, bottom: 8.5),
                        decoration: BoxDecoration(

                          boxShadow: [BoxShadow(blurRadius: 3,offset: Offset(1, 2),color: isMe?Colors.grey.shade700:Colors.grey.shade700)],
                            borderRadius: BorderRadius.circular(15),
                            color: isMe
                                ? 
                                     const Color.fromARGB(255, 159, 167, 190)
                                : Colors.brown.shade50),
                        child: Text(
                          messageData["message"],
                          style: TextStyle(fontSize: 16.5,
                              color: isMe ?   const Color.fromARGB(255, 54, 62, 88) : Colors.black),
                        ),
                      ),
                    );
                  },
                );
              },
            )),
            Container(
              height: 1,
              width: double.infinity,
              child: Divider(),
            ),
            Container(
              height: 80,
              width: double.infinity,
              margin: EdgeInsets.all(1.5),
              padding: EdgeInsets.only(left: 10, right: 10,bottom: 3),
              decoration: BoxDecoration(
                  // border: Border.all(),
                  ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 10, right: 10,),
                      decoration: BoxDecoration(
                          // color: Colors.brown.shade50,
                          // color:  const Color.fromARGB(255, 159, 167, 190),
                          // color:  const Color.fromARGB(255, 193, 200, 221),
                           color:  const Color.fromARGB(255, 216, 222, 241),
                          borderRadius: BorderRadius.circular(100)),
                      child: Row(
                        children: [
                          IconButton(onPressed: () {}, icon: Icon(Icons.mic,color:  const Color.fromARGB(255, 54, 62, 88),)),
                          Expanded(
                            child: TextField(
                              controller: _message,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Type Messages...",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        // color: Colors.brown.shade50,
                        //  color:  const Color.fromARGB(255, 193, 200, 221),
                         color:  const Color.fromARGB(255, 216, 222, 241),
                        borderRadius: BorderRadius.circular(100)),
                    child: IconButton(
                        onPressed: () {
                          add(sender!, reciever!, _message.text);
                          List ls = [];
                          if (mybox.get(4) != null) {
                            ls = mybox.get(4);
                            ls.add(Receiver_name.toString());
                            mybox.put(4, ls);
                          } else {
                            ls.add(Receiver_name.toString());
                            mybox.put(4, ls);
                          }
                        },
                        icon: Icon(
                          Icons.send,
                          size: 33,color:  const Color.fromARGB(255, 54, 62, 88),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
