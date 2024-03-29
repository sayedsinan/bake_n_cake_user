import 'package:bake_n_cake_user_side/combonents/my_text_field.dart';
import 'package:bake_n_cake_user_side/model/messeage.dart';
import 'package:bake_n_cake_user_side/view/chat/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MesseageController extends GetxController {
  final TextEditingController message = TextEditingController();
  final reciver = 'GaLJKbvQMFTWVWFwifItB9F8u8P2';
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth fireAut = FirebaseAuth.instance;
  Future<void> sendMesseage(String reciverId, String message) async {
    final String currentUserId = fireAut.currentUser!.uid;
    final String currentUserEmail = fireAut.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();
    Messeage newMessage = Messeage(
        senderUserId: currentUserId,
        senderEmail: currentUserEmail,
        reciverId: reciverId,
        messeage: message,
        timestamp: timestamp);
    List<String> ids = [currentUserId, reciverId];
    ids.sort();
    String chatroomId = ids.join("_");
    await firestore
        .collection('chat_rooms')
        .doc(chatroomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  Stream<QuerySnapshot> getMesseage(String userId, String otherUserId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");
  
    return firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  void sendMessage() async {
    if (message.text.isNotEmpty) {
      await sendMesseage(reciver, message.text);
      message.clear();
    }
  }

  Widget builtMesseageInput() {
    return Row(
      children: [
        Expanded(
          child: MyTextField(
            controller: message,
            hintText: 'Enter Message',
            obscureText: false,
          ),
        ),
        IconButton(onPressed: sendMessage, icon:const  Icon(Icons.send))
      ],
    );
  }

  Widget buildeMesseageList() {
    return StreamBuilder(
      stream: getMesseage(reciver, fireAut.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
        // Print stream error
          return Text("Error: ${snapshot.error}");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const  Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
     
          return const Text("No messages available");
        }

        QuerySnapshot querySnapshot = snapshot.data as QuerySnapshot;

        // Access the list of documents
        List<DocumentSnapshot> docs = querySnapshot.docs;

        // Build a ListView with the document data
        return ListView.builder(
          itemCount: docs.length,
          itemBuilder: (BuildContext context, int index) {
            // Access the document data for each document
            Map<String, dynamic> data =
                docs[index].data() as Map<String, dynamic>;
            var alignment = (data['senderId'] == fireAut.currentUser!.uid)
                ? Alignment.centerRight
                : Alignment.centerLeft;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: alignment,
                child: Column(
                  children: [
                    ChatBubble(
                      messeage: data['message'],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget builtMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    var alignment = (data['senderId'] == fireAut.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;
    return Container(
      alignment: alignment,
      child: Column(
        children: [
          Text(data['message']),
        ],
      ),
    );
  }
}
