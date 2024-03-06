import 'package:bake_n_cake_user_side/combonents/my_text_field.dart';
import 'package:bake_n_cake_user_side/model/messeage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MesseageController extends GetxController {
  final TextEditingController message = TextEditingController();

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
      time: timestamp,
    );
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
      await sendMesseage('receiverId', message.text);
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
        IconButton(onPressed: sendMessage, icon: Icon(Icons.send))
      ],
    );
  }

}
