import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _message = TextEditingController();

    final mybox = Hive.box('mybox');

    final sender = mybox.get(1);
    final reciever = mybox.get(2);

    Future<void> add(String sender, String receiver, String message) async {
      FirebaseFirestore.instance.collection("messages").add({
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

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          children: [
            Container(
                height: 100,
                width: double.infinity,
                color: Colors.brown.shade200,
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(left: 12, right: 12, bottom: 10),
                child: Row(
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white),
                    )
                  ],
                )),
            Expanded(
                child: Container(
              child: StreamBuilder(
                stream: getMessages(sender, reciever),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Something went wrong"),
                    );
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: Text("No Message Yet"),
                    );
                  }

                  final message = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: message.length,
                    itemBuilder: (context, index) {
                      final messageData =
                          message[index].data() as Map<String, dynamic>;
                      print(messageData);
                      final isMe = messageData["sender"] == sender;
                      return Align(
                        alignment:
                            isMe ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(left: 5, right: 5),
                          padding: EdgeInsets.all(3.5),
                          decoration: BoxDecoration(
                              color: isMe
                                  ? Colors.blueAccent
                                  : Colors.grey.shade300),
                          child: Text(messageData["message"]),
                        ),
                      );
                    },
                  );
                },
              ),
            )),
            Container(
              height: 1,
              width: double.infinity,
              child: Divider(),
            ),
            Container(
              height: 90,
              width: double.infinity,
              margin: EdgeInsets.all(1.5),
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  // border: Border.all(),
                  ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          color: Colors.brown.shade50,
                          borderRadius: BorderRadius.circular(100)),
                      child: Row(
                        children: [
                          IconButton(onPressed: () {}, icon: Icon(Icons.mic)),
                          Expanded(
                            child: TextField(
                              controller: _message,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Messages...",
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
                        color: Colors.brown.shade50,
                        borderRadius: BorderRadius.circular(100)),
                    child: IconButton(
                        onPressed: () {
                          add(sender, reciever, _message.text);
                        },
                        icon: Icon(
                          Icons.send,
                          size: 33,
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
